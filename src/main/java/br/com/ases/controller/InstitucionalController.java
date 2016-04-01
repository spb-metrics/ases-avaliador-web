package br.com.ases.controller;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpRequest;
import org.apache.http.client.methods.HttpGet;
import org.jfree.chart.title.Title;
import org.omg.CORBA.PRIVATE_MEMBER;
import org.w3c.dom.html.HTMLTitleElement;

import com.jcabi.http.Request;

import br.com.ases.model.utilities.ManagerXml;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.ioc.spring.VRaptorRequestHolder;


@Resource
public class InstitucionalController {
	
	private String tituloPagina;
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
		
		tituloPagina = "Perguntas frequentes - ASES";
		//Seta o título da página 
		VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("tituloPagina", tituloPagina);
		
		ManagerXml managerXml = new ManagerXml(this.application.getRealPath("")+"/WEB-INF/perguntas-frequentes.xml");
		
		if(!managerXml.xmlPerguntaFrequenteExiste()){
			result.include("mensagem", "N&atilde;o foi poss&iacute;vel carregar o arquivo que armazena as perguntas e respostas! Ocorreu o problema: (Arquivo ou diretÃ³rio nÃ£o encontrado)");
			result.include("status", "error");
			this.validator.onErrorUsePageOf(InstitucionalController.class).perguntasFrequentes();
		}else
			this.result.include("perguntasFrequentes", managerXml.getPerguntasFrequentes());
	
	}
	
	@Path("/acessibilidade")
	public void acessibilidade() {
		tituloPagina = "Acessibilidade - ASES";
		//Seta o título da página 
		VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("tituloPagina", tituloPagina);
	}
	
	@Path("/mapa-site")
	public void mapa() {
		tituloPagina = "Mapa do site - ASES";
		//Seta o título da página 
		VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("tituloPagina", tituloPagina);
	}
	
	@Path("/criteriosSucesso")
	public void criteriosSucesso() {
		tituloPagina = "Critérios de sucesso - ASES";
		//Seta o título da página 
		VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("tituloPagina", tituloPagina);
	}
	
}