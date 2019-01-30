// Trabalho Interdisciplinar //


#include<conio.h>
#include<stdio.h>
#include<string.h>
#include<stdlib.h>

struct cadastrocidade{
 char ncidade[30],estado[3];
 int nveiculos,nacidentes;
};


int menu();
cadastrocidade cadastrarcidade();
void visualizarcidades(cadastrocidade *cidades,int qtdecidades);
void maisacidentes(cadastrocidade *cidades,int qtdecidades);
void menosacidentes(cadastrocidade *cidades,int qtdecidades);
void mediaveiculos(cadastrocidade *cidades,int qtdecidades);
void mediaacidentes(cadastrocidade *cidades,int qtdecidades);
void maisacidentesestado(cadastrocidade *cidades,int qtdecidades);

void main (){
  int opcao=0;
  cadastrocidade *cidades;
  //contador de cadastradas e variavel para armazenar a quantidade total
  int contcadastradas=0;
  int qtdecidades=0;
  clrscr();
  printf("\n==============================================================");
  printf("\n---------------------INICIANDO SOFTWARE -----------------------");
  printf("\n==============================================================");
  printf("\n\nDigitar quantidade de cidades envolvidas na pesquisa: ");
  scanf("%d",&qtdecidades);

  //alocando memoria para o numero de cidades digitado
  cidades = (cadastrocidade*)malloc(sizeof(cadastrocidade)*qtdecidades);


  while(opcao!=8){
	opcao=menu();
	switch(opcao){
	 case 1:
	//cadastrar cidade
	if(contcadastradas<qtdecidades){
		cidades[contcadastradas]=cadastrarcidade();
		contcadastradas++;
				printf("cidade cadastrada com sucesso... ");
	}
	else{
			printf("qtde maxima de cidades ja cadastrada (%d)",qtdecidades);

	}
	 break;
	 case 2:
	//visualizando cidades
	printf("Cidades Cadastradas: \n\n");
	visualizarcidades(cidades,contcadastradas);

	 break;
	 case 3:
	//cidades com o maior numero de acidentes
	maisacidentes(cidades,contcadastradas);

	 break;
	 case 4:
	//cidades com o maior numero de acidentes
		menosacidentes(cidades,contcadastradas);

	 break;
	 case 5:
	//mediaveiculos
		mediaveiculos(cidades,contcadastradas);
	 break;
	 case 6:
	//mediaacidentes
		mediaacidentes(cidades,contcadastradas);
	 break;
	 case 7:

	//estado com maior acidentes com vitimas

	maisacidentesestado(cidades,contcadastradas);
	 break;
	 case 8:
		clrscr();
		printf("FINALIZADO\nPressione qualquer tecla para sair!");

	 break;
	 default:
		printf(" %d <<opcao invalida... ",opcao);

	}
	getch();
  }

}



int menu(){
  clrscr();
  int opcao;
  gotoxy(15,3);
  printf("Sistema de Estatistica ");
  gotoxy(15,10);
  printf("[1]- Cadastro Cidade: ");
  gotoxy(15,11);
  printf("[2]- Vizualizar Cidades Cadastradas: ");
  gotoxy(15,12);
  printf("[3]- Cidades Com Maior Numero de Acidentes: ");
  gotoxy(15,13);
  printf("[4]- Cidades Com Menor Numero de Acidentes: ");
  gotoxy(15,14);
  printf("[5]- Media de Veiculos:  ");
  gotoxy(15,16);
  printf("[6]- Media de Acidentes Com Vitimas Por Estado: ");
  gotoxy(15,17);
  printf("[7]- Estado Com Maior Media de Acidentes Com Vitimas : ");
  gotoxy(15,18);
  printf("[8]- Sair do Programa : ");
  gotoxy(50,24);
  printf("Opcao [  ] ");
  gotoxy(57,24);
  scanf("%d",&opcao);
  return opcao;
}


//funcao para cadastrar as cidades
cadastrocidade cadastrarcidade(){

	  //cria um registro temporario para armazenar osdados da nova cidade
	  cadastrocidade temp;
	  printf("\nDigite o nome da cidade: ");
	  fflush(stdin);
	  gets(temp.ncidade);
	  printf("\nDigite o estado da cidade: ");
	  gets(temp.estado);
	  printf("\nDigite a quantidade de veiculos de passeio existentes em 2008: ");
	  scanf("%d",&temp.nveiculos);
	  printf("\nDigite a quantidade de acidentes com vitimas em 2008: ");
	  scanf("%d",&temp.nacidentes);

	  //retorna os dados para o destino (vetor de cidades)
	  return temp;

}

