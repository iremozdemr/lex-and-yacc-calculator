%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

DIGIT   [0-9]+
FLOAT   [0-9]*"."[0-9]+
NUMBER  ({DIGIT}|{FLOAT})
WHITESPACE  [ \t\r\n]

%%


{NUMBER}  { yylval.val = atof(yytext); return NUMBER; }
"+"       { return PLUS; }
"-"       { return MINUS; }
"*"       { return TIMES; }
"/"       { return DIVIDE; }
"^"       { return POWER; }
"("       { return LPAREN; }
")"       { return RPAREN; }
\n        { return 0; }
{WHITESPACE}  {  }

%%

int yywrap() {
    return 1;
}