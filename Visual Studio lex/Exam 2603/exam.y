%{
#include <stdio.h>
#include <stdlib.h>
%}

%token COMENTARIO_UNA_LINEA COMENTARIO_MULTILINEA

%%
inicio:
    comentarios
    ;

comentarios:
    comentario comentarios
    |
    ;

comentario:
    COMENTARIO_UNA_LINEA   { printf("Comentario de una sola línea encontrado.\n"); }
    | COMENTARIO_MULTILINEA { printf("Comentario multilínea encontrado.\n"); }
    ;

%%

int main() {
    yyparse();
    return 0;
}

int yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}