#!/usr/bin/ruby -w

# --- Log opened Sat Jan 06 18:28:43 2014
#--- Day changed Sat Jan 25 2014
#18:30 kubunto: but then again money is in streaming anyway

MONTHS = {
 '01' =>  'Jan',
 '02' =>  'Feb',
 '03' =>  'Mar',
 '04' =>  'Apr',
 '05' =>  'May',
 '06' =>  'Jun',
 '07' =>  'Jul',
 '08' =>  'Aug',
 '09' =>  'Sep',
 '10' =>  'Oct',
 '11' =>  'Nov',
 '12' =>  'Dec',
}

@fastforward = true
@play = false

def get_month(month)
  if MONTHS.has_key?(month)
    return MONTHS[month]
  else
    puts "Whoops something is bad with this month"
  end
end 

def parse(line)
  if @fastforward
# --- Log opened Sat Sep 06 18:28:43 2014
#--- Day changed Sat Jan 25 2014
    if line[/opened\s\w\w\w\s#{@month}\s#{@day}\s\d\d:\d\d:\d\d\s#{@year}/] || # is a good starting line
       line[/Day\schanged\s\w\w\w\s#{@month}\s#{@day}\s#{@year}/]
      @play = true
      @fastforward = false
      puts line
    end
  elsif @play
#--- Day changed Sat Jan 25 2014
# --- Log opened Sat Sep 06 18:28:43 2014
    if !(line[/opened\s\w\w\w\s#{@month}\s#{@day}\s\d\d:\d\d:\d\d\s#{@year}/] &&  #is not the last line
       line[/Day\schanged\s\w\w\w\s#{@month}\s#{@day}\s#{@year}/])
      puts line
    else
      @play = false
    end
  end  
end

def get_state
  return @play || @fastforward
end

def parse_date(date)
  values = date.split('/')
  if values.length == 3
    @month = get_month(values[0])
    @day = values[1]
    @year = values[2]
  end
end
