#!/usr/bin/ruby -w

require_relative 'irssiparse' #this can be stored in a variable if needed

def read_file(filename, date)
  parse_date(date)
  File.open(filename, "r") do |infile|
    while (line = infile.gets)
      if !get_state
        break
      end
      parse(line)
    end
  end
end
