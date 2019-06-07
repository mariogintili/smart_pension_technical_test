module LogParser
  class Report
    attr_accessor :title, :value

    def initialize(title:, value:)
      @title = title
      @value = value
    end
  end
end
