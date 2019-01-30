#include<stdio.h>
#include<conio.h>


// FUNCAO SEM RETORNO E COM PARAMETRO (sem retorno por causa dos VOID,
// e com parametros por causa dos valores entre parenteses valor1,valor2
// , int x e int y


void somar (int x, int y); //prototipo da funcao somar

void main (){
clrscr();
int valor1,valor2;
clrscr();
printf("Digite o primeiro valor: ");
scanf("%d",&valor1);

printf("Digite o segundo valor: ");
scanf("%d",&valor2);

somar(valor1,valor2); //chamada da funcao somar com passagem de 2 parametros
}


void somar(int x, int y){ //funcao somar recebendo os dois valores da main
int soma;
soma = x+y;
printf("Resultado = %d", soma);

getch();
}