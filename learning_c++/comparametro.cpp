#include<stdio.h>
#include<conio.h>



//  SEM RETORNO E COM PARAMETROS


void mostrarnome(char n[30]);



void main(){
char nome[30];
printf("Digite seu nome: ");
fflush(stdin);
gets(nome);

mostrarnome(nome);

}

void mostrarnome(char n[30]){
printf("Seu nominho eh: %s", n);




getch();
}