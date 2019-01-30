#include<stdio.h>
#include<conio.h>
#include<string.h>


void main(){

clrscr();
char nome[30];
int tam,i;

printf("Digite o nome desejado, não vale ROnaldo!");
fflush(stdin);
gets(nome);


if (nome="ronaldo")
 printf("Proibido brilhar muito no Curintss");
else
   tam=strlen(nome);
for(i=0;i<tam;i++){
printf("\n\n %c",nome[i]);
}






getch();
}
