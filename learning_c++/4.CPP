#include<stdio.h>
#include<conio.h>
#include<string.h>

struct dados{
    int idade, num;
	    };



void main(){
clrscr();
	 int i ;
dados atletas[10];
    for (i=0;i<10;i++){
    printf("Digite a idade do atleta %d: ", i+1);
    scanf("%d",&atletas[i].idade);
    printf("Digite o numero da sorte do atleta %d: ", i+1);
    scanf("%d",&atletas[i].num);
		      }

    for (i=0;i<10;i++){
printf("\nA idade do atleta %d e %d e seu numero da sorte e %d.",i,atletas[i].idade, atletas[i].num);
     }

getch();
}