//funcao para visualizar as cidades
void visualizarcidades(cadastrocidade *cidades,int qtdecidades){
	  int i;
	  if(qtdecidades!=0){

		for(i=0;i<qtdecidades;i++){
		printf("\n%d --------------------------------\n"
			   "Nome..........: %s\n"
				   "Estado........: %s\n"
				   "Veiculos/2008.: %d\n"
				   "Acidentes/2008: %d\n",(i+1),cidades[i].ncidade,cidades[i].estado,cidades[i].nveiculos,cidades[i].nacidentes);

	}
	  }
	  else{
		printf("Nenhuma cidade no cadastro ainda...");

	  }

}

//funcao para ver qual cidade em maiior numero de acidentes
void maisacidentes(cadastrocidade *cidades,int qtdecidades){
	int maiornacidentes;
	if(qtdecidades!=0){
		 maiornacidentes=cidades[0].nacidentes;
				 int i;
		 for(i=1;i<qtdecidades;i++){
			if(cidades[i].nacidentes>maiornacidentes){
				maiornacidentes=cidades[i].nacidentes;
			}
		 }


		 //imprimindo todas as cidades que tiverem o maiornacidentes
		 for(i=0;i<qtdecidades;i++){
			if(cidades[i].nacidentes==maiornacidentes){
				printf("\n%d ------------------------\n"
					   "Nome..........: %s\n"
					   "Estado........: %s\n"
					   "acidentes/2008: %d",(i+1),cidades[i].ncidade,cidades[i].estado,cidades[i].nacidentes);

			}

		 }

	}
	else{
			printf("Nenhuma cidade cadastrada... ");
	}


}
//funcao para ver qual cidade em menor numero de acidentes
void menosacidentes(cadastrocidade *cidades,int qtdecidades){
	int menornacidentes;
	if(qtdecidades!=0){
		 menornacidentes=cidades[0].nacidentes;
				 int i;
		 for(i=1;i<qtdecidades;i++){
			if(cidades[i].nacidentes<menornacidentes){
				menornacidentes=cidades[i].nacidentes;
			}
		 }


		 //imprimindo todas as cidades que tiverem o menornacidentes
		 for(i=0;i<qtdecidades;i++){
			if(cidades[i].nacidentes==menornacidentes){
				printf("\n%d ------------------------\n"
					   "Nome..........: %s\n"
					   "Estado........: %s\n"
					   "acidentes/2008: %d",(i+1),cidades[i].ncidade,cidades[i].estado,cidades[i].nacidentes);

			}

		 }

	}
	else{
			printf("Nenhuma cidade cadastrada... ");
	}


}

//funcao para tirar a media de veiculos
void mediaveiculos(cadastrocidade *cidades,int qtdecidades){
		float media=0;
	if(qtdecidades!=0){
		for(int i=0;i<qtdecidades;i++){
					media=media+cidades[i].nveiculos;
		}
		media=media/qtdecidades;
				printf("\nA media de veiculos: %.2f",media);

	}
		else{
			printf("Nenhuma cidade cadastrada... ");
	}


}


//funcao para tirar a media de acidentes
void mediaacidentes(cadastrocidade *cidades,int qtdecidades){
	float media=0;
	int cont=0;
	char estado[3];
	printf("Digite o estado: ");
	fflush(stdin);
	gets(estado);
	if(qtdecidades!=0){
		for(int i=0;i<qtdecidades;i++){
		      if(strcmp(estado,cidades[i].estado)==0)
		      {
					media=media+cidades[i].nacidentes;
					cont++;
		      }
		}
		media=media/cont;
				printf("\nA media de acidentes: %.2f",media);

	}
		else{
			printf("nenhuma cidade cadastrada... ");
	}
}


void maisacidentesestado(cadastrocidade *cidades,int qtdecidades){
	int maiornacidentes;
	if(qtdecidades!=0){
		 maiornacidentes=cidades[0].nacidentes;
				 int i;
		 for(i=1;i<qtdecidades;i++){
			if(cidades[i].nacidentes>maiornacidentes){
				maiornacidentes=cidades[i].nacidentes;
			}
		 }


		 //imprimindo todas as cidades que tiverem o maiornacidentes
		 for(i=0;i<qtdecidades;i++){
			if(cidades[i].nacidentes==maiornacidentes){
				printf("\n%d ------------------------\n"
					   "Estado........: %s\n"
					   "acidentes/2008: %d",(i+1),cidades[i].estado,cidades[i].nacidentes);

			}

		 }

	}
	else{
			printf("nenhuma cidade cadastrada... ");
	}


}