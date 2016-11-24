int main(){
int a;
int b;
a=303;
printf("valida si el %d es primo\n",a);
b=a-1;
if ( a<0 ) {
	printf("Los negativos no son primos\n");
}
if ( a==1 ) {
	printf("No es primo\n");
}
if ( a==2 ) {
	printf("No es primo\n");
}
while( ( a%b)!=0&&b!=1 ){
	b --;
	printf("%d valor b\n",b);
}
if ( b==1 ) {
	printf("%d es primo\n",a);
} else {
	printf("%d NO es primo\n",a);
}
}