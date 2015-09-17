#!/usr/bin/env ruby -w

$LOAD_PATH << '.'

require 'kcsv'

files = if ARGV.empty?
          Dir.glob("testdatafiles/*")
        else
          ARGV
        end

if files.empty?
  puts "usage: #{$0} file1.csv [file2.csv ...]"
  exit(-1)
end

files.each do |csvfile|
  
  header = Kcsv.extract_header(csvfile)
  
  puts "  header in ruby: " + header.inspect unless header.nil?
  
  i = 0
  s1 = Kcsv.foreach(csvfile) do |row|
    i = i + 1
    puts "  row#{i} = #{row.inspect}" unless i > 20
  end
  
  unless s1.nil?
    s1.each_pair do |index, s|
      puts index
      if s.is_a?(String)
        puts "  #{s}"
      elsif s.is_a?(Array)
        s.each do |s2|
          puts "  #{s2}"
        end
      end
    end
  end
  puts "\n\n"
end
