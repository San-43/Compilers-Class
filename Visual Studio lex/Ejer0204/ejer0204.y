%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex();

extern FILE *yyin;
%}

%union {
    int num;
    char *str;
}

%token <str> IDENTIFIER STRING
%token <num> NUMBER
%token INSERT INTO VALUES COMMA LPAREN RPAREN SEMICOLON

%type <str> table_name value_list value

%%
input:
    | input sql_stmt
    ;

sql_stmt: INSERT INTO table_name VALUES LPAREN value_list RPAREN SEMICOLON
           { printf("Sentencia SQL válida.\n"); }
         ;

table_name: IDENTIFIER
            { printf("Tabla: %s\n", $1); $$ = $1; }
          ;

value_list: value
              { printf("Valor: %s\n", $1); $$ = $1; }
          | value_list COMMA value
              { printf("Valor: %s\n", $3); $$ = $3; }
          ;

value: STRING
         { $$ = $1; }
     | NUMBER
         {
             char buffer[20];
             sprintf(buffer, "%d", $1);
             $$ = strdup(buffer);
         }
     ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror(argv[1]);
            return EXIT_FAILURE;
        }
        yyin = file;
    }
    
    yyparse();
    return 0;
}
