#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#define nroNo 100
#define lv 0

struct tNo {
	int info;
	int prox;
	};

struct tNo no[nroNo];
int disp = 0;
int p, l1;

void aloca_memoria()
{
 int k;
 for (k=0; k < (nroNo - 1); k++){
		no[k].prox = k + 1;
		printf("%d ",no[k].prox);
	}
 no[nroNo - 1].prox = lv;
 disp = 0;
}

int pega_no()
{
 int i;
 /* printf("Disp = %d",disp); */
 if(disp == lv) {
	 printf("lista cheia\n");
	 getch();
	 exit(1);
	}
 else{
			i = disp;
			/* no[i].prox = lv;   */
			disp = no[disp].prox;
			}
 return(i);
}


void libera_no(int x)
{
	no[x].prox = disp;
	disp = x;
	return;
}

/* funcao que insere um elemento no final */
int insere_fim(int l, int x)
{
	int p, aux;
	p = l;
	aux = pega_no();
	no[aux].info = x;
	no[aux].prox = lv;
	if (p == lv) {
			l = aux;
		 }
		 else {
			while(no[p].prox != lv) {
				p = no[p].prox;
				}
			no[p].prox = aux;
		 }
	return(l);
}

/* funcao que remove o ultimo elemento */
int remove_ultimo(int l)
{
	int p, aux, aux2, x;
	p = l;
	aux2 = lv;
	aux = lv;
	if(p != lv){
			while(p != lv) {
				aux2 = aux;
				aux = p;
				p = no[p].prox;
				}
			if(aux == lv){
					x = no[aux].info;
					libera_no(aux);
					printf("\nElemento removido = %d",x);
					p = lv;
				}
				else{
					x = no[aux].info;
					no[aux2].prox = lv;
					libera_no(aux);
					printf("\nElemento removido = %d",x);
					p = l;
				}
		}
		else {
			printf("lista vazia");
			p = lv;
		}
	return(p);
}

/* funcao que remove o primeiro elemento */
int remove_cabeca(int l)
{
	int p, aux, aux2, x;
	p = l;
	if(p != lv){
			x = no[p].info;
			p = no[p].prox;
			libera_no(l);
			printf("\nElemento removido = %d",x);
			l = p;
		}
		else {
			printf("lista vazia");
		}
	return(l);
}


/* funcao que imprime a lista */
void imprime(int l)
{
	 int q;
	 q = l;
	 printf("\n ---- lista ----");
	 printf("\n[ ");
	 while(q != lv){
			printf("%d ",no[q].info);
			q = no[q].prox;
	 }
	 printf(" ]");
}



int main()
{
	int x;
system("cls");
	printf("tecle enter");
	getch();
	aloca_memoria();
	l1 = lv;
	printf("\n Disp_p = %d L1 = %d ",disp,l1);
	l1 = insere_fim(l1,10);
	printf("\n Disp_p = %d L1 = %d ",disp,l1);
	l1 = insere_fim(l1,20);
	printf("\n Disp_p = %d L1 = %d ",disp,l1);
	l1 = insere_fim(l1,30);
	printf("\n Disp_p = %d L1 = %d ",disp,l1);
	l1 = insere_fim(l1,40);
	printf("\n Disp_p = %d L1 = %d ",disp,l1);
	imprime(l1);
	l1 = remove_ultimo(l1);
	imprime(l1);
	printf("\ntecle enter");
	getch();
	l1 = remove_cabeca(l1);
	imprime(l1);
	l1 = remove_ultimo(l1);
	imprime(l1);
	l1 = insere_fim(l1,50);
	printf("\n Disp_p = %d L1 = %d ",disp,l1);
	imprime(l1);
	l1 = insere_fim(l1,60);
	printf("\n Disp_p = %d L1 = %d ",disp,l1);
	imprime(l1);
	l1 = remove_cabeca(l1);
	imprime(l1);
	l1 = remove_cabeca(l1);
	imprime(l1);
	l1 = remove_ultimo(l1);
	imprime(l1);
	printf("\n -- fim --");
	getch();

}
