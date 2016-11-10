%{
	#include <stdio.h>
%}

%token STRING;
%token TRUE;
%token FALSE;
%token INT_VAR;
%token VAR_NAME;
%token IF;					
%token ELSE;
%token DO; 					
%token WHILE; 				
%token OPEN_PARENTHESIS;
%token CLOSE_PARENTHESIS;
%token OPEN_BLOCK;
%token CLOSE_BLOCK;
%token OP_ASSIGN;
%token OP_SUM;
%token OP_SUB;
%token OP_MUL;
%token OP_PLUS_ONE;
%token OP_SUB_ONE;
%token OP_OR;
%token OP_AND;
%token OP_NEG;
%token OP_LT;
%token OP_GT;
%token OP_LE;
%token OP_GE;
%token OP_EQ;
%token OP_DIST;
%token OP_PRINT;
%token START;
%token END;
%token ENTER;
%token END_INSTR;


%start comienza
%%

comienza : estart code{
	printf("}");
};

estart: START {
	printf("int main(){");
};

code : instruction code | control_sequence code | {
};

instruction : declaration assign end_instr 
| declaration end_instr 
| print end_instr 
| var_name assign end_instr 
| var_name op_plus_one 
| var_name op_sub_one;

declaration: type var_name;

type: int_var;

int_var: INT_VAR{
	printf("int");
}; 

var_name: VAR_NAME {
	printf("%s",$1);
};

print: op_print open_parenthesis string close_parenthesis 
| op_print open_parenthesis var_name close_parenthesis;

control_sequence : if_block | loop;

if_block : if open_parenthesis boolean_expression close_parenthesis open_block code close_block 
| if open_parenthesis boolean_expression close_parenthesis open_block code close_block else open_block code close_block;

if : IF {
	printf("if");
};

open_block : OPEN_BLOCK {
	printf("{");
};

close_block : CLOSE_BLOCK {
	printf("}");
};

else : ELSE {
	printf("else");
};

loop : do open_block code close_block while open_parenthesis boolean_expression close_parenthesis 
| while open_parenthesis boolean_expression close_parenthesis open_block code close_block;

do : DO {
	printf("do");
};

while : WHILE {
	printf("while");
};

op_print: OP_PRINT {
	printf("printf");
};

op_plus_one: OP_PLUS_ONE {
	printf("++");
};

op_sub_one: OP_SUB_ONE {
	printf("--");
};

string: STRING{
	printf("%s",$1); // Sacar los moños
};

assign: op_assign expression {
	
};

op_assign: OP_ASSIGN {
	printf("=");
}

boolean_expression: boolean_expression op_or boolean_expression
					| boolean_term;

boolean_term: boolean_term op_and boolean_term
			| boolean_factor;

boolean_factor: open_parenthesis boolean_expression close_parenthesis 
				| op_neg boolean_factor
				| boolean;

boolean: true 
		| false 
		| comparation;

comparation: expression compare_operator expression;

expression: open_parenthesis expression op_sum term close_parenthesis
			| open_parenthesis expression op_sub term close_parenthesis
			| term;

term: open_parenthesis term op_mul factor close_parenthesis
			| open_parenthesis term op_div factor close_parenthesis
			| term factor;

factor: var_name | integer;

compare_operator: op_lt 
				| op_gt 
				| op_eq 
				| op_dist
				| op_le
				| op_ge;

op_or: OP_OR {
	printf("||");
}

op_and: OP_AND {
	printf("&&");
}

op_mul: OP_MUL {
	printf("*");
}

op_sum: OP_SUM {
	printf("+");
}

op_sub: OP_SUB {
	printf("-");
}

op_div: OP_DIV {
	printf("/");
}

op_neg: OP_NEG {
	printf("!");
}

op_lt: OP_LT {
	printf("<");
}

op_gt: OP_GT {
	printf(">");
}

op_eq: OP_EQ {
	printf("==");
}

op_dist: OP_DIST {
	printf("!=");
}

op_le: OP_LE {
	printf("<=");
}

op_ge: OP_GE {
	printf(">=");
}

end_instr: END_INSTR {
	printf(";");
};

open_parenthesis: OPEN_PARENTHESIS {
	printf("(");
};

close_parenthesis: CLOSE_PARENTHESIS {
	printf(")");
};

%%

int yywrap(){
	return 1;
}

main (){
	yyparse();
}