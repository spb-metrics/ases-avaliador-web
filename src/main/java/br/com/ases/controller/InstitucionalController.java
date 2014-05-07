package br.com.ases.controller;
import javax.servlet.ServletContext;

import br.com.ases.model.utilities.ManagerXml;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;


@Resource
public class InstitucionalController {
	
	private Result result;
	private final Validator validator;
	private ServletContext application; 
	
	public InstitucionalController(Result result, Validator validator, ServletContext application) {
		this.result = result;
		this.validator = validator;
		this.application = application;
	}
	
	@Path("/perguntas-frequentes")
	public void perguntasFrequentes() {
		
		ManagerXml managerXml = new ManagerXml(this.application.getRealPath("")+"/WEB-INF/perguntas-frequentes.xml");
		
		if(!managerXml.xmlPerguntaFrequenteExiste()){
			result.include("mensagem", "Não foi possível carregar o arquivo que armazena as perguntas e respostas! Ocorreu o problema: (Arquivo ou diretório não encontrado)");
			result.include("status", "error");
			this.validator.onErrorUsePageOf(InstitucionalController.class).perguntasFrequentes();
		}else
			this.result.include("perguntasFrequentes", managerXml.getPerguntasFrequentes());
	
	}
	
	@Path("/acessibilidade")
	public void acessibilidade() {}
	
	@Path("/mapa-site")
	public void mapa() {}
	
}