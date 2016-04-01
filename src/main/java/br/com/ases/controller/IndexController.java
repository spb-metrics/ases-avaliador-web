package br.com.ases.controller;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.ioc.spring.VRaptorRequestHolder;
@Resource
public class IndexController {
	
	private String tituloPagina = "ASES - Avaliador e Simulador de AcessibilidadE em Sites";
	private Result result;
	
	public IndexController (Result result) {
		this.result = result;
	}
	
	@Path("/file")
	public void file() {}
	
	@Path("/full-text")
	public void text() {}
	
	@Path("/about")
	public void about() {}
	
	@Path("/")
	public void index() {
		VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("tituloPagina", tituloPagina);
	}
	
}
