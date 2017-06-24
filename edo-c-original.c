#import <stdio.h>

float pendiente(float x,float y){
	
	return -2 * x * y * y;
}

float euler_mejorado(float xStep){
	float xMax = 2;
	float x = 0;
	float y = 1;
	while(x<=xMax){

		float mk = pendiente(x,y);
		float yPrimaNext = y + mk*xStep;
		float xNext = x + xStep;
		float nk = pendiente(xNext, yPrimaNext);
		
		float yNext = y + ((mk + nk) * xStep)/2 ;
		
		x = xNext;
		y = yPrimaNext;
	}
	return y;
}


int main(){
	float step,y;
	printf("Ingrese Delta T: ");
	scanf("%f", &step);
	y = euler_mejorado(step);

	printf("Delta T : %f\nYn      : %f\n",step,y); 
	return 0;
}





