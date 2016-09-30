# TLA
Teoria de Lenguajes y Automatas ITBA 2016

## Run
### Linux
```
flex scanner.l
gcc lex.yy.c -lfl -oscanner.out
./scanner.out < in.esp

```

### Mac
```
flex scanner.l
gcc -ll lex.yy.c -oscanner.out
./scanner.out < in.esp

```