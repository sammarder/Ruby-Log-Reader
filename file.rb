#!/usr/bin/ruby -w

require_relative 'irssiparse'

def read_file(filename, date)
  parse_date(date)
  File.open(filename, "r") do |infile|
    while (line = infile.gets && get_state)
      parse(line)
    end
  end
end
