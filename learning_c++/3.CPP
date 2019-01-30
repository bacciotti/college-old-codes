#include<conio.h>
#include<stdio.h>

void maior(){
   int x,y;
   printf ("Digite o primeiro valor: ");
   scanf("%d",&x);
   printf ("\n\nDigite o segundo valor: ");
   scanf("%d",&y);
   if (x>y)
   printf ("O maior número é %d.",x);
   else
   printf ("\n\n\nO maior numero e %d.",y);

   getch();
   clrscr();
}

void main (){
   maior();

}