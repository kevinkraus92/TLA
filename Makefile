SCANNER_RULES=scanner.l
SCANNER_OUT=scanner.out

.PHONY: clean		

all: flex out	

flex:
	flex $(SCANNER_RULES)

out:	
	gcc lex.yy.c -lfl -o$(SCANNER_OUT)

clean: 	
	rm $(SCANNER_OUT) lex.yy.c

