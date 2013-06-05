require "net/http"
require "uri"

module Collmex
  class Request
    attr_accessor :commands, :http
    attr_accessor :debug

    def self.run(&block)
      Request.new.tap do |request|
        request.instance_eval &block if block_given?
        request.execute
      end
    end

    def enqueue(command, args = {})
      if command.is_a? Symbol or command.is_a? String
        add_command Collmex::Api::const_get(command.to_s.classify).new(args)
      elsif Collmex::Api.is_a_collmex_api_line_obj?(command)
        add_command command
      else
        return false
      end
    end

    def initialize
      @commands     = []
      @raw_response = {}

      if Collmex.benutzer and Collmex.passwort and Collmex.kundennummer
        add_command Collmex::Api::Login.new({benutzer: Collmex.benutzer, passwort: Collmex.passwort})
      else
        raise "No credentials for collmex given"
      end
    end

    def add_command(cmd)
      @commands << cmd
      cmd
    end

    def self.uri
      URI.parse "https://www.collmex.de/cgi-bin/cgi.exe\?#{Collmex.kundennummer},0,data_exchange"
    end

    def self.header_attributes
      {"Content-Type" => "text/csv"}
    end

    def payload
      @commands.map { |c| c.to_csv }.join
    end

    def parse_response
      @response = @raw_response[:array].map { |l| Collmex::Api.parse_line(l) }
      @response
    end

    def parse_result
      return false unless @response
      @result = 1
      @response.each do |message|
        next unless message.class == Collmex::Api::Message
        if message.meldungstyp == "E"
          @result = 0
        elsif m.meldungstyp == "W" and @result != 0
          @result = 2
        end
      end
    end

    def success?
      @result == 1
    end

    def raw_response
      @raw_response
    end

    def response
      @response
    end

    def execute
      @http = Net::HTTP.new(Collmex::Request.uri.host, Collmex::Request.uri.port)
      @http.use_ssl = true
      @http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      # http://www.collmex.de/faq.html#zeichensatz_import
      encoded_body = payload.encode("ISO-8859-1", undef: :replace) # Do not blow up on undefined characters in ISO-8859-1
      response = @http.request_post(Collmex::Request.uri.request_uri, encoded_body, Collmex::Request.header_attributes)
      response.body.force_encoding("ISO-8859-1") if response.body.encoding.to_s == "ASCII-8BIT"

      @raw_response[:string] = response.body.encode("UTF-8")

      begin
        @raw_response[:array]  = CSV.parse(@raw_response[:string], Collmex.csv_opts)
      rescue => e
        $stderr.puts "CSV.parse failed with string: #{@raw_response[:string]}" if self.debug
        raise e
      end

      parse_response
      parse_result
      success?
    end
  end
end
