%{

%}


ENTER ^"\n"

START "EMPEZAR"
END "TERMINAR"

STRING [~][^\n\r]*[!~] 

INTEGER [0-9]+
TRUE verdadero
FALSE falso

INT_VAR entero
VAR_NAME [a-zA-Z]+

IF si
ELSE sino
DO hacer
WHILE mientras

OPEN_PARENTHESIS "¿"
CLOSE_PARENTHESIS "?"

OPEN_BLOCK "<"
CLOSE_BLOCK ">"

OP_ASSIGN vale

OP_SUM " mas "
OP_SUB " menos "
OP_DIV " dividido "
OP_MUL " multiplicado "
OP_POW " potencia "

OP_PLUS_ONE "aumentar"
OP_SUB_ONE "decrementar"

OP_OR " o "
OP_AND " y " 
OP_NEG " no "

OP_LT " menor "
OP_GT " mayor "
OP_EQ " igual "
OP_DIST " distinto "
OP_LE " menor igual "
OP_GE " mayor igual "

OP_PRINT "imprime -> "
OP_IN "entrada -> "

END_INSTR "."


%%
{INTEGER}				ECHO;

{STRING}				printf("%s",yytext);

{TRUE} 					printf("1");
{FALSE} 				printf("0");

{INT_VAR} 				printf("int");

{IF} 					printf("if");
{ELSE} 					printf("else");
{DO} 					printf("do");
{WHILE} 				printf("while");

{OPEN_PARENTHESIS} 		printf("(");
{CLOSE_PARENTHESIS} 	printf(")");
{OPEN_BLOCK} 			printf("{");
{CLOSE_BLOCK} 			printf("}");

{OP_ASSIGN}				printf("=");
{OP_SUM}				printf("+");
{OP_SUB}				printf("-");
{OP_MUL}				printf("*");
{OP_POW}				printf("^");

{OP_PLUS_ONE}			printf("++");
{OP_SUB_ONE}			printf("--");

{OP_OR}					printf("&&"); 
{OP_AND}				printf("||");
{OP_NEG}				printf("!");

{OP_LT}					printf("<");
{OP_GT}					printf(">");
{OP_LE}					printf("<=");
{OP_GE}					printf(">=");
{OP_EQ}					printf("==");
{OP_DIST}				printf("!=");
{OP_PRINT}				printf("printf");

{START}					printf("main() {");
{END}					printf("}");

{ENTER}					printf("");
{END_INSTR}				printf(";");
"~" 					printf("('");
"!~" 					printf("')");
%%
main(){
	yylex();
	return 0;
}

