#!/usr/bin/ruby -w

require_relative 'file'


#TODO figure out how to stream things through ruby!
puts 'What file do you want to look into?'
filename = gets.chomp
puts 'What day do you want to look at? (MM/DD/YYYY)'
date = gets.chomp
File.open('/home/sam/irclogs/freenodeSSL/afusionrifle.log', "r")
readfile(filename, date)#still need to determine more things
