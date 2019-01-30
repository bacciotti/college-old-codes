#include<stdio.h>
#include<conio.h>

void main (){

float n1, n2;
clrscr();

printf("Digite a nota do primeiro semestre: ");
scanf("%f",&n1);
printf("Digite a nota do segundo semestre: ");
scanf("%f",&n2);


printf("\n\nSua media e %.2f pontos.", (n1+n2)/2);
getch();

}