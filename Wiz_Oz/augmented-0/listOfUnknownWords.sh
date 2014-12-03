perl -p  -e 's/(\/\/undefined\/\/)([a-zA-Z]*)/\n\1\2\n/g' augmented_HTML/*.html | grep 'undefined' | perl -p -e 's/\/\/undefined\/\///g' | sort -u > unknownWords.txt
