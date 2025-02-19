%option noyywrap
%{
	#include <stdio.h>
%}

%%
.
%%
int main() {
	printf("¡HOLA MUNDO!");
	yylex();
	return 0;
}