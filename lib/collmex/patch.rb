module Collmex::Patch
  def self.patch(*args, &block)
    raise "Cannot patch without block" unless block_given?
    classes = args.flatten
    classes.each do |klass|
      if klass.is_a? Class
        klass.class_eval &block
      elsif klass.strip == '*'
        raise "Cannot mix wildcard operator with other classes." if classes.size > 1
        Collmex::Api::Line.subclasses.each do |klass|
          begin
            patch klass, &block
          rescue NameError
          end
        end
      else
        patch Collmex::Api.line_class(klass), &block
      end
    end
  end

  def self.apply_patches
    dir = File.expand_path("../patch", __FILE__)

    Dir.entries(dir).each do |file|
      next unless file.end_with? ".rb"
      rb = File.join(dir, file)
      module_eval File.read(rb), rb
    end
  end
end