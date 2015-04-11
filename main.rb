#!/usr/bin/ruby -w

require_relative 'file'

if ARGV.length == 4
  for i in 0..2 do
    if ARGV[i] === '-f' || ARGV[i] === '-file'
      filename = ARGV[i + 1]
    elsif ARGV[i] === '-d' || ARGV[i] === '-date'
      date = ARGV[i + 1]
    end 
  end
else
  puts 'What file do you want to look into?'
  filename = gets.chomp
  puts 'What day do you want to look at? (MM/DD/YYYY)'
  date = gets.chomp
end
fp = Fileparser.new
fp.read_file(filename, date)
