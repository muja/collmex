class Collmex::Api::Line

  # Holds the specification of the line object
  def self.specification
    [{}]
  end

  # Return an empty default-hash of the line.
  def self.default_hash
    hash = {}
    self.specification.each_with_index do |field_spec, index|
      if field_spec.has_key? :const
        hash[field_spec[:name]] = field_spec[:const]
      elsif field_spec.has_key? :default
        hash[field_spec[:name]] = field_spec[:default]
      else
        hash[field_spec[:name]] = Collmex::Api.parse_field(nil, field_spec[:type])
      end
    end
    hash
  end

  # returns a hash of the line that inherits from the default_hash but gets
  # filled with its contents.
  def self.hashify(data)
    hash = self.default_hash
    fields_spec = self.specification
    if Array === data || String === data && data = CSV.parse_line(data,Collmex.csv_opts)
      fields_spec.each_with_index do |field_spec, index|
        unless data[index].nil? or field_spec.has_key? :const
          hash[field_spec[:name]] = Collmex::Api.parse_field(data[index], field_spec[:type])
        end
      end
    elsif Hash === data
      fields_spec.each_with_index do |field_spec, index|
        if data.key?(field_spec[:name]) && !field_spec.has_key?(:const)
          hash[field_spec[:name]] = Collmex::Api.parse_field(data[field_spec[:name]], field_spec[:type])
        end
      end
    end
    hash
  end


  def initialize(arg = nil)
    @hash = self.class.default_hash
    @hash = @hash.merge(self.class.hashify(arg)) if !arg.nil?
    if self.class.specification.empty? && self.class.name.to_s != "Collmex::Api::Line"
      raise "#{self.class.name} has no specification"
    end
  end


  def to_a
    array = []
    self.class.specification.each do |spec|
      array << @hash[spec[:name]]
    end
    array
  end

  def to_stringified_array
    array = []
    self.class.specification.each do |spec|
      array << Collmex::Api.stringify(@hash[spec[:name]], spec[:type])
    end
    array
  end

  def to_csv
    CSV.generate_line(self.to_stringified_array, Collmex.csv_opts)
  end

  def to_h
    @hash
  end

  def method_missing(m, *args, &block)
    if m.to_s.end_with? "="
      @hash[m[0...-1].to_sym] = args.first
    else
      @hash[m.to_sym] || super
    end
  end
end
