SCANNER_RULES=scanner.l
SCANNER_OUT=scanner.out
OS = $(shell uname)

.PHONY: clean		

all: 
	yacc -d grammar.y
	lex $(SCANNER_RULES)
	gcc -o parser.out lex.yy.c y.tab.c -ly

compile:
	./parser.out < tests/factorial.esp > salida.c
	gcc -c salida.c
	gcc salida.o -o salida.out

out:
ifeq ($(OS),Darwin)
	gcc -ll lex.yy.c -o$(SCANNER_OUT)
else
	gcc lex.yy.c -lfl -o$(SCANNER_OUT)
endif	

clean: 	
	rm -f $(SCANNER_OUT) lex.yy.c y.tab.c y.tab.h parser.out salida.c salida.o

