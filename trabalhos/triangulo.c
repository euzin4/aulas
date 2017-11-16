#include<stdio.h>

typedef struct{
	int x, y;
}ponto;

	/*|a.x  a.y 1|a.x  a.y		a=(1,1)
	  |b.x  b.y 1|b.x  b.y		b=(1,4)
	  |c.x  c.y 1|c.x  c.y		c=(4,1)    */
int calculaArea(ponto a, ponto b, ponto c){
	int A;
	A = ((a.x * b.y) + (a.y * c.x) + (b.x * c.y)) - ((a.y * b.x) + (a.x * c.y) + (b.y * c.x));
	return A;
}

int main(){
	ponto a,b,c,p;
	int i,j,area,AB,AC,BC;

	scanf("%d %d %d %d %d %d",&a.x,&a.y,&b.x,&b.y,&c.x,&c.y);
	area = calculaArea(a, b, c);
	if(area < 0){
		area = -area;
    	}
	printf("area: %d\n", area);
	for(i = 0; i < 20; i++){
		for(j = 0; j < 20; j++){
	        	p.x = i;
	            	p.y = j;
	            	AB = calculaArea(a, b, p);
	            	if(AB < 0){
	                	AB = -AB;
	            	}
	            	AC = calculaArea(a, c, p);
	            	if(AC < 0){
	                	AC = -AC;
	            	}
	            	BC = calculaArea(b, c, p);
	            	if(BC < 0){
                		BC = -BC;
            		}
            		if(AB + AC + BC == area){
                		printf("* ");
            		}
            		else{
                		printf("  ");
            		}
		}
		printf("\n");
	}
}
