#!/usr/bin/ruby -w

require_relative 'parser' #this can be stored in a variable if needed

class Fileparser
  
  #def new
  #  @parser = Parser.new
  #end 

  def read_file(filename, date)
    if @parser === nil
      @parser = Parser.new
    end
    @parser.parse_date(date)
    File.open(filename, "r") do |infile|
      while (line = infile.gets)
        if !@parser.get_state
          break
        end
        @parser.parse(line)
      end
    end
  end
end
