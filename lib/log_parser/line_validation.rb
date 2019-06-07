module LogParser
  module LineValidation
    def valid_line?(line:, errors:)
      splitted = line.split(" ")
      path = splitted[0]
      path.match(PATH_REGEX)
    end
  end
end
