#include<conio.h>
#include<stdio.h>

void fatorial(){

int n, fatorial;
  printf("Digite o valor: ");
  scanf("%d", &n);

  fatorial = 1;

  while (n > 0) {
    fatorial = fatorial *  n;
    n--;        }

  printf("O fatorial desse numero e  %d\n",  fatorial);

  getch();
  clrscr();

}



void main (){
  fatorial ();
}