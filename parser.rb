#!/usr/bin/ruby -w

# --- Log opened Sat Jan 06 18:28:43 2014
#--- Day changed Sat Jan 25 2014
#18:30 kubunto: but then again money is in streaming anyway

require 'date'

class Parser
  OC_FORMAT = '%a %b %d %H:%M:%S %Y'
  DC_FORMAT = '%a %b %d %Y'
  D_FORMAT = '%m/%d/%Y'
  OPEN = "Log opened "  
  CLOSE = "Log closed "
  CHANGE = "Day changed "

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

  #once function finishes, it automatically returns nil
  def get_date(line)
    if line[0,3] != "---"
      return nil
    end
    source = get_source(line)
    format = (line[OPEN] != nil || 
        line[CLOSE] != nil) ? OC_FORMAT : DC_FORMAT
    if source != nil
      return Date.strptime(source, format)
    end
  end

  def get_source(line)
    if line[OPEN] != nil
      return line.split(OPEN)[1]        
    elsif line[CLOSE] != nil
      return line.split(CLOSE)[1]
    elsif line[CHANGE] != nil
      return line.split(CHANGE)[1]
    end
  end

  def get_state
    return @play || @fastforward
  end

  def set_date(date)
    @date = date
  end
end
