#include<stdio.h>
#include<conio.h>

void main(){
clrscr();
int mat[3][3], i, j, cont;

cont = 0;
for(i=0;i<3; i++)
   for(j=0;j<2;j++){
   mat[j][i]=cont;
   cont++;
  matriz[i][j]=cont;
}
matriz[2][2]=cont;
}


printf("\n mat[0][0] = %i", mat[0][0]);
printf("\n mat[0][1] = %i", mat[0][1]);
printf("\n mat[0][2] = %i", mat[0][2]);
printf("\n mat[1][0] = %i", mat[1][0]);
printf("\n mat[1][1] = %i", mat[1][1]);
printf("\n mat[1][2] = %i", mat[1][2]);
printf("\n mat[2][0] = %i", mat[2][0]);
printf("\n mat[2][1] = %i", mat[2][1]);
printf("\n mat[2][2] = %i", mat[2][2]);





getch();
}