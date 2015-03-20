#!/usr/bin/ruby -w

# --- Log opened Sat Sep 06 18:28:43 2014
#18:30 kubunto: but then again money is in streaming anyway
def parse(line)
	if line[/\d\d:\d\d [a-zA-Z]/]
		puts "this line maches as a conversation line"
	elsif line[/--- Log/]
		puts 'this line matches as a log line'
	end
end
