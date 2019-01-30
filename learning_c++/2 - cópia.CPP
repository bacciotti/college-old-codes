#include<conio.h>
#include<stdio.h>

void somar(){
  int x,y,soma;
  printf ("Digite o primeiro valor:");
  scanf("%d",&x);
  printf("\n\nDigite o segundo valor:");
  scanf("%d",&y);
  soma = x+y;
  printf (" \n\n\n A soma de %d com %d resulta em %d.",x,y,soma);
  getch();
  clrscr();
}


void main (){
  somar();
}