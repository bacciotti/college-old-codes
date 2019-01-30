#include <conio.h>
#include <stdio.h>


void soma(){


float v1,v2,soma;

printf("\n\nDigite o primeiro valor:");
scanf("%f",&v1);
printf("\nDigite o segundo valor:");
scanf("%f",&v2);
soma =(v1+v2);
printf ("\n\n\n A soma ‚:  %.1f", soma);

getch();
       }

void mensagem (){


printf ("Pressione <ENTER> para iniciar o programa de soma ");
	       getch();

		}

void verifica(){
int valor;
printf("\n\n\n\n Pressione <ENTER> para verificar se o valor ‚ PAR ou IMPAR ");
getch();
printf("\n\n Digite o numero para ser verificado: ");
scanf("%d",&valor);

if (valor%2==0)
  printf("\n\n O valor digitado ‚ PAR ");
  else printf (" \n\nO valor digitado ‚ IMPAR ");
	      getch();

	      }

void posi(){
int vd;
printf ("\n\n Digite o valor para verificar se ‚ POSITIVO ou NEGATIVO: ");
scanf("%d",&vd);
if (vd<0){
printf ("\n\n O numero digitado ‚ NEGATIVO ");
	 }
if (vd>0){
printf ("\n\n O numero digitado ‚ POSITIVO ");
}
if (vd==0){
printf ("\n\nO numero digitado ‚ ZERO, e ZERO ‚ um VALOR NULO. ");
	  }
     getch();
}
int main(){

int opcao;


printf(" Digite a opcao desejada: ");
printf("\n\n\n [1] - Fun‡ao Mensagem ");
printf ("\n\n\n [2] - Fun‡ao Somar Valores");
printf ("\n\n\n [3] - Fun‡ao PAR ou IMPAR ");
printf ("\n\n\n [4] - Fu‡ao POSITIVO ou NEGATIVO ");
printf ("\n\n\n\n\n Digite o numero da opcao: ");
 scanf("%d",&opcao);
 switch (opcao){
 case 1:
    mensagem ();
    break;
 case 2:
    soma ();
    break;
 case 3:
    verifica ();
    break;
 case 4:
    posi();


}    getch();

	   }
