#import <stdio.h>

float pendiente(float x,float y){
	float menos2 = -2;
	float suma = menos2 * x;
	suma = suma * y;
	suma = suma * y;
	return suma;
}

float euler_mejorado(float xStep){
	float xMax = 2;
	float x = 0;
	float y = 1;
	while(x<=xMax){

		float mk = pendiente(x,y);
		float yPrimaNext = mk*xStep;
		yPrimaNext = yPrimaNext+y;

		float xNext = x + xStep;

		float nk = pendiente(xNext, yPrimaNext);
		
		float yNext = mk + nk;
		yNext = yNext*xStep;
		yNext = yNext/2;
		yNext = yNext + y;

		x = xNext;
		y = yPrimaNext;
	}
	return y;
}


int main(){
	float step;
	float y;
	printf("Ingrese Delta T: ");
	scanf("%f", &step);
	y = euler_mejorado(step);

	printf("Delta T : %f\nYn      : %f\n",step,y); 
	return 0;
}





