module Collmex
  class Response
    attr_reader :data, :messages, :code, :raw

    def initialize(opts = {})
      @data = opts[:data]
      @messages = opts[:messages]
      @code = opts[:code]
      @raw = opts[:raw]
    end

    def errors?
      @code & ERROR_MASK != 0
    end

    def warnings?
      @code & WARNING_MASK != 0
    end

    ERROR_MASK   = 1
    WARNING_MASK = 2
    
    def self.parse_response(raw_response)
      data = raw_response[:array].map { |l| Collmex::Api.parse_line(l) }
      message_filter = lambda { |e| Collmex::Api::Message === e }
      messages = data.select &message_filter
      data.delete_if &message_filter

      code = 0

      messages.each do |message|
        if message.meldungstyp == "E"
          code |= ERROR_MASK
        elsif message.meldungstyp == "W"
          code |= WARNING_MASK
        end
      end

      Response.new(data: data, messages: messages, code: code, raw: raw_response)
    end
  end
end