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
int p;

void aloca_memoria() {
 int k;
 for (k=0; k < nroNo - 1; k++){
	no[k].prox = k + 1;
	printf("%d",no[k].prox);
	}
 no[nroNo - 1].prox = lv;
}

int pega_no() {
 int x;
 if(disp == lv) {
	 printf("lista cheia\n");
	 getch();
	 exit(1);
	}
 x = disp;
 no[x].prox = lv;
 disp = no[disp].prox;
 return(x);
 }



void remove_no(int x) {
	no[x].prox = disp;
	disp = x;
	return;
	}

int insere_fim(int p, int x) {
	int q, aux;
	q = p;
	aux = pega_no();
	no[aux].info = x;
	no[aux].prox = lv;
	if (q == p) {
		q = aux;
                }
	   else     {
		while(no[q].prox != lv) {
		q = no[q].prox;
		}
                }
    }

int main() {
system("cls");
	getch();
	aloca_memoria();
	p = lv;
	insere_fim(p,10);
	insere_fim(p,20);
	insere_fim(p,30);
	insere_fim(p,40);
	printf("-- fim --");
	getch();
	return 0;

}

