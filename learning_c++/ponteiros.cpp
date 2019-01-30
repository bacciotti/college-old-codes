#<include stdio.h>
#<include conio.h>
#<include stdlib.h>

struct No{
    char *p_dados;
    struct No *p_prox;
};

void criar_Lista(struct No **p_Raiz){
    *p_Raiz = NULL;
}

int inserir_No_Inicio(struct No **p_Raiz, char *p_String){
    struct No *p_Novo;
         /** Alocação dinâmica da memoria */
    if((p_Novo = (struct No *) malloc(sizeof(struct No))) == NULL ){
        puts( "Falta Memoria\n");  return -1 ;
      }
 
    p_Novo->p_dados = p_String;
 
    if(*p_Raiz == NULL){
        *p_Raiz = p_Novo;
        p_Novo->p_prox = NULL;
    }else{
        p_Novo->p_prox = *p_Raiz;
        *p_Raiz = p_Novo;
    }
}


void mostrar_Do_Fim_Para_Raiz(struct No *p_Raiz){
    if(p_Raiz == NULL) printf("\nLista vazia");
    else{
        struct No *p_Atual_Corredor, *p_Atual_Fim;
        p_Atual_Corredor = p_Raiz;
        p_Atual_Fim = p_Raiz;
        while(p_Atual_Fim->p_prox != NULL){ //ir para o ultimo elemento
            p_Atual_Fim = p_Atual_Fim->p_prox;
        }
        while(p_Atual_Corredor != p_Atual_Fim){
            if(p_Atual_Corredor->p_prox == p_Atual_Fim){
                printf(" <- %s", p_Atual_Fim->p_dados);
                p_Atual_Fim = p_Atual_Corredor;
                p_Atual_Corredor = p_Raiz;
            }
            else p_Atual_Corredor = p_Atual_Corredor->p_prox;
        }
        printf(" <- %s", p_Atual_Fim->p_dados);
    }
}

void main(){
	criar_Lista();
	Inserir_No_Inicio();
	(mostrar_Do_Fim_Para_Raiz();

}
