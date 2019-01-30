#include<stdio.h>
#include<conio.h>


// COM RETORNO E SEM PARAMETROS

int pediridade(); //prototipo da funcao pediridade




void main(){
int x;
clrscr();
x = pediridade();
printf("Voce tem %d anos!!", x);

getch();
}


int pediridade(){ //funcao criada para retornar a idade
int idade;
printf("Digite sua idade: ");
scanf("%d",&idade);

return (idade);

}