#!/usr/bin/ruby -w

# --- Log opened Sat Sep 06 18:28:43 2014
#--- Day changed Sat Jan 25 2014
#18:30 kubunto: but then again money is in streaming anyway
def parse(line)
	if line[/\d\d:\d\d [a-zA-Z]/]
		puts "this line maches as a conversation line"
	elsif line[/--- Log/]
		puts 'this line matches as a log line'
	end
end

def parsedate(date)
	values = date.split('/')
	if values.length == 3
		@month = getmonth(values[0])
		@day = values[1]
		@year = values[2]
	end
end

def getmonth(month)
	case month
	when 1
		return 'Jan'
	when 2
		return 'Feb'
	when 3
		return 'Mar'
	when 4
		return 'Apr'
	when 5
		return 'May'
	when 6
		return 'Jun'
	when 7
		return 'Jul'
	when 8
		return 'Aug'
	when 9
		return 'Sep'
	when 10
		return 'Oct'
	when 11
		return 'Nov'
	when 12
		return 'Dec'
	else
		puts 'Woops, that was bad'
	end
end
