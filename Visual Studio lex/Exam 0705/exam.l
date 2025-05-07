%{
#include "y.tab.h"
%}

DIGITO [0-9]+

%%

{DIGITO}    { return NUM; }
"*"         { return MULT; }

%%

int yywrap() { return 1; }
