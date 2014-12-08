cp TryUnknownWords.txt PerlReplacements.pl
perl -p -i -e 's/^([^,][^,]*)\,/s\/\1\//' PerlReplacements.pl
perl -p -i -e 's/\/\/.*/\/g/' PerlReplacements.pl
