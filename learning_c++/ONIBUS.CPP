#include<stdio.h>
#include<conio.h>
#include<string.h>


void main (){
clrscr();
int i, tamanho;
char texto01[40],texto02[40];
strcpy(texto01,"onibus");
strcpy(texto02,"onibus");
tamanho = strlen(texto01);
   for(i=0;i<tamanho;i++){
               texto02[(tamanho-1)-i]= texto01[i];
}
printf("%s %s",texto02,texto01);







getch();
}

