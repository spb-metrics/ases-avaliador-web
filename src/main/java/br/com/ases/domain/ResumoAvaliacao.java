package br.com.ases.domain;

import br.com.checker.emag.OccurrenceClassification;

public class ResumoAvaliacao {
	
	private OccurrenceClassification tipo;
	private int quantidadeErros;
	private int quantidadeAvisos;
	
	
	public ResumoAvaliacao(OccurrenceClassification tipo,int quantidadeErros, int quantidadeAvisos){
		this.tipo = tipo;
		this.quantidadeAvisos = quantidadeAvisos;
		this.quantidadeErros = quantidadeErros;
	}
	
	public OccurrenceClassification getTipo() {
		return tipo;
	}
	
	public int getQuantidadeAvisos() {
		return quantidadeAvisos;
	}
	
	public int getQuantidadeErros() {
		return quantidadeErros;
	}
}
