#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#define nroNo 100
#define lv -1

struct tNo {
	int info;
	int prox;
	};

struct tNo no[nroNo];
int disp = 0;
int p, l1;

void aloca_memoria() {
 int k;
 for (k=0; k < (nroNo - 1); k++){
		no[k].prox = k + 1;
		printf("%d ",no[k].prox);
	}
 no[nroNo - 1].prox = lv;
 disp = 0;
}

int pega_no() {
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


void remove_no(int x) {
	no[x].prox = disp;
	disp = x;
	return;
	}


int insere_fim(int l, int x) {
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

void imprime(int l){
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

void imprime (pont l){
	printf("[");
	while (l<>lv) {
		printf("%d", mem[l].info);
		l==mem[l].prox;
		}
	printf("]");

getch();
}



void main() {
	clrscr();
	printf("tecle enter");
	getch();
	aloca_memoria();
	l1 = lv;
	imprime(l1);
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
	printf("\n -- fim --");
	getch();

}
