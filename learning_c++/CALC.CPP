#include<stdio.h>
#include<conio.h>


void main (){
float v1, v2;
int opcao;

clrscr();


printf("::CALCULADORA ::");
printf("\n\n[1]  Somar dois numeros");
printf("\n[2]  Multiplicar dois numeros");
printf("\n[3]  Subtrair dois numeros");
printf("\n[4]  Dividir dois numeros");
printf("\n\nDigite a opcao desejada: ");
scanf("%i",&opcao);

printf("\nDigite o primeiro valor: ");
scanf("%f",&v1);
printf("Digite o segundo valor: ");
scanf("%f",&v2);


switch (opcao) {
       case (1): printf("\nO resultado e: %.2f",v1+v2);
       break;
       case (2): printf("\nO resultado e: %.2f",v1*v2);
       break;
       case (3): printf("\nO resultado e: %.2f",v1-v2);
       break;
       case (4):  if (v2==0)
		  printf("Impossivel dividir por ZERO!");
		  else
		  printf("\nO resultado e: %.2f",v1/v2);


       break;
       default: printf("\n\nOpcao Invalida!");
	    }




getch();
}