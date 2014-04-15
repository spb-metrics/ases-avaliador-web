package br.com.ases.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import br.com.ases.model.entity.Contato;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;

@Resource
@Path("/contato")
public class ContatoController {

	private Result result;
	private final Validator validator;
	
	public ContatoController(Result result, Validator validator) {
		this.result = result;
		this.validator = validator;
	}
	
	@Path("")
	public void index() {
		
		System.out.println("passando por aki");
	}
	
	@Post("/confirmacao")
	public void confirmation(Contato contato) {
		if(this.validateContato(contato)){
			System.out.println("envia email");
		}else{
			 this.validator.onErrorUsePageOf(ContatoController.class).index();
		}
	}
	
	private boolean validateContato(Contato contato){
		boolean isValido =  true;
		
		if(contato.getNome() == null){
			isValido = false;
			this.validator.add(new ValidationMessage("Não foi possível enviar a mensagem! Favor preencher o campo NOME!", "error"));
	    }
		
		if(contato.getEmail() == null){
			isValido = false;
			this.validator.add(new ValidationMessage("Não foi possível enviar a mensagem! Favor preencher o campo E-MAIL!", "error"));
		}else{
			Pattern p = Pattern.compile("^[\\w-]+(\\.[\\w-]+)*@([\\w-]+\\.)+[a-zA-Z]{2,7}$"); 
		    Matcher m = p.matcher(contato.getEmail()); 
		    if (!m.find()){
		    	isValido = false;
		    	this.validator.add(new ValidationMessage(" Não foi possível enviar a mensagem!  E-MAIL "+contato.getEmail()+" considerado inválido!", "error"));
		    }
		}
		
		if(contato.getAssunto() == null){
			isValido = false;
			this.validator.add(new ValidationMessage(" Não foi possível enviar a mensagem! Favor escolher uma das opções no campo ASSUNTO!", "error"));
		}
			
		if(contato.getMensagem() == null){
			isValido = false;
			this.validator.add(new ValidationMessage(" Não foi possível enviar a mensagem! Favor preencher o campo MENSAGEM!", "error"));
		}
		
		return isValido;
		
	}
	
}