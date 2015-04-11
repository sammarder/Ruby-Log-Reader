#!/usr/bin/ruby -w

require_relative 'irssiparse' #this can be stored in a variable if needed

class Fileparser
  def new
    @parser = Parse.new
  end 

  def read_file(filename, date)
    @parser.parse_date(date)
    File.open(filename, "r") do |infile|
      while (line = infile.gets)
        if !parser.get_state
          break
        end
        parse(line)
      end
    end
  end
end
