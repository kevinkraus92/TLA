int main(){
	int base;
	int pot;
	printf ( "La base es 2\n" );
	base=2;
	printf ( "La potencia es 10\n" );
	pot=10;
	if ( pot==0&&base==0){
		printf ( "Error\n" );
	} else {
		if ( base==0 ){
			printf ("La base es %d\n ", base);
		} else {
				if ( pot==0){
					printf ( "El resultado es %d\n", 1 );
				}
				else {
					while ( pot>=1 ) {
					base=base*base;
					pot --;
					}
					printf ("El resultado es %d\n",base);
				}
			}
		}
}