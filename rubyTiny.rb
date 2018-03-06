#!/usr/bin/env ruby

# Nutzt den Webservice tinypng.com um .jpg und .png Dateien zu komprimieren.
# Kann vorher das Bild auf eine gewünschte Größe skalieren.
# Funktioniert nur über Drag-and-Drop oder die Kommandozeile
# ---
# **erster Parameter**
# tiny - komprimiert allein, Abmessungen bleiben erhalten
# 1000 - oder jede beliebige andere Zahl, skaliert und komprimiert auf maximal 1000 Pixel Kantenlänge

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
	puts "+++++ Fehler +++++"
	puts "Vermutlich wurde die .exe Datei ohne Parameter gestartet. Bitte immer den Modus (tiny,855,1280,etc.) und den Pfad zur Datei übergeben. Das geht ganz einfach mit einer Verknüpfung."
	print "Beende Programm: "
	1.upto(5).each { 
	|i| print 6-i 
	sleep(1)
	}
	
end
