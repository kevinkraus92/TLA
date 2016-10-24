SCANNER_RULES=scanner.l
SCANNER_OUT=scanner.out
OS = $(shell uname)

.PHONY: clean		

all: flex out	

flex:
	flex $(SCANNER_RULES)

out:
ifeq ($(OS),Darwin)
	gcc -ll lex.yy.c -o$(SCANNER_OUT)
else
	gcc lex.yy.c -lfl -o$(SCANNER_OUT)
endif	

clean: 	
	rm $(SCANNER_OUT) lex.yy.c

