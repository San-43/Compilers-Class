%{
#include "ejer0204.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%%

[ \t\n]+                        ;  /* Ignorar espacios en blanco */
"INSERT"                        { return INSERT; }
"insert"                        { return INSERT; }
"INTO"                          { return INTO; }
"into"                          { return INTO; }
"VALUES"                        { return VALUES; }
"values"                        { return VALUES; }
[a-zA-Z_][a-zA-Z0-9_]*           { yylval.str = strdup(yytext); return IDENTIFIER; }
\"([^\"\n]|(\\\"))*\"            { yylval.str = strdup(yytext); return STRING; }
[0-9]+                          { yylval.num = atoi(yytext); return NUMBER; }
","                             { return COMMA; }
"("                             { return LPAREN; }
")"                             { return RPAREN; }
";"                             { return SEMICOLON; }
.                               { printf("Caracter no reconocido: %s\n", yytext); }
%%

int yywrap() {
  return 1;
}
