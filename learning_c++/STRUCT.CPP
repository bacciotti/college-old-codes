#include<conio.h>
#include<stdio.h>
#include<string.h>

struct coordenadas{
    int x,y;

};



void main (){
    clrscr();
	  char nome[30];


    coordenadas pontos;

      printf ("Digite seu nome: ");
      fflush(stdin);
      gets(nome);



      printf ("Digite o valor de X: ");
      scanf("%d",&pontos.x);
      printf ("Digite o valor de Y: ");
      scanf("%d",&pontos.y);

     gotoxy(pontos.x,pontos.y);
     printf("%s",nome);







  getch();
}