#!/usr/bin/env ruby

gem "tinify"
require "tinify"
require "fileutils"

modus, *input_array = ARGV

$i = 0

if input_array.length > 0 
	while $i < input_array.length do

	target_base = File.dirname(input_array[$i])+"\\"
	typa = File.extname(input_array[$i])
	target_file = File.basename(input_array[$i], typa)+"-"+modus+typa
	target = target_base+target_file
	target = target.gsub(' ','_')
	FileUtils.cp(input_array[$i],target)
	
	puts(target)
	if modus != "tiny"
		puts(system("magick.exe mogrify -resize "+modus+"x"+modus+" "+target))
	end
	Tinify.key = "";   #Add your Tinyjpg.com API Code here
	
	
	source = Tinify.from_file(target) #"large.jpg"
	
	source.to_file(target)
	puts("Tinified")	
	
	$i +=1
	end 
else 
	puts "+++++ Error +++++"
	puts "Maybe the programm just started missing the parameter which contains the mode, like 'tiny' or '1000'. Use a shortcut or cli!"
	print "Closing Programm: "
	1.upto(9).each { 
	|i| print 10-i 
	sleep(1)
	}
	
end
