package br.com.ases.controller;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;

@Resource()
public class ErrorController {
	
	@Path("/error")
	public void index() {}

}
