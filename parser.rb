#!/usr/bin/ruby -w

# --- Log opened Sat Jan 06 18:28:43 2014
#--- Day changed Sat Jan 25 2014
#18:30 kubunto: but then again money is in streaming anyway

require 'date'

class Parser
  def initialize
    @fastforward = true
    @play = false
  end

  def parse(line)
    date = get_date(line)
    if date === @date && @fastforward
      @play = true
      @fastforward = false
      puts line
    elsif @play
      if date != nil && date != @date
        @play = false
      else
        puts line
      end      
    end
  end

  def get_date(line)
    date = nil
    if line[0,3] === "---"
      if line["opened"] != nil
        string = line.split("opened ")[1]
        date = Date.strptime(string, '%a %b %d %H:%M:%S %Y')
      elsif line["closed"] != nil
        string = line.split("closed ")[1]
        date = Date.strptime(string, '%a %b %d %H:%M:%S %Y')
      elsif line["changed"] != nil
        string = line.split("changed ")[1]
        date = Date.strptime(string, '%a %b %d %Y')
      end
    end
    return date
  end

  def get_state
    return @play || @fastforward
  end

  def parse_date(date)
    @date = Date.strptime(date, "%m/%d/%Y")
  end
end
