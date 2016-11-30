int main(){
	int a;
	int b;		
	printf ( "Ingrese el primer número: " );
	scanf ( "%d" , &a );
	printf ( "Ingrese el segundo número: " );
	scanf ( "%d" , &b );
	if ( a<0 ) {
		a=a*-1;
	}
	if ( b<0 ) {
		b=b*-1;
	}
	while ( b!=0 ) {
		int aux=a;
		a=b;
		b=aux%b;
	}
	printf ( "El máximo común divisor es: %d\n", a );
}