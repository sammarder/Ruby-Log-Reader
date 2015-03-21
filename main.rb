#!/usr/bin/ruby -w

require_relative 'file'


#TODO figure out how to stream things through ruby!
puts 'What file do you want to look into?'
filename = gets
puts 'What day do you want to look at? (MM/DD/YYYY)'
date = gets
readfile(filename, date)#still need to determine more things
