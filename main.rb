#!/usr/bin/ruby -w

require_relative 'file_parser'
require 'slop'

fp = Fileparser.new
if ARGV.length == 4
  opts = Slop.parse do |o|
    o.string '-f', '--file', 'a log file'
    o.string '-d', '--date', 'a date'
  end
  fp.read_file(opts[:file], opts[:date])
else
  puts 'What file do you want to look into?'
  filename = gets.chomp
  puts 'What day do you want to look at? (MM/DD/YYYY)'
  date = gets.chomp
  fp.read_file(filename, date)
end


