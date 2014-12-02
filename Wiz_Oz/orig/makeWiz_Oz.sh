#!/usr/bin/sh

echo "sanitizing file names and internal links: removing all gutenberg directory structure from filenames"
. sanitizeLinks.sh

echo "cleaning original html files"

#getting rid of most divs
perl -p  -i -e 's/class=\"(shape_)*wrap_(area_)*(left|right)/class=\"/g' 43936/h-*.html
perl -p  -i -e 's/class=\"fig(center|right)/class=\"/g' 43936/h-*.html
perl -p  -i -e 's/class=\"(right|left)2* c[0-9][0-9]*[0-9]*/class=\"/g' 43936/h-*.html
#perl -p  -i -e 's/<div class=\"\">\s*<\/div>//g' 43936/h-*.html
perl -p  -i -e 's/<\/div>//g' 43936/h-*.html
perl -p -i -e 's/<div class=\"\">//g' 43936/h-*.html
perl -p -i -e 's/<div class=\"main\">//g' 43936/h-*.html

#getting rid of page numbers
#perl -p  -i -e 's/<p><(a|span) id=\"Page_[0-9][0-9]*[0-9]*\" class=\"x-epubmaker-pageno\" title=\"\[Pg [0-9][0-9]*\]\"><\/a><\/p>//g' 43936/h-*.html
#perl -p  -i -e 's/<(a|span) id=\"Page_[0-9][0-9]*[0-9]*\" class=\"x-epubmaker-pageno\" title=\"\[Pg [0-9][0-9]*\]\"><\/a>//g' 43936/h-*.html
#perl -p  -i -e 's/(<span class=\"pagenum\">)<a id=\"Page_[0-9][0-9]*[0-9]*\">\[Pg [0-9][0-9]*[0-9]*\]<\/a><br\/>//g' 43936/h-*.html
perl -p  -i -e 's/<p><(a|span) id=\"Page_[0-9][0-9]*[0-9]*\" class=\"x-epubmaker-pageno\" title=\"\[Pg [0-9][0-9]*\]\"><\/ (a|span)><\/p>//g' 43936/h-*.html
perl -p  -i -e 's/<(a|span) id=\"Page_[0-9][0-9]*[0-9]*\" class=\"x-epubmaker-pageno\" title=\"\[Pg [0-9][0-9]*\]\"><\/(a|span)>//g' 43936/h-*.html
perl -p  -i -e 's/(<span class=\"pagenum\">)<a id=\"Page_[0-9][0-9]*[0-9]*\">\[Pg [0-9][0-9]*[0-9]*\]<\/a><br\/>//g' 43936/h-*.html
perl -p  -i -e 's/<a id=\"Page_[0-9][0-9]*[0-9]*\">\[Pg [0-9][0-9]*[0-9]*\]<\/a>(<\/span>)//g' 43936/h-*.html


#getting rid of redundant divs around images
#:wperl -p  -i -e 's/<div class=\"\">(.*)<\/div>/\1/g' 43936/h-*.html



echo "Would you like to create ebook? [Y/N]" 
read answer 
if [ "$answer" == "y" ] || [ "$answer" == "Y" ]; 
  then  mv  Wiz_Oz.epub Wiz_Oz.epub.old
   echo "zipping into an epub"
   7za a -tzip Wiz_Oz.epub 43936/*.html 43936/*.css 43936/*.opf 43936/*.ncx META-INF/*.*
   echo "adding non images files to epub"
    
   echo "Would you like to zip images? [Y/N]" 
   read answer 
   if [ "$answer" == "y" ] || [ "$answer" == "Y" ]; 
     then cp images/*.jpg 43936/
          7za a Wiz_Oz.epub -tzip 43936/*.jpg 
   fi

   echo "Would you like to check epub validity? [Y/N]" 
   read answer 
   if [ "$answer" == "y" ] || [ "$answer" == "Y" ]; 
     then java -jar ../../../epubcheck-3.0.1/epubcheck-3.0.1.jar  Wiz_Oz.epub 
   fi

  echo "Would you like to azw3 and mobi files? [Y/N]" 
  read answer 
  if [ "$answer" == "y" ] || [ "$answer" == "Y" ]; 
    then 
    ebook-convert Wiz_Oz.epub Wiz_Oz.azw3
    ebook-convert Wiz_Oz.epub Wiz_Oz.mobi
  fi
fi
