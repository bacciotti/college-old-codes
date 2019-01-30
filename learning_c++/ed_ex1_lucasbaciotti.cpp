#include<conio.h> //bibliotecas
#include<stdio.h> 

void main(){
clrscr();
		int valor1, valor2, i;      //declaracao das 3 variaveis inteiras necessarias

printf("Digite o primeiro valor: "); //aqui inicia-se a solicitacao dos valores
scanf("%d",&valor1);
printf("Digite o segundo valor: ");
scanf("%d",&valor2);

		if (valor1==valor2)
		printf("\n\nOs valores NAO PODEM ser IGUAIS!") ;  // nesse IF testamos se um numero e igual ao outro. Se for, a mensagem aparece.

			 else if (valor1>valor2){   //Se os numeros entrados nao forem iguais, inicia-se o processo. Aqui ele verifica qual dos dois valores e maior e ja mostra o resultado na tela.
			 printf("\n\nO maior valor e %d.", valor1);
			printf("\n\nA diferenca e %d.\n\n", valor1-valor2); //nessa linha ele ja calcula a diferenca do maior pelo menor dentro do printf. Nao foram usadas variaveis so para calcular a subtracao. Depois de descobrir qual valor e maior ele ja calcula a diferenca e ja imprime.

										 for (i=valor2;i<=valor1;i++)       //nesse for iremos imprimir na tela os numeros compreendidos entre o menor e o maior numero entrado.
												 printf("%d - ",i);
															 }
								else {        //aqui comeca a segunda condicao. Se o segundo valor entrado for maior que o primeiro, executa tudo isso daqui pra baixo.
								printf("\n\nO maior valor e %d.", valor2);  //aqui imprime que o valor dois e maior que o primeiro
								printf("\n\nA diferenca e %d.\n\n", valor2-valor1); //Aqui ja imprime a diferenca do maior para o menor

												for (i=valor1;i<=valor2;i++) //nesse for vamos imprimir na tela os numeros compreendidos entre o menor e o maior numero entrado. Usamos um contador chamado I e o incremento i++.
												printf("%d - ",i);
																														 }

				if (valor1%2==0)    //Nessa condicao verficaremos se o resto da divisao do primeiro valor digitado por dois e zero. Depois desse processo vai imprimir na tela se o numero e PAR  ou IMPAR.
				printf("\n\nO primeiro valor digitado e PAR!");
				else printf("\n\nO primeiro valor digitado e IMPAR!");





getch();
}