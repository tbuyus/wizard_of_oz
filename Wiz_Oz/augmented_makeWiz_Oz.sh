#this brings all the original files across
#cp -r ../orig/* .

#this dealt with header unclosed tags - only going to copy body across
#and reuse headers from first file so dont need meta and link tag
#fixed
#perl -p -i -e 's/<(br|hr|meta|link|img)([^>]*)>/<\1\2\/>/g' augmented_HTML/*.html

perl -p -i -e 's/<(br|hr|img)([^>^\/]*)>/<\1\2\/>/g' augmented_HTML/*.html
cp -r augmented_HTML/*.* 43936/

. makeWiz_Oz.sh
