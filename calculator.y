%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
//c kodlarını kullanabilmek icin bunları import ettim

int yylex();
void yyerror(const char *s);
%}

%left PLUS MINUS 
%left TIMES DIVIDE
%right POWER
//belirsizliği gidermek için ekledim

%token LPAREN RPAREN

%union {
    double val;
    int index;
}

%type <val> expr
%token <val> NUMBER

%%

stmt: expr { 
    if ($1 == (int)$1)  
        printf("result is: %d\n", (int)$1); 
    else
        printf("result is: %f\n", $1);
};
//eğer sonuç 2 ve integer ise bu şekilde output verilir:
//result is: 2 
//eğer sonuç 2 ve float ise bu şekilde output verilir:
//result is: 2.00
//bu kurali eklemeseydim sonuç integer olsa bile float formatı kullanılıyordu

expr: expr PLUS expr    { $$ = (double) $1 + $3; }
    | expr MINUS expr   { $$ = (double) $1 - $3; }
    | expr TIMES expr   { $$ = (double) $1 * $3; }
    | expr DIVIDE expr  {
        if ($3 == 0) {
            printf("division by zero error\n");
            exit(1);
        }
        $$ = (double) $1 / $3;
    }
    | expr POWER expr   { $$ = pow((double) $1, $3); }
    | LPAREN expr RPAREN { $$ = $2; }
    | NUMBER            { $$ = $1; }
    ;
//verilen grammarı bu şekilde yaptım

%%

void yyerror(const char *s) {
    fprintf(stderr, "syntax error: %s\n", s);
}

int main() {
    printf("please enter the arithmetic expressions\n");
    printf("press Ctrl+C to exit\n");

    while (1) {
        printf("> "); 
        //bu işaret (>) terminalde input alındığını gösteriyor
        fflush(stdout); 

        if (yyparse() != 0) {
            break;
        }
    }
    return 0;
}