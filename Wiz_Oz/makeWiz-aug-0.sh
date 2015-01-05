#!/usr/bin/sh

format='-aug-0'

echo 'copying heteronymn free content files (html)'
cp augmented-no-heteros/43936/*.html 43936/
cp augmented-no-heteros/43936/*.ncx  43936/

echo 'running frequencey filter on the html files'
perl -p -i.bak -f freq-filt$format.pl 43936/h-*.html


echo "Would you like to archive old ebook? [Y/N]\n no will mean you can skip adding images to epub again" 
read answer
if [ "$answer" == "y" ] || [ "$answer" == "Y" ];
  then  mv  Wiz$format.epub Wiz$format.epub.old
fi

echo "Would you like to create ebook? [Y/N]" 
read answer 
if [ "$answer" == "y" ] || [ "$answer" == "Y" ]; 
  then  
   echo "zipping into an epub"
   7za a -tzip Wiz$format.epub 43936/*.html 43936/*.css 43936/*.opf 43936/*.ncx META-INF/*.*
   echo "adding non images files to epub"
    
   echo "Would you like to zip images? [Y/N]" 
   read answer 
   if [ "$answer" == "y" ] || [ "$answer" == "Y" ]; 
     then cp images/*.jpg 43936/
          7za a Wiz$format.epub -tzip 43936/*.jpg 
   fi

   echo "Would you like to check epub validity? [Y/N]" 
   read answer 
   if [ "$answer" == "y" ] || [ "$answer" == "Y" ]; 
#     then java -jar ../../../epubcheck-3.0.1/epubcheck-3.0.1.jar  Wiz$format.epub 
     then java -jar $EPUBCHECK_PATH/epubcheck-3.0.1.jar  Wiz$format.epub 
   fi

  echo "Would you like to azw3 and mobi files? [Y/N]" 
  read answer 
  if [ "$answer" == "y" ] || [ "$answer" == "Y" ]; 
    then 
    ebook-convert Wiz$format.epub Wiz$format.azw3
    ebook-convert Wiz$format.epub Wiz$format.mobi
  fi
fi
