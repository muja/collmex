class Collmex::Patch

  class GlobalPatch < BasicObject
    def __patch__(klass, &block)
      @current_class = klass
      instance_eval &block
      @current_class = nil
      self
    end

    def method_missing(*args, &block)
      super unless @current_class
      begin
        @current_class.send(*args, &block)
      rescue ::NameError
        {}
      end
    end
  end

  def self.patch(*args, &block)
    raise "Cannot patch without block" unless block_given?
    classes = args.flatten
    classes.each do |klass|
      if klass.is_a? Class
        klass.class_eval &block
      elsif klass.strip == '*'
        raise ArgumentError.new("Cannot mix wildcard operator with other classes.") if classes.size > 1
        global = GlobalPatch.new
        Collmex::Api::Line.subclasses.each do |klass|
          global.__patch__(klass, &block)
        end
      else
        patch Collmex::Api.line_class(klass), &block
      end
    end
  end

  def self.apply_patches

    puts "Patching collmex..."
    dir = File.expand_path("../patch", __FILE__)

    global = File.join(dir, "_global.rb");

    class_eval File.read(global), global

    (Dir.entries(dir) - ["_global.rb"]).each do |file|
      next unless file.end_with? ".rb"
      rb = File.join(dir, file)
      class_eval File.read(rb), rb
    end
  end
end