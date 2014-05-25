package br.com.ases.model.entity;

public class RelatorioAvaliacaoJasper{

	private String grupo;
	private String tipoErro;
	private String recomendacao;
	private int quantidade;
	private String linhasCodigo;
	
	public RelatorioAvaliacaoJasper() {  
           
    } 
	
	public String getRecomendacao() {
		return recomendacao;
	}
	public void setRecomendacao(String recomendacao) {
		this.recomendacao = recomendacao;
	}
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	public String getlinhasCodigo() {
		return linhasCodigo;
	}
	public void setlinhasCodigo(String linhasCodigo) {
		this.linhasCodigo = linhasCodigo;
	}
	public String getGrupo() {
		return grupo;
	}
	public void setGrupo(String grupo) {
		this.grupo = grupo;
	}
	public String getTipoErro() {
		return tipoErro;
	}
	public void setTipoErro(String tipoErro) {
		this.tipoErro = tipoErro;
	}
		
}