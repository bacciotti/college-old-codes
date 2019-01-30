#include<stdio.h>
#include<conio.h>

struct dados{
       int idade;
       char nome[30];
            }; 


void main(){
clrscr();
         int i ;

dados pessoas[5];
      for (i=0;i<5;i++){
      printf("Digite o nome da pessoa %d: ", i+1);
      fflush(stdin);
      gets(pessoas[i].nome);
      printf("\nDigite a idade da pessoa %d: ", i+1);
      scanf("%d", &pessoas[i].idade);
                        } 

       for (i=0;i<5;i++){
       printf("A pessoa %d chama-se %s e tem %d anos.", i, pessoas[i].nome, pessoas[i].idade);
}
                       


getch();
}

