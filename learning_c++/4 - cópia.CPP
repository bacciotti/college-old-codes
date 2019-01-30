#include<conio.h>
#include<stdio.h>


void verifica(){
  int valor;
  printf("\n\n Digite o numero para ser verificado: ");
  scanf("%d",&valor);

  if (valor%2==0)
  printf("\n\n O valor digitado ‚ PAR ");
  else printf (" \n\nO valor digitado ‚ IMPAR ");
	      getch();
	      clrscr();
	      }

void main (){

verifica ();
}
