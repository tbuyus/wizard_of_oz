#!/usr/bin/sh
echo "sanitizing original html links"
chmod 666 images/*.jpg
chmod 666 43936/*.html

rm -r images/*.jpg
rm -r 43936/*.html

cp orig-43936/*.jpg images/
cp orig-43936/*.htm.html 43936/
cp orig-43936/*.css      43936/

chmod 666 images/*.jpg
chmod 666 43936/*.htm.html
#getting rid of most divs
#perl -p  -i -e 's/class=\"(shape_)*wrap_(area_)*(left|right)/class=\"/g' 43936/h-*.htm
rename  's/\@public\@vhost\@g\@gutenberg\@html\@files\@43936\@43936\-h\@images\@i//g' images/*.jpg
rename  's/_edit//g' images/*.jpg
rename  's/\@public\@vhost\@g\@gutenberg\@html\@files\@43936\@43936\-h\@43936\-//g' 43936/*.html
perl -p -i -e  's/\@public\@vhost\@g\@gutenberg\@html\@files\@43936\@43936\-h\@43936\-//g' 43936/*.html
perl -p -i -e  's/\.htm\.html/\.html/g' 43936/*.html
perl -p -i -e  's/_edit//g' 43936/*.html
perl -p -i -e  's/\@public\@vhost\@g\@gutenberg\@html\@files\@43936\@43936\-h\@images\@i//g' 43936/*.html
rename  's/\.htm\.html/\.html/g' 43936/*.html

