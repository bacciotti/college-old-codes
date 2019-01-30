#include<stdio.h>
#include<conio.h>
#include<string.h>

struct pontos{
      float x,y;
	     };

void main(){
clrscr();
    char nome[30];
pontos coord[2];

printf("Digite seu nome: ");


fflush(stdin);
gets(nome);



printf("Digite a coordenada X: ");
scanf("%f",&coord[0].x);
printf("Digite a coordenada Y: ");
scanf("%f",&coord[0].y);

if (coord[0].x<0 || coord[0].x>80){
printf("Valores incompativeis!!! !!11!");                          
}
else
{

if (coord[0].y<0 || coord[0].y>25){
printf("Valores incompativeis!!! !!11!");
}
else{                       


gotoxy(coord[0].x,coord[0].y);
	 printf("%s", nome);
}
           }












getch();
}


