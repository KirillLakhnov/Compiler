%option noyywrap

%x COMMENT

%{
    #include <stdio.h>
%}

IF      [iI][fF]
ELSE    [eE][lL][sS][eE]
THEN    [tT][hH][eE][nN]
LOOP    [lL][oO][oO][pP]
WHILE   [wW][hH][iI][lL][eE]
PRINT   [pP][rR][iI][nN][tT]
PRINTLN [pP][rR][iI][nN][tT][lL][nN]
NOT     [nN][oO][tT]
TRUE    [t][rR][uU][eE]
FALSE   [f][aA][lL][sS][eE]

STRING ["][^"\0]*["]
DIGIT  [1-9][0-9]*|0

%%

[\t\r\n ]* {}

{DIGIT} {printf("Token class: NUMBER,    Token value: %s\n", yytext);}

"(" {printf("Token class: SEPARATOR, Token value: %s\n", yytext);}
")" {printf("Token class: SEPARATOR, Token value: %s\n", yytext);}
";" {printf("Token class: SEPARATOR, Token value: %s\n", yytext);}

"=" {printf("Token class: OP,        Token value: ASSIGN\n");}
"+" {printf("Token class: OP,        Token value: ADD\n");}
"-" {printf("Token class: OP,        Token value: SUB\n");}
"*" {printf("Token class: OP,        Token value: MUL\n");}
"/" {printf("Token class: OP,        Token value: DIV\n");}

{IF}      {printf("Token class: KEY WORD,  Token value: IF\n");}
{ELSE}    {printf("Token class: KEY WORD,  Token value: ELSE\n");}
{THEN}    {printf("Token class: KEY WORD,  Token value: THEN\n");}
{LOOP}    {printf("Token class: KEY WORD,  Token value: LOOP\n");}
{WHILE}   {printf("Token class: KEY WORD,  Token value: WHILE\n");}
{PRINT}   {printf("Token class: KEY WORD,  Token value: PRINT\n");}
{PRINTLN} {printf("Token class: KEY WORD,  Token value: PRINTLN\n");}
{TRUE}    {printf("Token class: KEY WORD,  Token value: TRUE\n");}
{FALSE}   {printf("Token class: KEY WORD,  Token value: FALSE\n");}
{NOT}     {printf("Token class: KEY WORD,  Token value: NOT\n");}

[A-Z][a-zA-Z0-9_]* {printf("Token class: TYPE_ID,   Token value: %s\n", yytext);}
[a-z][a-zA-Z0-9_]* {printf("Token class: VARIABLE,  Token value: %s\n", yytext);}

{STRING} {printf("Token class: STRING,    Token value: %s\n", yytext);}

"--"          {BEGIN(COMMENT);}
<COMMENT>.    {}
<COMMENT>[\n] {BEGIN(INITIAL);}

%%