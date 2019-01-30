#include<conio.h>
#include<stdio.h>

void main (){
clrscr();

int mat[2][2],linha,coluna;

for(linha=0;linha<=1;linha++){
   for(coluna=0;coluna<=1;coluna++){

printf("Digite um valor:     ");
scanf("%d",&mat[linha][coluna]);

                       }
                             

}



for(linha=0;linha<=1;linha++){
   for(coluna=0;coluna<=1;coluna++){


printf("\nLinha:%d, coluna:%d -> %d",linha, coluna, mat[linha][coluna]);

}}
getch();
}