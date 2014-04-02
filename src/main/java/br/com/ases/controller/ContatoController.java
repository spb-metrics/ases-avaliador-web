package br.com.ases.controller;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
@Resource
@Path("/contato")
public class ContatoController {
	


	private Result result;
	
	public ContatoController
	(Result result) {
		this.result = result;
	}
	
	@Path("")
	public void index() {
		
		System.out.println("passando por aki");
	}
	
	@Post("/confirmacao")
	public void confirmation() {
		System.out.println("passando por aki");
	}
	
}
