#!/usr/bin/ruby -w

require_relative 'parser' #this can be stored in a variable if needed
require 'date'

class Fileparser

  D_FORMAT = '%m/%d/%Y'
    
  def initialize
    @parser = Parser.new
  end 

  def read_file(filename, date)
    parse_date(date)
    if !File.exist?(filename)
      puts 'This file does not exist'
      return
    end
    File.open(filename, "r") do |infile|
      while (line = infile.gets)
        if !@parser.state
          break
        end
        @parser.parse(line)
      end
    end
  end
  
  def parse_date(date)
    @parser.set_date(Date.strptime(date, D_FORMAT))
  end
end
