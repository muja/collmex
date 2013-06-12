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

  def valid?
    self.class.specification.each_with_index do |field_spec, index|
      return false if field_spec[:required] and field_spec[:name].nil?
    end
    true
  end

  def initialize(arg = {})
    @hash = self.class.default_hash
    @hash = @hash.merge(self.class.hashify(arg))
    true
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

  def to_s
    to_csv.chomp
  end

  def method_missing(m, *args, &block)
    super if args.size > 1 or block_given?
    if m.to_s.end_with? '='
      @hash[m.delete('=').to_sym] = args.first
    else
      super unless @hash.has_key? m.to_sym
      @hash[m.to_sym]
    end
  end
end
