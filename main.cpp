#include "lexer/tokinization/generated_file/language_token.h"

int main(int argc, char* argv[])
{
    if (argc < 2)
    {
        printf("\e[31mERROR: file name not entered\e[0m\n");
        return 1;
    }
    FILE* language_file = fopen(argv[1], "r");
    yyrestart(language_file);
    return yylex();
}