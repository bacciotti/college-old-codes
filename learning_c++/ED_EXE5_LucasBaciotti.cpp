#include <stdio.h>
#include <stdlib.h>
#define MALLOC(x) ((x *) malloc (sizeof(x)))  //Este define torna a utilização do malloc mais fácil

void insere (void);
void exibir (void);
void exclui (void);

struct no{
       int item;
       struct no *proximo;
         };

typedef struct no no_t;

no_t *primeiro, *novo, *ultimo;

int main (void)
{
int op;
primeiro = novo = ultimo = 0;
for (;;)
{
  system("clear");
  printf("\n1- Inserir");
  printf("\n2- Exibir");
  printf("\n3- Excluir");
  printf("\n4- Sair");
  printf("\nSua opção: ");
  scanf ("%d",&op);
  switch(op){
        case 1 : insere();
                 break;
        case 2 : exibir();
                 break;
        case 3 : exclui();
                 break;
        case 4 : exit (0);
        default: printf("Opcao Errada");
            }
}
}

void insere (void)
{
int j;
system("clear");
printf("ITEM : ");
scanf ("%d",&j);
novo = MALLOC(no_t);
novo->proximo = 0;
novo->item = j;
if (primeiro == 0)
    primeiro = novo;
else
    ultimo->proximo = novo;
ultimo=novo;
}

void exibir (void)
{
no_t *p;
char s[80];
system("clear");
if (primeiro == 0)
{
  printf("Lista Vazia");
  return;
}
p = primeiro;
do{
    printf("\nITEM %d",p->item);
    p = p->proximo;
   }while (p!=0);
printf("\n<S>air");
scanf("%s",&s);
}

void exclui (void)
{
no_t *anterior, *novo1;
int j,i;
novo1 = primeiro;
system("clear");
if (primeiro == 0)
{
  printf("Lista Vazia");
  return;
}
i = 0;
printf("Digite o item que deseja excluir: ");
scanf ("%d",&j);
do{
    if (novo1->item == j)
    {
     if (primeiro->proximo == 0)
     {
      primeiro = novo = ultimo = 0;
      break;
     }
     else
     if (novo1->proximo == 0)
     {
      anterior->proximo=0;
      free(novo1);
      break;
     }
     else
     if (i==0  && primeiro->proximo != 0)
     {
      primeiro = novo1->proximo;
      novo1->proximo = 0;
      free(novo1);
      break;
     }
     else
     if (novo1->proximo != 0);
     {
      anterior->proximo = novo1->proximo;
      novo1->proximo = 0;
      free(novo1);
      break;
     }
    }
    anterior = novo1;
    novo1 = novo1->proximo;
    i = i + 1;
   }while(novo1 != 0);
}
