#!/usr/local/bin/ruby

#This is an script that takes the name of a file and creates a new file with the lines 
#written out in a random order without reading the whole file into memmory

filename = ARGV[0]

unless filename
  p "usage #{$0} <Name of input file> <Name of output file>"
  exit(0)
end

target_filename = ARGV[1] || filename + ".scrambled"

#create an array of line numbers and shuffle it
lines = []

file_in = File.open(filename)
index = 0
lines[index] = file_in.pos
file_in.each_line do |line|
  index = index+1
  lines[index] = file_in.pos
end

num_lines = index
puts "Infile has #{num_lines} lines"

#remove the last item as it will be the end of the position at the end of the file
lines.pop
#shuffle the array
lines.shuffle!

file_out = File.open(target_filename, 'w')

lines.each do |i|
  #set the file postition to a specific line,
  file_in.pos = i
  #read that line
  curr_line = file_in.gets
  file_out << curr_line
end

file_in.close
file_out.close

puts "write #{num_lines} lines"

exit(0)
