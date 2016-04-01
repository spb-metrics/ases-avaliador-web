package br.com.ases.controller;

import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class PesquisaController {
	


	private Result result;
	
	public PesquisaController(Result result) {
		this.result = result;
	}
	
	@Post("/pesquisar")
	public void pesquisar() {
	
	}
	
}
