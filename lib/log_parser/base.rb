module LogParser
  class Base
    attr_accessor :filename, :processors, :results

    def initialize(filename:, processors:)
      @filename = filename
      @processors = processors
      @results = []
    end

    def process
      read && process_lines && valid?
    end

    def errors
      @errors ||= []
    end

    def process_lines
      processors.each do |processor|
        results.push(processor.call(lines: lines, errors: errors))
      end
    end

    private

    def valid?
      errors.empty?
    end

    attr_accessor :lines

    def read
      @lines ||= begin
        IO.readlines(filename)
        rescue => error
          errors.push(error)
      end
    end
  end
end
