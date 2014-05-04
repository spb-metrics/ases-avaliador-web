package br.com.ases.controller;

import java.util.Date;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;
import br.com.checker.emag.xml.AvaliationReport;

@Resource
public class EseloController {
	
	private Result result;
	
	public EseloController(Result result){
		this.result = result;
	}
	
	@Path("/calcular-nota")
	@Post
	public void calcularNota(br.com.ases.teste.eselo.AvaliationReport resumo){
		
		Nota nota = new Nota("www.bento.ifrs.edu.br","02/05/2014", "8.5");
		
		result.use(Results.json()).withoutRoot().from(nota).serialize();
		
	}
	
	
	
	
	public class Nota {
		
		private String url;
		private String data;
		private String valor;
		
		
		
		public Nota(String url, String data, String valor) {
			super();
			this.url = url;
			this.data = data;
			this.valor = valor;
		}
		public String getUrl() {
			return url;
		}
		public void setUrl(String url) {
			this.url = url;
		}
		public String getData() {
			return data;
		}
		public void setData(String data) {
			this.data = data;
		}
		public String getValor() {
			return valor;
		}
		
		public void setValor(String valor) {
			this.valor = valor;
		}
		
		
	}

}
