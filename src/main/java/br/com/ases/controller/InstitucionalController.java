package br.com.ases.controller;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
@Resource
public class InstitucionalController {
	

	
	@Path("/perguntas-frequentes")
	public void perguntasFrequentes() {}
	
	@Path("/acessibilidade")
	public void acessibilidade() {}
	
	@Path("/mapa-site")
	public void mapa() {}
	
}
