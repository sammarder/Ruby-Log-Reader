#!/usr/bin/ruby -w

counter = 1
File.open("/home/sam/irclogs/freenodeSSL/busybear.log", "r") do |infile|
	while (line = infile.gets)
		puts "#{counter}: #{line}"
		counter = counter + 1
	end
end