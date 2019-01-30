package br.com.sistemadabiblioteca;

import java.util.Scanner;

public class CadastrarLivro {
	private Livro livro;
	private Scanner entrada;
	private CadLivro cad;
	
	public CadastrarLivro(){
		entrada=new Scanner(System.in);
		cad= new CadLivro();
	}
	
	public void cadastrarLivro(){
		
		livro=new Livro();
		System.out.println("Digite o c�digo de barras do Livro:");
		livro.setCodBarras(entrada.nextInt());
		System.out.println("Digite o T�tulo do Livro:");
		livro.setTitulo(entrada.next());
		System.out.println("Digite o c�digo da estante onde o livro se encontra:");
		livro.setCodEstante(entrada.nextInt());
		System.out.println("Digite o c�digo da prateleira:");
		livro.setCodPrat(entrada.nextInt());
		System.out.println("Digite o c�digo isbn do Livro:");
		livro.setIsbn(entrada.nextInt());
		System.out.println("Digite o nome da editora do Livro:");
		livro.setNomeEdit(entrada.next());
		System.out.println("Digite o n�mero da edi��o do Livro:");
		livro.setNrEdicao(entrada.nextInt());
		System.out.println("Digite o n�mero de p�ginas do Livro:");
		livro.setNrPag(entrada.nextInt());
		System.out.println("Digite o ano de publica��o do Livro:");
		livro.setCodPublic(entrada.nextInt());
		Livro l=cad.pesquisar(livro.getCodBarras());
		if(l==null){
			cad.cadastrar(livro);
			System.out.println("Cadastro realizado com sucesso!");
		}
		else{
			System.out.println("Erro ao cadastrar.Esse livro j� se encontra cadastrado na biblioteca.");
		}
		System.out.println("Livro ja cadastrados");
		cad.listar();
	}
	public static void main(String args[]){
		new CadastrarLivro().cadastrarLivro();
	}

}
