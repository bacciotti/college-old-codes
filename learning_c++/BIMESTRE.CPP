#include<stdio.h>
#include<stdlib.h>
#include<conio.h>

int main(){
clrscr();
float a,b; 


printf(" Digite a primeira nota:" );
scanf("%f",&a);

printf("Digite a segunda nota:" );
scanf("%f",&b);


if((a+b)/2>=7)

printf("A media do aluno foi %.2f e o aluno foi APROVADO!",(a+b)/2);
else
printf("Faltaram %.2f pontos e o aluno foi REPROVADO!", (7-(a+b)/2));

getch();


}