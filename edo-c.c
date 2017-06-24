#import <stdio.h>

float pendiente(float x,float y){
	
	return -2 * x * y * y;
}

void euler_mejorado(float xStep){
	//float xStep = 0.025;
	float xMax = 2;
	float x = 0;
	float y = 1;
	while(x<=xMax){

		float mk = pendiente(x,y);
		float yPrimaNext = y + mk*xStep;
		float xNext = x + xStep;
		float nk = pendiente(xNext, yPrimaNext);
		
		float yNext = y + ((mk + nk) * xStep)/2 ;

		//printf("%f\t%f\n", xNext, yNext); //Mostrar x e y para plotear
		
		x = xNext;
		y = yPrimaNext;
	}
	printf("Delta T : %f\nYn      : %f\n",xStep,y); // Yn final

}


int main(){
	float step;
	printf("Ingrese Delta T: ");
	scanf("%f", &step);
	euler_mejorado(step);
	return 0;
}





