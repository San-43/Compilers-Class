%{
#include "y.tab.h"
%}

%%

"//".*                { return COMENTARIO_UNA_LINEA; }
"/*"([^*]|[*]+[^/])*"*/"  { return COMENTARIO_MULTILINEA; }

[ \t\n]+              { }

.                     { }

%%

int yywrap() {
    return 1;
}
