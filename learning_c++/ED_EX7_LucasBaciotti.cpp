// Programa desenvolvido para o DEV-C++ por Lucas Baciotti Moreira
// Curso de Sistemas de Informação - FEIT/UEMG - SEGUNDO ANO
// Disciplina: Estruturas de Dados - Professor Walteno Martins
// Junho de 2010


#include <stdio.h>      //Bibliotecas
#include <stdlib.h>
#include <conio.h>
#define nroNo 100    // Definicao de constante nroNo = 100;
#define lv -1       // Definicao de constante lv = -1 (em C++ uma lista vazia é -1, uma vez que 0 seria uma posição)

struct tNo {             //Montando o registro (matriz, struct)
	int codigo;          // Criando um inteiro que vai guardar o codigo do aluno
	char nome[30];       // Variavel que vai guardar o nome do aluno, suportando 30 caracteres
	float nota;         // Nota do aluno em ponto flutuante (pode ser valores decimais)
	int prox;          // Inteiro que vai indicar o proximo no da lista
	};                 // Fim da matriz

struct tNo no[nroNo];      // criando um NO a partir da matriz montada previamente
int disp = 0;              // com as variaveis disp (que inicia sempre com 0)
int p, l1;                // e inteiros p e l1 

void aloca_memoria()        // criacao do procedimento que vai montar a lista alocando espacos na memoria
{
 int k;                       //declara-se um inteiro k 
 for (k=0; k < (nroNo - 1); k++){       // inicio do ciclo FOR - k vai de 0 ate o valor de nroNo - 1, e incrementa-se a cada ciclo
		no[k].prox = k + 1;             //Atribui o valor de k+1 no campo PROX do NO na posicao K 
		printf("%d ",no[k].prox);       //Imprime o proximo valor da lista
	}                                   // fim do ciclo FOR
 no[nroNo - 1].prox = lv;               //Atribui o valor de LV no campo PROX da matriz NO na posicao nroNo-1
 disp = 0;                              // Atribui 0 a varival disp 
}                                          // fim do procedimento aloca memoria

int pega_no()                                //inicio de um procedimento que vai pegar o proximo no a ser utilizado
{
 int i;                                      //declara-se um inteiro i

 if(disp == lv) {                            // se o valor de disp for igual a lv
	 printf("lista cheia\n");                // imprima LISTA CHEIA
	 getch();                                // espere um botao ser pressionado
	 exit(1);                                
	}
 else{                                         //SENAO 
			i = disp;                          //atribui o valor de dips a variavel inteira i
		
			disp = no[disp].prox;                       // atribui o valor do campo prox do registro no na posicao disp a mesma variavel disp
			}      // fim do ciclo if
 return(i);  //retorna o valor de i
}                              //fim do procedimento pega no


void libera_no(int x) //inicio do procedimento para liberar nos usados, recebendo os parametros da main
{
	no[x].prox = disp;  //atribui ao campo prox da matriz no na posicao x o valor da variavel disp
	disp = x; //atribui a variavel disp o valor de x
	return;
} //fim do procedimento


int insere_fim(int l, int x) //inicio da funcao que vai receber dois parametros da main e vai inserir no fim da lista
{
	int p, aux; //declaracao de variaveis inteiras p e aux
	p = l; //atribuicao a p o valor recebido pela main l
	aux = pega_no();  //atribui a variavel aux o valor de retorno recebido pela funcao pega_no
	no[aux].codigo = x; //atribui a posicao aux no registro no no campo codigo o valor que esta em x
	no[aux].prox = lv; //atribui a posicao aux no registro no no campo prox o valor que esta em lv
	if (p == lv) {   //se p for igual a lv
			l = aux; //l recebe aux
		 } 
		 else { //senao
			while(no[p].prox != lv) { //enquanto no na posicao p no cmapo prox for diferente de lv
				p = no[p].prox; //variavel p vai receber o valor que esta no campo prox da posicao p do registro no
				}
			no[p].prox = aux;    //posicao p do registro no no cmapo prox vai receber aux
		 }  //fim do if
	return(l);
} //fim do procedimento insere_fim


