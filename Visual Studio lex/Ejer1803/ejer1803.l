%{
#include <stdio.h>
#include "y.tab.h"
%}

%option noyywrap

%%

"https://www"[a-zA-Z0-9.-]+\.(com|mx|edu|org|net|es)    { return URL_VALIDA; }
"http://www"[a-zA-Z0-9.-]+\.(com|mx|edu|org|net|es)     { return URL_VALIDA; }
.                                                     { return URL_INVALIDA; }

%%