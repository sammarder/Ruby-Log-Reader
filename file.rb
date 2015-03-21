#!/usr/bin/ruby -w

require_relative 'irssiparse'

def readfile(filename, date)
  parsedate(date)
  File.open(filename, "r") do |infile|
    while (line = infile.gets)
      parse(line)
    end
  end
end
