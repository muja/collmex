module Collmex
  class Response
    attr_reader :data, :messages, :code, :raw

    def initialize(opts = {})
      @data = opts[:data]
      @messages = opts[:messages]
      @code = opts[:code]
      @raw = opts[:raw]
    end

    # @return
    # `true` if the response contains errors, `false` otherwise
    def errors?
      @code & ERROR_MASK != 0
    end

    # @return
    # `true` if the response contains warnings, `false` otherwise
    def warnings?
      @code & WARNING_MASK != 0
    end

    def errors
      select_type ERROR
    end

    def warnings
      select_type WARNING
    end

    def notices
      select_type SUCCESS
    end

    def select_type(type)
      messages.select{|m| m.meldungstyp == type}
    end

    private :select_type




  # class methods
    ERROR_MASK   = 1 << 0
    WARNING_MASK = 1 << 1

    SUCCESS = "S"
    WARNING = "W"
    ERROR = "E"

    # Parses a response from a hash that holds an `:array` key
    # The provided value is treated as an array and should hold
    # response lines as specified by the Collmex API.
    # @return [Response]
    # a Response object holding information that the parameter holds
    def self.parse_response(raw_response)
      data = raw_response[:array].map { |l| Collmex::Api.parse_line(l) }
      message_filter = lambda { |e| Collmex::Api::Message === e }
      messages = data.select &message_filter
      data.delete_if &message_filter

      code = 0

      messages.each do |message|
        if message.meldungstyp == ERROR
          code |= ERROR_MASK
        elsif message.meldungstyp == WARNING
          code |= WARNING_MASK
        end
      end

      Response.new(data: data, messages: messages, code: code, raw: raw_response)
    end
  end
end