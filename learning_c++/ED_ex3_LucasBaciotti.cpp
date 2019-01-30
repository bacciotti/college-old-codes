//LUCAS BACIOTTI MOREIRA
ESTRUTURA DE DADOS – SITEMAS DE INFORMACÃO II
lucas@baciotti.com
//


#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

                                           

int melhorvendedor(); // prototipos
int dados(); 
int calcular(); 


int vendedor, itensvendidos[10],i,codigo[10]; 
float totalvendas[10]; // variaveis globais



int main(){ //  funcao principal
    printf("Digite a quantidade de vendedores: ");
    scanf("%i",&vendedor);  
    printf("\n\n");
    dados();  // função que solicita os dados
    printf("\nMelhor vendedor\n");
    melhorvendedor();
    printf("\n\nSoma Total\n");
    calcular();
} 



int dados(){ // função que le os dados
    for(i=0;i<vendedor;i++){
       printf("Entre o codigo do vendedor: ");
       scanf("%i",&codigo[i]);
       printf("Quantidade de Itens Vendidos: ");
       scanf("%i",&itensvendidos[i]);
       printf("Digite o Valor total das Vendas: ");
       scanf("%f",&totalvendas[i]);
    }
} 



int melhorvendedor(){ //função que mostra o melhor vendedor
    float melhor=0;
    for(i=0;i<vendedor;i++){
       if(totalvendas[i]>melhor){
          melhor = totalvendas[i]; //  maior valor de vendas
          }
    }
    
    for(i=0;i<vendedor;i++){
        if(melhor <= totalvendas[i]){ // mostra o melhor vendedor
          printf("\ncodigo: %i",codigo[i]);
          printf("\nQuantidade de Venda: %i",itensvendidos[i]);
          printf("\nValor Total de Vendas: %.2f",totalvendas[i]);
          }
    }
    getch();
} 



int calcular(){ // funcao calcular as soma dos itens
    float somadosvalores=0,somaitens=0;
    for(i=0;i<vendedor;i++){
       somadosvalores = somadosvalores+totalvendas[i]; // total de vendas de todos os vendedores
       somaitens = somaitens+itensvendidos[i]; // itens vendidos de todos os vendedores
    }
    
    printf("\nValor Total de Vendas: %.2f",somadosvalores);
    printf("\nValor Total de Itens Vendidos: %.0f",somaitens);
    getch();
}

