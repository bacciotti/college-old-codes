package br.com.sistemadabiblioteca;

public interface InterfaceCadastro<T> {
	public void cadastrar(T classe);
	public T pesquisar(Integer cod);
	public void listar();
		
}
