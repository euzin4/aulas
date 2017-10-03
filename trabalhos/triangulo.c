#include<stdio.h>

typedef struct{
	int x, y;
}ponto;

	//|a.x  a.y 1|a.x  a.y           a=(12,5)
	//|b.x  b.y 1|b.x  b.y 		 b=(5,16)
	//|c.x  c.y 1|c.x  c.y		 c=(2,2)
int calculaArea(ponto a, ponto b, ponto c){
	int A;
	A = ((a.x * b.y) + (a.y * c.x) + (b.x * c.y)) - ((a.y * b.x) + (a.x * c.y) + (b.y * c.x));
	return A;
}

int main(){
	ponto a;
	ponto b;
	ponto c;
	ponto p;
	int i;
	int j;
	a.x = 12;
	a.y = 5;
	b.x = 5;
	b.y = 16;
	c.x = 2;
	c.y = 2;
	int area = calculaArea(a, b, c);
	if(area < 0)
		area = -area;
	printf("%d\n", area);
	int AB, AC, BC;
	for(i = 0; i < 20; i++){
		for(j = 0; j < 20; j++){
		p.x = i;
		p.y = j;
		AB = calculaArea(a, b, p);
		if(AB < 0)
			AB = -AB;
		//printf("AB:%d   \n", AB);
		AC = calculaArea(a, c, p);
		if(AC < 0)
			AC = -AC;
		//printf("AC:%d   \n", AC);
		BC = calculaArea(b, c, p);
		if(BC < 0)
			BC = -BC;
		//printf("BC:%d   \n", BC);
		if(AB + AC + BC == area)
			printf("* ");
		else
			printf("  ");
		}
		printf("\n");
	}
}
