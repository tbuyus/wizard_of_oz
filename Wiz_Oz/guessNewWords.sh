rm tmp        
echo '<html><body>' > tmp        
perl -p  -e 's/^(.*)$/xxx\1\,\1/g' unknownWords.txt    > tmp

perl -p -i -e 's/tion$/-station/g'   tmp
perl -p -i -e 's/er$/-fiver/g'   tmp
perl -p -i -e 's/en$/-en/g'   tmp
perl -p -i -e 's/ed$/-lived-walked-wedded/g'   tmp
perl -p -i -e 's/less$/-joblesss/g'   tmp
perl -p -i -e 's/esses$/-goddessess/g'   tmp
perl -p -i -e 's/fully$/-beautifully/g'   tmp
perl -p -i -e 's/ful$/-eautifully/g'   tmp
perl -p -i -e 's/est$/-latest/g'   tmp
perl -p -i -e 's/let$/-toilet/g'   tmp
perl -p -i -e 's/ments$/-elements/g'   tmp
perl -p -i -e 's/ies$/-variess/g'   tmp
perl -p -i -e 's/tion$/-station/g'   tmp
perl -p -i -e 's/ing$/-sling/g'   tmp
perl -p -i -e 's/let$/-wallet/g'   tmp
perl -p -i -e 's/ily$/-lily/g'   tmp
perl -p -i -e 's/ly$/-lily/g'   tmp
perl -p -i -e 's/s$/-is-this/g'   tmp

echo '</body></html>' >> tmp
more   tmp
