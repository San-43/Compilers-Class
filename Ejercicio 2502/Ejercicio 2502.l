%option noyywrap
%{
   #include <stdio.h>
%}

%%
[a-zA-Z]+    { printf("Text: %s\n", yytext); }
[0-9]+       { printf("Number: %s\n", yytext); }
[+\-*/]      { printf("Operator: %s\n", yytext); }
[ ]+         { printf("Empty space: %s\n", yytext); }
\n           { printf("New line detected\n", yytext); }
.            { printf("Unknown: %s\n", yytext); }

%%

int main() {
   yylex();
   return 0;
}