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
      if date && date != @date
        @play = false
      else
        puts line
      end      
    end
  end

  #once function finishes, it automatically returns nil
  def get_date(line)
    return unless line.starts_with?('---')
    source = get_source(line)
    format = (line[OPEN] || line[CLOSE]) ? OC_FORMAT : DC_FORMAT
    if source
      return Date.strptime(source, format)
    end
  end

  def get_source(line)
    if line[OPEN]
      return line.split(OPEN)[1]        
    elsif line[CLOSE]
      return line.split(CLOSE)[1]
    elsif line[CHANGE]
      return line.split(CHANGE)[1]
    end
  end

  def state
    return @play || @fastforward
  end

  def set_date(date)
    @date = date
  end
end
