# TLA
Teoria de Lenguajes y Automatas ITBA 2016

## Compile and Run
### Linux
```
make
./scanner.out < in.esp

```

### Mac
```
flex scanner.l
gcc -ll lex.yy.c -oscanner.out
./scanner.out < in.esp

```