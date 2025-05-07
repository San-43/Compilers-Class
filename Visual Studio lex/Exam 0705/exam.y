%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUM MULT

%%

expresion: NUM MULT NUM { printf("Expresión válida\n"); }
        ;

%%

int main() {
    printf("Ingrese una expresión:\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
