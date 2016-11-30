int main(){
	int i=0;
	int j=1;
	int k=1;
	int t;
	int n;
	printf ( "Ingrese que termino de Fibonacci desea calcular: " );
	scanf ( "%d" , &n );
	while ( k<=n ){
		t=i+j;
		i=j;
		j=t;
		k ++;
	}
	printf ( "El termino es: %d \n", j );
}
