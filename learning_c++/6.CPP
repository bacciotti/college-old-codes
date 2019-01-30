#include<conio.h>
#include<stdio.h>

void mensagem (){
  gotoxy(23,12);
  printf("Pressione <ENTER> para finalizar.");
  getch();
  clrscr();
}



void main (){
  mensagem();
}