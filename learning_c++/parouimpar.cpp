#include<stdio.h>
#include<stdlib.h>
#include<conio.h>

main()
{
int numero,resto ;
	clrscr();
printf( "\n\nEste programa verifica se o numero e par ou impar.\n");
printf("\nDigite o numero a ser verificado.\n") ;
scanf("%d",&numero);




resto = numero % 2 ;//'%'igual a 'mod'


if(resto==1)//'= =' operador de igualdade não confundir com '=' que e atribuicao
{
printf("O numero e impar.\n\n") ;
system("pause");
}
else
{
printf("O numero e par.\n\n");
system("pause");
}


getch();
}