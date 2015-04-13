#!/usr/bin/ruby -w

# --- Log opened Sat Jan 06 18:28:43 2014
#--- Day changed Sat Jan 25 2014
#18:30 kubunto: but then again money is in streaming anyway

require 'date'

class Parser
  OC_FORMAT = '%a %b %d %H:%M:%S %Y'
  DC_FORMAT = '%a %b %d %Y'
  D_FORMAT = '%m/%d/%Y'
  OPEN = "opened "  
  CLOSE = "closed "
  CHANGE = "changed "

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
      source = nil
      if line[OPEN] != nil
        source = line.split(OPEN)[1]        
      elsif line[CLOSE] != nil
        source = line.split(CLOSE)[1]
      elsif line[CHANGE] != nil
        source = line.split(CHANGE)[1]
      end
      format = (line[OPEN] != nil || 
          line[CLOSE] != nil) ? OC_FORMAT : DC_FORMAT
      if source != nil
        date = Date.strptime(source, format)
      end
    end
    return date
  end

  def get_state
    return @play || @fastforward
  end

  def parse_date(date)
    @date = Date.strptime(date, D_FORMAT)
  end
end
