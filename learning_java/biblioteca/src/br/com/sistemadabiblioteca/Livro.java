package br.com.sistemadabiblioteca;

public class Livro extends AcervoImpresso {

	private Integer isbn;
	private Integer nrEdicao;
	
	public Integer getIsbn() {
		return isbn;
	}
	public void setIsbn(Integer isbn) {
		this.isbn = isbn;
	}
	public Integer getNrEdicao() {
		return nrEdicao;
	}
	public void setNrEdicao(Integer nrEdicao) {
		this.nrEdicao = nrEdicao;
	}
	
	


}
