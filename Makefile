SCANNER_RULES=scanner.l
GRAMMAR=grammar.y
PARSER=parser.out

.PHONY: clean		

all: 
	yacc -d $(GRAMMAR)
	lex $(SCANNER_RULES)
	gcc -o $(PARSER) lex.yy.c y.tab.c -ly

compile:
	./$(PARSER) < tests/factorial.esp > factorial.c
	gcc -c -w factorial.c
	gcc -w factorial.o -o factorial.out
	./factorial.out
	./$(PARSER) < tests/potencia.esp > potencia.c
	gcc -c -w potencia.c
	gcc -w potencia.o -o potencia.out
	./potencia.out
	./$(PARSER) < tests/primo.esp > primo.c
	gcc -c -w primo.c
	gcc -w primo.o -o primo.out
	./primo.out
	./$(PARSER) < tests/fibonacci.esp > fibonacci.c
	gcc -c -w fibonacci.c
	gcc -w fibonacci.o -o fibonacci.out
	./fibonacci.out

clean: 	
	rm -f *.out *.o $(PARSER) lex.yy.c y.tab.c y.tab.h potencia.c factorial.c primo.c fibonacci.c

