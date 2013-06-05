require 'nokogiri'
require 'open-uri'

module Rubify
  def self.rubify(in_url, out_dir = ".")
    puts "in_url: #{in_url}"

    page = Nokogiri::HTML(open(in_url))

    tables = page.css('table.help') # get tables where information lies

    tables.each do |table|
      entries = table.css('tr').drop 1 # first row is meta-row
      filename = entries[0].css('td.help')[4].text.strip
      classname = nil
      raise "Kein Festwert! url: #{in_url}" unless /^Festwert (.+?)$/ =~ filename
      value = $1
      filename = "#{value.downcase}.rb" # FOO_BAR -> foo_bar.rb
      classname = value.classify # foo_bar -> FooBar
      puts classname
      f = File.open(filename, "w")
      f.puts "# #{in_url}" # put url for reference
      f.puts ""
      f.puts "class Collmex::Api::#{classname} < Collmex::Api::Line"
      f.puts "  def self.specification"
      f.puts "    ["
      entries.each do |entry|

        name = entry.css('td.help')[1]
        next if name.nil? # collmex provides multicolumns sometimes
        name = name.text.symbolize

        type = entry.css('td.help')[2].text
        type = "C" if type.size == 0 # happens
        type = typify type

        desc = entry.css('td.help')[4]
        desc = desc.text.strip unless desc.nil?

        f.print("      { name: :#{name}, type: :#{type}")
        if /^Festwert (.*?)$/ =~ desc
          constval = $1
          f.print ", const: \"#{constval}\""
        end
        f.puts " },"
      end
      f.puts "    ]"
      f.puts "  end"

      f.puts "end"
    end
  end

  def self.rubify_all(out_dir = ".")
    all_api_sites.each do |uri|
      rubify(uri, out_dir)
    end
  end

  def self.all_api_sites
    api_html = Nokogiri::HTML(open("http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api"))

    index = []

    api_html.css("ul[type='circle']").each do |ul|
      ul.css("li a").each do |a| # iterate over each link in api index
        index << ("http://www.collmex.de" << a['href'])
      end
    end

    index
  end

  def self.all_classes(dir = ".")
    classes = []
    Dir.entries(dir).keep_if do |entry|
      entry.end_with? ".rb"
    end.without("line.rb").each do |entry|
      classes << entry.classify
    end
    classes
  end

  private
  def self.typify(type)
    case type
    when /[IN]/
      "integer"
    when /[CT5]/
      "string"
    when "M"
      "currency"
    when "D"
      "date"
    else
      raise "No type #{type}"
    end
  end
end

class String
  def symbolize
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    downcase.
    gsub(/[\- \/]+/, "_"). # "Foo-/bar tar" -> "foo__bar_tar"
    gsub("ö", "oe").gsub("ä", "ae").gsub("ü", "ue").gsub("ß", "ss").
    gsub(/\(.*?\)/, ''). # waehrung_(iso_codes) => waehrung_
    gsub(/(:|\.)+/, '_'). # foo::bar => foo_bar
    gsub(/__+/, '_'). # foo____bar => foo_bar
    gsub(/_$/, '') # foo_ => foo
  end

  def camelize
    gsub(/[\-_\s]+(\w)/){$1.capitalize}
  end

  def classify
    s = symbolize.camelize
    s[0] = s[0].upcase
    s
  end
end

class Array
  def without *a
    self - a.flatten
  end
end