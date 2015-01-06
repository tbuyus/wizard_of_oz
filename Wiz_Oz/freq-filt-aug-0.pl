!#/usr/bin/perl

#use utf8;
#use Encode;

#s/\/\/([^\/]*)\/\/([0-9][0-9]*)\/\/([^\/]*)\/\//foo\-$1\-$2-bar-$3-beque/g;
#s/\/\/([^\/]*)\/\/([0-9][0-9]*)\/\/([^\/]*)\/\//if($2>30){$1}else{$3}/ge;
#s/\/\/([^\/]*)\/\/([0-9][0-9]*)\/\/([^\/]*)\/\//if($2>30){&graySilentLetters($1)}else{$3}/ge;
#s/\/\/([^\/]*)\/\/([0-9][0-9]*)\/\/([^\/]*)\/\//if($2>30){&processRhotics(&graySilentLetters(&addSuperscripts($1)))}else{$3}/ge;
#s/\/\/([^\/]*)\/\/([0-9][0-9]*)\/\/([^\/]*)\/\//if($2>30){&graySilentLetters(&addSuperscripts($1))}else{$3}/ge;
#s/\/\/([^\/]*)\/\/([0-9][0-9]*)\/\/([^\/]*)\/\//if($2>30){&addSuperscripts($1)}else{$3}/ge;
#s/\/\/([^\/]*)\/\/([0-9][0-9]*)\/\/([^\/]*)\/\//if($2>30){&processRhotics(&graySilentLetters(&addSuperscripts($1)))}else{$3}/ge;
s/\/\/([^\/]*)\/\/([0-9][0-9]*)\/\/([^\/]*)\/\//if($2>30){&addSuperscripts(&processRhotics(&graySilentLetters($1)))}else{$3}/ge;
#s/\/\/([^\/]*)\/\/([0-9][0-9]*)\/\/([^\/]*)\/\//if($2>30){&processRhotics(&addSuperscripts(&graySilentLetters($1)))}else{$3}/ge;



sub graySilentLetters {
$word=shift; 
$word=~ s/(à)/<tt>$1<\/tt>/gi;
$word=~ s/(è)/<tt>$1<\/tt>/gi;
$word=~ s/(ì)/<tt>$1<\/tt>/gi;
$word=~ s/(ò)/<tt>$1<\/tt>/gi;
$word=~ s/(ù)/<tt>$1<\/tt>/gi;
$word=~ s/(ħ)/<tt>$1<\/tt>/gi;
$word=~ s/(À)/<tt>$1<\/tt>/gi;
$word=~ s/(È)/<tt>$1<\/tt>/gi;
$word=~ s/(Ì)/<tt>$1<\/tt>/gi;
$word=~ s/(Ò)/<tt>$1<\/tt>/gi;
$word=~ s/(Ù)/<tt>$1<\/tt>/gi;
$word=~ s/(Ħ)/<tt>$1<\/tt>/gi;
$word=~ s/([a-zA-Z])0/<tt>$1<\/tt>/g;
$word=~ s/([^0]{1,2})0/<tt>$1<\/tt>/g;
$word=~ s/<\/tt><tt>//g;
return $word;
}


sub addSuperscripts   {
$word=shift; 
#$word=~ s/([^\/]*)\!([^\/]*)/$1<sup>$2<\/sup>/g;
$word=~ s/([^\!][^\!]*)\!([^\!][^\!]*)/$1<sup>$2<\/sup>/g;
return $word;
}

sub processRhotics    {
$word=shift; 
$word=~ s/(ø)(r)\#/$1<i>$2<\/i>/gi;
$word=~ s/(ā)(r)/$1<i>$2<\/i>/gi;
$word=~ s/\#//gi;
return $word;
}
