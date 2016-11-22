SCANNER_RULES=scanner.l
GRAMMAR=grammar.y
PARSER=parser.out

.PHONY: clean		

all: 
	yacc -d $(GRAMMAR)
	lex $(SCANNER_RULES)
	gcc -o $(PARSER) lex.yy.c y.tab.c -ly

compile:
	./$(PARSER) < tests/factorial.esp > salida.c
	gcc -c salida.c
	gcc salida.o -o salida.out

clean: 	
	rm -f *.out *.o $(PARSER) lex.yy.c y.tab.c y.tab.h salida.c

