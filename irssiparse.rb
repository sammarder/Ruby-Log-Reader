#!/usr/bin/ruby -w

# --- Log opened Sat Sep 06 18:28:43 2014
#--- Day changed Sat Jan 25 2014
#18:30 kubunto: but then again money is in streaming anyway
def parse(line)
  isUseful = false
  puts @month
  if line[/\d\d:\d\d [a-zA-Z]/]
    puts "this line maches as a conversation line"
  elsif line[/--- Log/]
    puts 'this line matches as a log line'
  end
end

def parse_date(date)
  values = date.split('/')
  if values.length == 3
    @month = get_month(values[0])
    @day = values[1]
    @year = values[2]
  end
end

def get_month(month)
  case month
  when '01'
    return 'Jan'
  when '02'
    return 'Feb'
  when '03'
    return 'Mar'
  when '04'
    return 'Apr'
  when '05'
    return 'May'
  when '06'
    return 'Jun'
  when '07'
    return 'Jul'
  when '08'
    return 'Aug'
  when '09'
    return 'Sep'
  when '10'
    return 'Oct'
  when '11'
    return 'Nov'
  when '12'
    return 'Dec'
  else
    puts 'Woops, that was bad'
  end
end
