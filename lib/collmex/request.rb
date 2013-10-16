require "net/http"
require "uri"


class Collmex::Request
  attr_reader :response
  attr_accessor :commands, :http

  def self.run(&block)
    new.tap do |request|
      request.instance_eval &block if block_given?
      request.execute
    end
  end

  def enqueue(command, args = {})
    if command.is_a? Symbol or command.is_a? String
      add_command Collmex::Api::const_get(command.to_s.split(/_|-/).map(&:capitalize).join).new(args)
    elsif Collmex::Api.is_a_collmex_api_line_obj?(command)
      add_command command
    else
      return false
    end
    self
  end

  def initialize
    @commands = []

    if Collmex.benutzer and Collmex.passwort and Collmex.kundennummer
      add_command Collmex::Api::Login.new(benutzer: Collmex.benutzer, passwort: Collmex.passwort)
    else
      raise "No credentials for collmex given"
    end
  end

  def add_command(cmd)
    @commands << cmd
    cmd
  end

  def self.uri
    URI.parse "https://www.collmex4.de/cgi-bin/cgi.exe\?#{Collmex.kundennummer},0,data_exchange"
  end

  def self.header_attributes
    {"Content-Type" => "text/csv"}
  end

  def payload
    @commands.map { |c| c.to_csv }.join
  end

  def execute
    execute_raw(payload)
  end

  def execute_raw csv
    valid_commands = @commands.take_while(&:valid?)
    raise "A " << @commands[valid_commands.size].class << " request is not valid." if valid_commands.size != @commands.size # Some command isn't valid
    @http = Net::HTTP.new(Collmex::Request.uri.host, Collmex::Request.uri.port)
    @http.use_ssl = true
    @http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    # http://www.collmex.de/faq.html#zeichensatz_import

    encoded_body = csv.encode("ISO-8859-1", undef: :replace)    
    response = @http.request_post(Collmex::Request.uri.request_uri, encoded_body, Collmex::Request.header_attributes)
    response.body.force_encoding("ISO-8859-1") if response.body.encoding.to_s == "ASCII-8BIT"

    raw_response = {}

    raw_response[:string] = response.body.encode("UTF-8")

    begin
      raw_response[:array] = CSV.parse(raw_response[:string], Collmex.csv_opts)
    rescue => e
      $stderr.puts "CSV.parse failed with string: #{raw_response[:string]}"
      raise e
    end

    @response = Collmex::Response.parse_response(raw_response)
  end
end
