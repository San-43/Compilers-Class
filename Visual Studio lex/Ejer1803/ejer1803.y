%{
#include <stdio.h>
int yylex(void);
int yyerror(char* s);
%}

%token URL_VALIDA URL_INVALIDA

%%

input:
      URL_VALIDA { printf("URL valida.\n"); }
    | URL_INVALIDA { printf("URL invalida.\n"); }
    ;

%%

int main() {
    printf("Ingrese una URL:\n");
    yyparse();
    return 0;
}

int yyerror(char* s) {
    printf("Error: %s\n", s);
    return 0;
}