#!/usr/bin/env ruby

require "./lib/environment"
require "pry"

parser = LogParser::Base.new(
  filename: ARGV[0],
  processors: [
    LogParser::MostPageViews.new,
    LogParser::MostUniquePageViews.new
  ]
)

if parser.process
  parser.results.each do |report|
    puts "-" * 20
    puts report.title, ""
    report.value.each do |report_entry|
      puts "#{report_entry[0]} #{report_entry[1]}"
    end
  end
else
  parser.errors.each do |error|
    puts error
  end
  exit(1)
end

  
