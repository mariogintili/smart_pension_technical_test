module LogParser
  class MostUniquePageViews
    def call(lines:, errors:)
      grouped_by_unique_view = lines.reduce({}) do |memo, line|
        begin
          if valid?(line: line, errors: errors)
            process_line(line: line, memo: memo)
          else
            errors.push(StandardError.new("Unable to parse #{line}"))
          end
          memo
        rescue => error
          errors.push(error)
        end
      end

      if errors.empty?
        value = grouped_by_unique_view.reduce({}) do |memo, (key, subreport)|
          memo[key] = subreport.values.max
          memo
        end

        Report.new(
          title: "Most Unique Page views",
          value: value.sort_by { |k,v| v }.reverse
        )
      end
    end

    private

    def process_line(line:, memo:)
      path, ip = line.split(" ")
      memo[path] ||= {}

      if memo[path][ip]
        memo[path][ip] += 1
      else
        memo[path][ip] = 1
      end
    end

    def valid?(line:, errors:)
      splitted = line.split(" ")
      path = splitted[0]
      path.match(PATH_REGEX)
    end
  end
end
