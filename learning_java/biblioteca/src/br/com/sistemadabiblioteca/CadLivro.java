package br.com.sistemadabiblioteca;

import java.util.ArrayList;
import java.util.List;

public class CadLivro implements InterfaceCadastro<Livro> {
	private List<Livro> listaLivros;
	
	public CadLivro(){
		listaLivros=new ArrayList<Livro>();
	}
	
	
	@Override
	public void cadastrar(Livro classe) {
		listaLivros.add(classe);
	}

	@Override
	public void listar() {
		for(Livro livro:listaLivros){
			System.out.println("Livro"+livro.getTitulo());
		}
		
	}

	@Override
	public Livro pesquisar(Integer cod) {
		for(int i=0;i<listaLivros.size();i++){
			Livro livro=listaLivros.get(i);
			if(livro.getCodBarras().equals(cod)){
				return livro;
			}
		}
		return null;
	}



}
