%option noyywrap
%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    typedef struct {
        char *emotion;
        int count;
    } Emotion;

    Emotion emotions[] = {
        {"Amor", 0},
        {"Alegria", 0},
        {"Esperanza", 0},
        {"Exito", 0},
        {"Tristeza", 0},
        {"Miedo", 0},
        {"Enojo", 0},
        {"Derrota", 0}
    };
    
    #define NUM_EMOTIONS (sizeof(emotions) / sizeof(emotions[0]))

    // Función para comparar emociones por conteo (para qsort)
    int compare_emotions(const void *a, const void *b) {
        Emotion *emotionA = (Emotion *)a;
        Emotion *emotionB = (Emotion *)b;
        return emotionB->count - emotionA->count;
    }

    // Archivo para guardar las emociones encontradas
    FILE *outputFile;
%}

%%

querer|amar|cariño|ternura|admiración|afecto  { emotions[0].count++; fprintf(outputFile, "%s\n", yytext); }
feliz|contento|entusiasmo|risa|euforia|placer { emotions[1].count++; fprintf(outputFile, "%s\n", yytext); }
optimismo|confianza|ilusión|motivación|inspirador { emotions[2].count++; fprintf(outputFile, "%s\n", yytext); }
logro|triunfo|superación|avanzar|ganar|orgullo { emotions[3].count++; fprintf(outputFile, "%s\n", yytext); }
llanto|soledad|vacío|desesperación|pérdida|dolor { emotions[4].count++; fprintf(outputFile, "%s\n", yytext); }
temor|angustia|inseguridad|pánico|horror|amenaza { emotions[5].count++; fprintf(outputFile, "%s\n", yytext); }
ira|odio|rabia|resentimiento|frustración|venganza { emotions[6].count++; fprintf(outputFile, "%s\n", yytext); }
fracaso|depresión|pérdida|humillación|rechazo { emotions[7].count++; fprintf(outputFile, "%s\n", yytext); }

[\n ]+  ; // Ignorar espacios y saltos de línea
.       ; // Ignorar otros caracteres

%%

int main() {
    yyin = fopen("El_Prisionero_de_Azkaban.txt", "r"); // Leer archivo de entrada
    if (!yyin) {
        perror("Error al abrir el archivo de entrada");
        return 1;
    }

    outputFile = fopen("El_Prisionero_de_Azkaban_Emociones.txt", "w"); // Crear archivo de salida
    if (!outputFile) {
        perror("Error al crear el archivo de salida");
        fclose(yyin);
        return 1;
    }

    yylex(); // Ejecutar el análisis léxico

    fclose(yyin);
    fclose(outputFile);

    // Ordenar emociones por conteo
    qsort(emotions, NUM_EMOTIONS, sizeof(Emotion), compare_emotions);

    // Imprimir las 10 emociones más repetidas
    printf("\nTop 10 emociones mas repetidas:\n");
    int i;
    for (i = 0; i < NUM_EMOTIONS && i < 10; i++) {
        printf("%s: %d\n", emotions[i].emotion, emotions[i].count);
    }
    printf("Guardando las emociones en 'El_Prisionero_de_Azkaban_Emociones.txt...'");

    return 0;
}