# rubyTiny
A little tool to resize a image and tinify using tinypng.com

== Build ==
gem install tinify
gem install fileutils
gem install ocra
ocra rubyTiny.rb --no-enc

== Need ==
- magick.exe
- magic.xml
from https://www.imagemagick.org/script/download.php

API Code from https://tinypng.com/developers

== Use ==
Use this tool, to "drag and drop" resize and tinify a .jpg or .png image.
Use a shortcut to the rubyTiny.exe, add a first parameter to it, like
- tiny = only tinify
- 1000 = or any kind of number (means 1000 Pixel) = resize and tinify