int remove_ultimo(int l) //inicio da funcao remove ultimo que vai pegar um parametro da main
{
	int p, aux, aux2, x; //declaracao de variaveis inteiras
	p = l;  //p recebe o valor de l, que foi recebido da main
	aux2 = lv; //a variavel aux2 recebe o valor de lv
	aux = lv; //a variavel aux recebe o valor de lv
	if(p != lv){  //inicio do se  - se p for diferente de lv
			while(p != lv) { //enquanto p for diferente de lv
				aux2 = aux; //atribua o valor de aux na variavel aux2
				aux = p; //e o valor de p na variavel aux
				p = no[p].prox; //e o valor que esta contido no campo prox da posicao p da matriz no a variavel p
				} //fim do while
			if(aux == lv){ //se aux for igual a lv
					x = no[aux].codigo; //atribua o valor do campo codigo, na posicao aux da matriz no a x
					libera_no(aux); //chama a funcao libera_no e passa aux como parametro
					printf("\nElemento removido = %d",x); //imprime x
					p = lv; //atribui lv a p
				}
				else{ //SENAO
					x = no[aux].codigo;//atribua o valor do campo codigo, na posicao aux da matriz no a x
					no[aux2].prox = lv; //insere lv no campo prox da matriz no na posicao aux2
					libera_no(aux); //chama a funcao libera_no e passa aux como parametro
					printf("\nElemento removido = %d",x); //imprime x
					p = l; //atribui l a p
				}
		}
		else { //SENAO
			printf("lista vazia"); //imprime lista vazia
			p = lv; //atribui lv a p
		}
	return(p); //retorna p
} //fim da funcao remove_ultimo



void imprime(int l) //inicio da funcao que vai receber parametros da main e imprimir na tela
{
	 int q;
	 q = l;
	 printf("\n ---- lista ----"); //escreva ---lista---
	 printf("\n[ ");  //escreva [
	 while(q != lv){ //enquanto o valor de q for diferente do lv
			printf("%d ",no[q].codigo); //escreva na tela o valor que esta guardado no campo codigo, posicao q da matriz no
			q = no[q].prox; //e atribua a q a valor que esta no campo prox da matriz no na posicao q
	 }
	 printf(" ]"); //escreva ]
} //fim da funcao



int main()       //inicio do procedimento principal
{
	int x;  //declara um inteiro x
	system("cls"); //limpa a tela
	printf("tecle enter"); // imprime a frase TECLE ENTER
	getch(); //espere alguma tecla ser apertada
	aloca_memoria(); //chama a funcao aloca memoria 
	l1 = lv; //atribui o valor de lv a variavel l1
	printf("\n Disp_p = %d L1 = %d ",disp,l1); //escreve na tela o valor de disp e de l1
	l1 = insere_fim(l1,10); //atribui a varivel lq o valor retornado da funcao insere_fim, cuja passamos os parametros l1 e 10
	printf("\n Disp_p = %d L1 = %d ",disp,l1);//escreve na tela o valor de disp e de l1
	l1 = insere_fim(l1,20); //atribui a varivel lq o valor retornado da funcao insere_fim, cuja passamos os parametros l1 e 20
	printf("\n Disp_p = %d L1 = %d ",disp,l1);//escreve na tela o valor de disp e de l1
	l1 = insere_fim(l1,30); //atribui a varivel lq o valor retornado da funcao insere_fim, cuja passamos os parametros l1 e 40
	printf("\n Disp_p = %d L1 = %d ",disp,l1);//escreve na tela o valor de disp e de l1
	l1 = insere_fim(l1,40); //atribui a varivel lq o valor retornado da funcao insere_fim, cuja passamos os parametros l1 e 40
	printf("\n Disp_p = %d L1 = %d ",disp,l1);//escreve na tela o valor de disp e de l1
	imprime(l1); //imprime o valor da variavel l1
	l1 = remove_ultimo(l1); //atribui a variavel l1 o valor de retorno va funcao remove_ultimo
	imprime(l1);//imprime o valor da variavel l1
	printf("\ntecle enter");//escreve na tela TECLE ENTER
	getch(); //espere alguma tecla ser apertada
	l1 = remove_cabeca(l1);//atribui a variavel l1 o valor de retorno va funcao remove_cabeca
	imprime(l1);//imprime o valor da variavel l1
	l1 = remove_ultimo(l1);//atribui a variavel l1 o valor de retorno va funcao remove_ultimo
	imprime(l1);//imprime o valor da variavel l1
	l1 = insere_fim(l1,50);//atribui a variavel l1 o valor de retorno va funcao insere_fim
	printf("\n Disp_p = %d L1 = %d ",disp,l1); 
	imprime(l1);//imprime o valor da variavel l1
	l1 = insere_fim(l1,60);
	printf("\n Disp_p = %d L1 = %d ",disp,l1); //escreve na tela o valor de disp e de l1
	imprime(l1);//imprime o valor da variavel l1
	l1 = remove_cabeca(l1);//atribui a variavel l1 o valor de retorno va funcao remove cabeça
	imprime(l1);//imprime o valor da variavel l1
	l1 = remove_cabeca(l1);//atribui a variavel l1 o valor de retorno va funcao remove cabeça
	imprime(l1);//imprime o valor da variavel l1
	l1 = remove_ultimo(l1);//atribui a variavel l1 o valor de retorno va funcao remove ultimo
	imprime(l1);  //imprime o valor da variavel l1
	printf("\n -- fim --"); //escreve na tela FIM
	getch();   //espere alguma tecla ser apertada

}                                  //fim do procedimento principal
