#!/usr/bin/env ruby

$LOAD_PATH << File.join(File.dirname(__FILE__), "lib")

require "optparse"
require "ascii"

options = { :size => 1 }

opts = OptionParser.new
opts.on("-s", "--size VAL", Integer, "Size of lcd numbers") {|val| options[:size] = val} 

opts.parse!

numbers = ARGV.pop || raise("usage: lcd.rb [-s <size>] <numbers>")

puts numbers.split("").
	join(" ").split("").
	map { |c| Ascii.from_char(c) }.
	reduce(Ascii::EMPTY) { |sum_ascii, ascii| sum_ascii + ascii }.
	draw(options[:size])

