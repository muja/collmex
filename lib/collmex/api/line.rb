class Collmex::Api::Line
  SPECIFICATION = [{}]

  def self.specification
    self::SPECIFICATION
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
        hash[field_spec[:name]] = nil
      end
    end
    hash
  end

  # returns a hash of the line that inherits from the default_hash but gets
  # filled with its contents.
  def self.hashify(data)
    hash = default_hash
    spec = specification
    if Array === data || String === data && data = CSV.parse_line(data, Collmex.csv_opts)
      spec.each_with_index do |field_spec, index|
        if data[index] and not field_spec.has_key? :const
          hash[field_spec[:name]] = Collmex::Api.parse_field(data[index], field_spec[:type])
        end
      end
    elsif Hash === data
      data.each do |name, value|
        raise ArgumentError.new("Undefined field (#{name} in #{self.class})") unless hash.key? name
        spec = self.send(name)
        raise ArgumentError.new("Cannot override constant! (#{name} in #{self.class})") if spec.key? :const
        hash[name] = Collmex::Api.parse_field(value, spec[:type])
      end
    end
    hash
  end

  def self.subclasses
    Collmex::Api.constants.map{|x| Collmex::Api.const_get(x)}.select{|x| x.is_a? Class and x.superclass == self}
  end

  def self.method_missing(m, *args, &block)
    super if args.size > 0 or block_given?
    specification.find{|x| x[:name] == m} || super
  end

  def valid?
    self.class.specification.each do |spec|
      return false if spec[:required] and @hash[spec[:name]].nil?
    end
    true
  end

  def initialize(arg = {})
    @hash = self.class.hashify(arg)
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
    to_hash
  end

  def to_hash
    @hash
  end

  def to_s
    to_csv.chomp
  end

  def method_missing(m, *args, &block)
    super if block_given?

    field = m.to_s.split("=").first.to_sym

    super unless @hash.key? field

    assignment = m.to_s.end_with? '='

    args_should = assignment ? 1 : 0

    raise ArgumentError.new("wrong number of arguments (#{args.size} for #{args_should})") if args_should != args.size

    if assignment
      raise ArgumentError.new("Cannot assign to const field (#{field})") if self.class.send(field).key? :const
      @hash[field] = args.first
    else
      @hash[field]
    end
  end
end