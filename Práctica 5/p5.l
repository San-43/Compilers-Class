%option noyywrap
%{
    #include <stdio.h>
    #include <stdlib.h>
%}

/* Definición de patrones */
DIGITO      [0-9]
LETRA       [a-zA-Z_]
ID          {LETRA}({LETRA}|{DIGITO})*

%%

"auto"          { printf("Palabra reservada: auto\n"); }
"break"         { printf("Palabra reservada: break\n"); }
"case"          { printf("Palabra reservada: case\n"); }
"char"          { printf("Palabra reservada: char\n"); }
"class"         { printf("Palabra reservada: class\n"); }
"const"         { printf("Palabra reservada: const\n"); }
"continue"      { printf("Palabra reservada: continue\n"); }
"default"       { printf("Palabra reservada: default\n"); }
"do"            { printf("Palabra reservada: do\n"); }
"enum"          { printf("Palabra reservada: enum\n"); }
"extern"        { printf("Palabra reservada: extern\n"); }
"friend"        { printf("Palabra reservada: friend\n"); }
"goto"          { printf("Palabra reservada: goto\n"); }
"if"            { printf("Palabra reservada: if\n"); }
"inline"        { printf("Palabra reservada: inline\n"); }
"int"           { printf("Palabra reservada: int\n"); }
"long"          { printf("Palabra reservada: long\n"); }
"namespace"     { printf("Palabra reservada: namespace\n"); }
"new"           { printf("Palabra reservada: new\n"); }
"operator"      { printf("Palabra reservada: operator\n"); }
"private"       { printf("Palabra reservada: private\n"); }
"protected"     { printf("Palabra reservada: protected\n"); }
"public"        { printf("Palabra reservada: public\n"); }
"register"      { printf("Palabra reservada: register\n"); }
"return"        { printf("Palabra reservada: return\n"); }
"short"         { printf("Palabra reservada: short\n"); }
"signed"        { printf("Palabra reservada: signed\n"); }
"sizeof"        { printf("Palabra reservada: sizeof\n"); }
"static"        { printf("Palabra reservada: static\n"); }
"struct"        { printf("Palabra reservada: struct\n"); }
"switch"        { printf("Palabra reservada: switch\n"); }
"template"      { printf("Palabra reservada: template\n"); }
"this"          { printf("Palabra reservada: this\n"); }
"throw"         { printf("Palabra reservada: throw\n"); }
"true"          { printf("Palabra reservada: true\n"); }
"try"           { printf("Palabra reservada: try\n"); }
"typedef"       { printf("Palabra reservada: typedef\n"); }
"typeid"        { printf("Palabra reservada: typeid\n"); }
"union"         { printf("Palabra reservada: union\n"); }
"unsigned"      { printf("Palabra reservada: unsigned\n"); }
"using"         { printf("Palabra reservada: using\n"); }
"virtual"       { printf("Palabra reservada: virtual\n"); }
"void"          { printf("Palabra reservada: void\n"); }
"volatile"      { printf("Palabra reservada: volatile\n"); }
"wchar_t"       { printf("Palabra reservada: wchar_t\n"); }
"while"         { printf("Palabra reservada: while\n"); }


"//".*         { printf("Comentario de una línea: %s\n", yytext); }


"/*"([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*"*"+"/"  { printf("Comentario multi-línea: %s\n", yytext); }


"+"'           { printf("Operador aritmético: %s\n", yytext); }
"-"             { printf("Operador aritmético: %s\n", yytext); }
"*"             { printf("Operador aritmético: %s\n", yytext); }
"/"             { printf("Operador aritmético: %s\n", yytext); }
"%"             { printf("Operador aritmético: %s\n", yytext); }
"++"            { printf("Operador aritmético: %s\n", yytext); }
"--"            { printf("Operador aritmético: %s\n", yytext); }
"="             { printf("Operador de asignación: %s\n", yytext); }
"+="            { printf("Operador de asignación: %s\n", yytext); }
"-="            { printf("Operador de asignación: %s\n", yytext); }
"*="            { printf("Operador de asignación: %s\n", yytext); }
"/="            { printf("Operador de asignación: %s\n", yytext); }



"=="            { printf("Operador lógico/relacional: %s\n", yytext); }
"!="            { printf("Operador lógico/relacional: %s\n", yytext); }
"<="            { printf("Operador lógico/relacional: %s\n", yytext); }
">="            { printf("Operador lógico/relacional: %s\n", yytext); }
"<"             { printf("Operador lógico/relacional: %s\n", yytext); }
">"             { printf("Operador lógico/relacional: %s\n", yytext); }
"&&"            { printf("Operador lógico/relacional: %s\n", yytext); }
"||"            { printf("Operador lógico/relacional: %s\n", yytext); }
"!"             { printf("Operador lógico/relacional: %s\n", yytext); }
"("             { printf("Paréntesis izquierdo: %s\n", yytext); }
")"             { printf("Paréntesis derecho: %s\n", yytext); }
"{"             { printf("Llave izquierda: %s\n", yytext); }
"}"             { printf("Llave derecha: %s\n", yytext); }
"["             { printf("Corchete izquierdo: %s\n", yytext); }
"]"             { printf("Corchete derecho: %s\n", yytext); }
";"             { printf("Punto y coma: %s\n", yytext); }
","             { printf("Coma: %s\n", yytext); }
":"             { printf("Dos puntos: %s\n", yytext); }
"\""            { printf("Comillas dobles: %s\n", yytext); }
"\'"            { printf("Comillas simples: %s\n", yytext); }
"?"             { printf("Operador ternario: %s\n", yytext); }
"->"            { printf("Operador de acceso a miembros: %s\n", yytext); }
"::"            { printf("Operador de resolución de ámbito: %s\n", yytext); }



{DIGITO}+      { printf("Número: %s\n", yytext); }


{ID}           { printf("Identificador: %s\n", yytext); }

[ \t\r\n]+     {}

.              {}

%%

int main(int argc, char **argv) {
    yylex();
    return 0;
}
