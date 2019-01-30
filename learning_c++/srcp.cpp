#include<stdio.h>
#include<conio.h>

void ronaldo();


void main(char nome){
clrscr();
char nome[30];

printf("Digite seu nome: ");
fflush(stdin);
gets(nome);
ronaldo(char nome);

}




void ronaldo(char n){

printf("Seu nome eh %s", n);


getch();
}