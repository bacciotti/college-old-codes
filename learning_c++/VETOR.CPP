#include<stdio.h>
#include<conio.h>


void main(){
clrscr();

int idades[10],i;

for (i=0;i<10;i++){

printf("Digite a idade %d:", i+1);
scanf("%d",&idades[i]);
}

printf("As idades digitadas foram:");
for (i=0;i<10;i++){
printf("%d -> ", idades[i]);

}


getch();
}