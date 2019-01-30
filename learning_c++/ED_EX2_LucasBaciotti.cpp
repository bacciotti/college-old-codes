#include<stdio.h>
#include<conio.h>  //bibliotecas

float _nota1, _nota2, _nota3;
int _ap=0, _rep=0;    //variaveis GLOBAIS


void dados();
int media();   //prototipos das funcoes

void main(){   //inicio funcao principal
clrscr();
     int qnt, i;
     float mediaNotas;   //declaracao variaveis locais da main

printf("Entre com a quantidade de alunos: ");
scanf("%d",&qnt);   //guarda o dado de numero de alunos na variavel qnt
    for (i=0;i<qnt;i++) { //contador para que chame as duas funcoes tantas vezes quanto for a quantidade de alunos digitada
    dados();
    mediaNotas=media(); //chamada das funcoes
        }

printf("\n\n\n\nRESULTADO: %d aluno(s) APROVADO(s) e %d aluno(s) REPROVADO(s)!", _ap, _rep); //retorno de numero de aprovados e reprovados
getch();
     }


void dados(){  //funcao que vai solicitar as 3 notas e o nome do aluno
   char nome[30];

printf("\n\nDigite o nome: ");
scanf("%s",&nome);
printf("Digite a primeira nota de 0 a 10: ");
scanf("%f",&_nota1);
printf("Digite a segunda nota de 0 a 10: ");
scanf("%f",&_nota2);
printf("Digite a terceira nota de 0 a 10: ");
scanf("%f",&_nota3);
}



int media(){ //funcao que calcula a media e retorna para a main o resultado
   float media; //variavel local da funcao media

 media = (_nota1+_nota2+_nota3)/3;  //calculo da media

      if (media<6)         {
      printf("REPROVADO!"); //se o aluno for reprovado, incrementa-se a variavel rep, que se inicia com 0.
    _rep=_rep+1;
                 }
       else     {
       printf("APROVADO!");
           _ap=_ap+1;    //se o aluno for aprovado, incrementa-se a variavel ap, que se inicia com 0.
            }
getch();
 return(media); //retorna para a main o resultado do calculo da media
}
