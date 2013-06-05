require_relative 'rubify'

module Rubify
  class Patch
    attr_accessor :name, :set_name, :set_type, :set_const, :set_default, :classes

    def initialize(opts = {})
      opts.each_pair do |attribute, value|
        send "#{attribute}=", value
      end
    end
  end

  class Patcher
    attr_reader :patches

    def default_hash
      @opts ||= {classes: ::Rubify.all_classes(@dir)}
    end

  	def initialize(classes_dir = ".")
  		@dir = classes_dir
  		@patches = []
  	end

    def register(opts = {})
      raise "Must provide value for :name" unless opts[:name]
      opts = default_hash.merge opts
      @patches << opts
      true
    end

    def unregister patch
      patch = [patch] unless patch.is_a? Array
      size = @patches.size
      @patches -= patch
      size < @patches.size
    end

    def apply(patch, files = nil, sources = nil)
      files   = [files]   unless Array === files
      sources = [sources] unless Array === sources

      classes = patch[:classes]
      name = patch[:name]

      name_regex = /name:\s*:#{name}/.source

      classes.each_with_index do |klass, index|
        path = get_file_for_class(klass)

        file_given   = !files[index].nil?
        source_given = !sources[index].nil?

        file = if file_given
          files[index]
        else
          File.open(path, "r+")
        end

        source = if source_given
          sources[index]
        else
          file.read
        end

        patch.each_pair do |k, v|
          case k
          when :set_type, :set_const, :set_default
            key = k[4..-1]
            regex = /#{key}:\s*(:|"|')?\S+("|')?/
              ## Warning:
              # e.g. 'default: "in Arbeit"' is going to fail due to \S+ (" " is whitespace)
              # -> parser? replace " " with "\u0020" everywhere?
            source.gsub!(/(#{name_regex}.*?),?\s*#{regex}/){$1}
            source.gsub!(/(#{name_regex}[^}]*)/){"#{$1.rstrip}, #{key}: #{v} "}
          end
        end
        if patch[:set_name]
          source.gsub!(/#{name_regex}/, "name: :#{v}")
        end

        file.puts source unless source_given # if source for this class was given, do not write to file
        file.close unless file_given # close the file if it was opened locally
      end
    end

    def apply_all_patches
      @patches.each do |patch|
        apply patch
      end
    end

    def register_all(patch_dir = File.join(__dir__, 'patches'))
      Dir.entries(patch_dir).without("base.rb").each do |file|
        next unless file.end_with? ".rb"
        puts File.join(patch_dir, file)
        filename = File.join(patch_dir, file)
        instance_eval File.read(filename), filename
      end
    end

    def apply_all_patches_from_scratch
      register_all
      apply_all_patches
    end

    def from_scratch
      apply_all_patches_from_scratch
    end
    
    private
    def get_file_for_class name
      File.join @dir, "#{name.to_s.symbolize}.rb"
    end
  end
end