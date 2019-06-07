module LogParser
  PATH_REGEX = /^(\.\.\/(?:\.\.\/)*)?(?!.*?\/\/)(?!(?:.*\/)?\.+(?:\/|$)).+$/
  autoload :Base, "log_parser/base.rb"
  autoload :MostPageViews, "log_parser/most_page_views"
  autoload :MostUniquePageViews, "log_parser/most_unique_page_views"
  autoload :Report, "log_parser/report"
  autoload :LineValidation, "log_parser/line_validation"
end
