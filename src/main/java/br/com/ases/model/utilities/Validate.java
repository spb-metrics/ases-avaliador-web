package br.com.ases.model.utilities;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import br.com.ases.model.entity.Contato;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;

public class Validate {
	
	private final Validator validator;
	
	public Validate(Validator validator){
		this.validator = validator;
	}
	
	public boolean contato(Contato contato){
		boolean isValido =  true;
		
		if(contato.getNome() == null){
			this.validator.add(new ValidationMessage("N&atilde;o foi poss&iacute;vel enviar a mensagem! Favor preencher o campo NOME!", "error"));
			isValido = false;
		}else
			if(contato.getNome().length() > 200){
				this.validator.add(new ValidationMessage("N&atilde;o foi poss&iacute;vel enviar a mensagem! Ocorreu o problema: o campo NOME aceita at&eacute; 200 caracteres.", "error"));
				isValido = false;
			}
				
		if(contato.getEmail() == null){
			this.validator.add(new ValidationMessage("N&atilde;o foi poss&iacute;vel enviar a mensagem! Favor preencher o campo E-MAIL!", "error"));
			isValido = false;
		}else{
			Pattern p = Pattern.compile("^[\\w-]+(\\.[\\w-]+)*@([\\w-]+\\.)+[a-zA-Z]{2,7}$"); 
		    Matcher m = p.matcher(contato.getEmail()); 
		    if (!m.find()){
		    	this.validator.add(new ValidationMessage(" N&atilde;o foi poss&iacute;vel enviar a mensagem!  E-MAIL '"+contato.getEmail()+"' considerado inv&aacute;lido!", "error"));
		    	isValido = false;
		    }
		}
		
		if(contato.getAssunto() == null){
			this.validator.add(new ValidationMessage(" N&atilde;o foi poss&iacute;vel enviar a mensagem! Favor escolher uma das op&ccedil;&otilde;es no campo ASSUNTO!", "error"));
			isValido = false;
		}
			
		if(contato.getMensagem() == null){
			this.validator.add(new ValidationMessage(" N&atilde;o foi poss&iacute;vel enviar a mensagem! Favor preencher o campo MENSAGEM!", "error"));
			isValido = false;
		}else
			if(contato.getMensagem().length() > 500){
				this.validator.add(new ValidationMessage("N&atilde;o foi poss&iacute;vel enviar a mensagem! Ocorreu o problema: o campo MENSAGEM aceita at&eacute; 500 caracteres.", "error"));
				isValido = false;
			}
		
		return isValido;
	}
	
	public Validator getMessage(){
		return this.validator;
	}
	
}