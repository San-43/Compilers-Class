%{
#include <stdio.h>
#include <string.h>

int count_poter = 0;
int count_potter = 0;
FILE *output_file;
%}

%%
"Poter"   { 
            count_poter++; 
            fprintf(output_file, "Potter");  // Reemplazar por 'Potter' en el archivo de salida
          }
"Potter"  { 
            count_potter++; 
            fprintf(output_file, "Potter");  // Escribir 'Potter' tal cual en el archivo de salida
          }
.|\n      { fprintf(output_file, "%s", yytext); }  // Imprimir cualquier otro carácter tal cual

%%

int main(int argc, char **argv) {
    FILE *file;
    if (argc > 1) {
        file = fopen(argv[1], "r");
        if (file == NULL) {
            printf("No se puede abrir el archivo.\n");
            return 1;
        }
        yyin = file;
    } else {
        printf("Por favor, ingresa el nombre del archivo.\n");
        return 1;
    }
    
    output_file = fopen("El_Prisionero_de_Azkaban_corregido.txt", "w");  // Abrir archivo de salida
    if (output_file == NULL) {
        printf("No se puede crear el archivo de salida.\n");
        return 1;
    }
    
    yylex();  // Ejecuta el analizador léxico
    
    printf("Palabras 'Poter' encontradas: %d\n", count_poter);
    printf("Palabras 'Potter' encontradas: %d\n", count_potter);

    fclose(file);
    fclose(output_file);
    return 0;
}
int yywrap(void) {
    return 1;  // Indica que no hay más archivos para procesar
}