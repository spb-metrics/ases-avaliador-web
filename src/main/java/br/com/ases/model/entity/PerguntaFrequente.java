package br.com.ases.model.entity;

import com.thoughtworks.xstream.annotations.XStreamAlias;



@XStreamAlias("perguntaFrequente")
public class PerguntaFrequente {
	private int id;
	private String pergunta;
	private String resposta;
	

	public PerguntaFrequente(String pergunta, String resposta) {
		this.pergunta = pergunta;
		this.resposta = resposta;
	}
	
	public PerguntaFrequente() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPergunta() {
		return pergunta;
	}

	public void setPergunta(String pergunta) {
		this.pergunta = pergunta;
	}

	public String getResposta() {
		return resposta;
	}

	public void setResposta(String resposta) {
		this.resposta = resposta;
	}
	
	

}
