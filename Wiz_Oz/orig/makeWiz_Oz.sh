#!/usr/bin/sh
mv  Wiz_Oz.epub Wiz_Oz.epub.old
echo "zipping into an epub"
7za a -tzip Wiz_Oz.epub 43936/*.html 43936/*.css 43936/*.opf 43936/*.ncx META-INF/*.*
echo "adding non images files to epub"
echo "Would you like to zip images? [Y/N]" 
read answer 
if [ "$answer" == "y" ] || [ "$answer" == "Y" ]; 
  then 7za a Wiz_Oz.epub -tzip 43936/*.jpg 
fi
java -jar ../../../epubcheck-3.0.1/epubcheck-3.0.1.jar  Wiz_Oz.epub
echo "creating azw3 file for kindle"
ebook-convert Wiz_Oz.epub Wiz_Oz.azw3
echo "creating mobi file"
ebook-convert Wiz_Oz.epub Wiz_Oz.mobi

