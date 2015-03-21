#!/usr/bin/ruby -w

# --- Log opened Sat Sep 06 18:28:43 2014
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

def get_month(month)
  if MONTHS.has_key?(month)
    return MONTHS[month]
  else
    puts "Whoops somethign is bad with this month"
  end
end 

def parse(line)
  isUseful = false
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
