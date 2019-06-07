module LogParser
  class MostPageViews
    def call(lines:, errors:)
      report = lines.reduce(Hash.new(0)) do |memo, line|
        begin
          if valid?(line: line, errors: errors)
            memo[line.split(" ")[0]] += 1
          else
            errors.push(StandardError.new("Unable to parse #{line}"))
          end
        rescue => error
          errors.push(error)
        end
        memo
      end
      
      if errors.empty?
        Report.new(
          title: "Most Page views",
          value: report.sort_by { |k,v| v }.reverse
        )
      end
    end

    private

    def valid?(line:, errors:)
      splitted = line.split(" ")
      path = splitted[0]
      path.match(PATH_REGEX)
    end
  end
end
