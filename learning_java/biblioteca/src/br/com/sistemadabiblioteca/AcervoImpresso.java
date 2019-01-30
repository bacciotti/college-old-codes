package br.com.sistemadabiblioteca;

public class AcervoImpresso extends Acervo {
	
	private Integer codPublic;
	private Integer nrPag;
	private String nomeEdit;
	
	public Integer getCodPublic() {
		return codPublic;
	}
	public void setCodPublic(Integer codPublic) {
		this.codPublic = codPublic;
	}
	public Integer getNrPag() {
		return nrPag;
	}
	public void setNrPag(Integer nrPag) {
		this.nrPag = nrPag;
	}
	public String getNomeEdit() {
		return nomeEdit;
	}
	public void setNomeEdit(String nomeEdit) {
		this.nomeEdit = nomeEdit;
	}
	
	
	

}
