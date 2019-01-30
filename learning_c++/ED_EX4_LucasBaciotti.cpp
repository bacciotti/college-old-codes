#include<stdlib.h>
#include<conio.h>
#include<stdio.h>

int dados(int totalf, float notaf, char nome);
int calcular(int totalf, int ap, int rep, float notaf, char nome);

int main(){
    int alunos; 
    char nome;
    float notaf;
    int totalf,ap=0,rep=0,i;
    printf("Digite o numero de Alunos: ");
    scanf("%i",&alunos); 
    for(i=0;i<alunos;i++){
          dados(totalf,notaf,nome); 
          calcular(totalf,ap,rep,notaf,nome);
    }
    printf("Numero de Alunos Aprovados: %i",ap);
    printf("\nNumero de Alunos Reprovados: %i",rep);
}

int dados(int totalf, float notaf, char nome){
    
    printf("Digite seu nome: ");
    scanf("%s",&nome);
    printf("Digite sua nota: ");
    scanf("%f",&notaf);
    printf("Digite suas faltas: ");
    scanf("%i",&totalf);
    
}
    
int calcular(int totalf, int ap, int rep, float notaf, char nome){
    //int ap,rep;
    if ((notaf>=60)&&(totalf<=20)){
       printf("Aprovado");
       ap=ap+1;
       }
       else{
            printf("Reprovado");
            rep=rep+1;
            }   
}
