package br.com.ases.model.utilities;

import static br.com.checker.emag.core.Checker.from;
import groovy.time.BaseDuration.From;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;

import br.com.ases.infra.WebChecker;
import br.com.ases.model.entity.Contato;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.com.checker.emag.core.Checker;

public class Validate {
	
	private final Validator validator;
	
	public Validate(Validator validator){
		this.validator = validator;
	}
	
	public boolean contato(Contato contato){
		boolean isValido =  true;
		
		if(contato.getNome() == null){
			this.validator.add(new ValidationMessage("Favor preencher o campo NOME!", "error"));
			isValido = false;
		}else
			if(contato.getNome().length() > 200){
				this.validator.add(new ValidationMessage("O campo NOME aceita at&eacute; 200 caracteres.", "error"));
				isValido = false;
			}
				
		if(contato.getEmail() == null){
			this.validator.add(new ValidationMessage("Favor preencher o campo E-MAIL!", "error"));
			isValido = false;
		}else{
			Pattern p = Pattern.compile("^[\\w-]+(\\.[\\w-]+)*@([\\w-]+\\.)+[a-zA-Z]{2,7}$"); 
		    Matcher m = p.matcher(contato.getEmail()); 
		    if (!m.find()){
		    	//this.validator.add(new ValidationMessage("N&atilde;o foi poss&iacute;vel enviar a mensagem!  E-MAIL '"+contato.getEmail()+"' considerado inv&aacute;lido!", "error"));
		    	this.validator.add(new ValidationMessage("E-MAIL considerado inv&aacute;lido!", "error"));
		    	isValido = false;
		    }
		}
		
		if(contato.getAssunto() == null){
			this.validator.add(new ValidationMessage("Favor escolher uma das op&ccedil;&otilde;es no campo ASSUNTO!", "error"));
			isValido = false;
		}
			
		if(contato.getMensagem() == null){
			this.validator.add(new ValidationMessage("Favor preencher o campo MENSAGEM!", "error"));
			isValido = false;
		}else
			if(contato.getMensagem().length() > 500){
				this.validator.add(new ValidationMessage("O campo MENSAGEM aceita at&eacute; 500 caracteres.", "error"));
				isValido = false;
			}
		
		return isValido;
	}
	
	
	
	
	public boolean url(String campo){
		
		boolean isValido = true;
		int codResponse;
		HttpMethod metodoRequisicaoGET = null;
		HttpClient clienteHTTPJakartaCommons;
		URL UrlConvertida;
		
		if(campo == null || campo.length() <= 10 ){
			this.validator.add(new ValidationMessage("N&atilde;o foi poss&iacute;vel realizar a avalia&ccedil;&atilde;o! Favor preencher o campo URL.", "warning"));
			isValido = false;
		}else{
			try {
				 //URL url = new URL(campo);				 
			
			    //URLConnection conn = url.openConnection();
			   // conn.connect();
				
					UrlConvertida = new URL(campo);
				
					clienteHTTPJakartaCommons = new HttpClient();
					clienteHTTPJakartaCommons.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler(3,false));
					clienteHTTPJakartaCommons.getParams().setParameter("http.protocol.allow-circular-redirects", true); 
					
					metodoRequisicaoGET = new GetMethod(UrlConvertida.toExternalForm());
				
					metodoRequisicaoGET.setRequestHeader("http.agent", "Jakarta Commons-HttpClient/3.1");
					metodoRequisicaoGET.setFollowRedirects(true);
					
					codResponse = clienteHTTPJakartaCommons.executeMethod(metodoRequisicaoGET);
					
					if(codResponse != 200)
					{
						this.validator.add(new ValidationMessage("N&atilde;o foi poss&iacute;vel realizar a avalia&ccedil;&atilde;o! URL "+campo+" é considerada inválida.", "warning"));
						isValido = false;
					}
					else
					{
						isValido = true;
					}
					
			} catch (MalformedURLException e) {
				e.printStackTrace();
				this.validator.add(new ValidationMessage("N&atilde;o foi poss&iacute;vel realizar a avalia&ccedil;&atilde;o! URL "+campo+" é considerada inválida.", "warning"));
				isValido = false;
			} catch (IOException e) {
				e.printStackTrace();
				this.validator.add(new ValidationMessage("N&atilde;o foi poss&iacute;vel realizar a avalia&ccedil;&atilde;o! URL "+campo+" é considerada inválida.", "warning"));
				isValido = false;
			}
		}
		
		return isValido;
	}
	
	
	public boolean condigoFonte(String campo){
		
		if(campo == null || campo.length() <= 10 ){
			this.validator.add(new ValidationMessage("N&atilde;o foi poss&iacute;vel realizar a avalia&ccedil;&atilde;o! Favor preencher o campo C&oacute;digo a analisar.", "warning"));
			return false;
		}
		
		String reg = "<html.*?>(.*)<\\/html>";
		 
	    Pattern p = Pattern.compile(reg,Pattern.CASE_INSENSITIVE | Pattern.DOTALL | Pattern.MULTILINE );
	    Matcher m = p.matcher(campo);
	    
	    if(!m.find()){
	    	this.validator.add(new ValidationMessage("N&atilde;o foi poss&iacute;vel realizar a avalia&ccedil;&atilde;o! O c&oacute;digo fonte n&atilde;o &eacute; do tipo HTML ou XHTML.", "warning"));
	    	return false;
	    }	
	    
		if(campo.length() > 1048576){
			this.validator.add(new ValidationMessage("N&atilde;o foi poss&iacute;vel realizar a avalia&ccedil;&atilde;o! Tamanho m&aacute;ximo permitido para c&oacute;digo fonte &eacute; at&eacute; 1024KB.", "warning"));
			return false;
		}
		
		return true;
		
	} 
	
	public boolean uploadForm(UploadedFile file){
		
		if(file == null ){
			this.validator.add(new ValidationMessage("N&atilde;o foi poss&iacute;vel realizar a avalia&ccedil;&atilde;o! Favor realizar o upload do arquivo.", "warning"));
			return false;
		}
		
		String fileType = file.getContentType();
		if(!(fileType.equals("text/html") || fileType.equals("application/xhtml+xml") ||  fileType.equals("application/xhtml") ||  fileType.equals("application/xml"))){
			this.validator.add(new ValidationMessage("N&atilde;o foi poss&iacute;vel realizar a avalia&ccedil;&atilde;o! As extens&otilde;es permitidas para o arquivo s&atilde;o: .xht, .htm, .html ou .xhtml.", "warning"));
			return false;
		}
		
		if(file.getSize() > 1048576){
			this.validator.add(new ValidationMessage("N&atilde;o foi poss&eacute;vel realizar o upload do arquivo! Tamanho m&aacute;ximo permitido &eacute; de 1024KB.", "warning"));
			return false;
		}
		
		return true;
		
	}
	
	public boolean conteudoUploadForm(String html){
		
		String reg = "<html.*?>(.*)<\\/html>";
	     
	    Pattern p = Pattern.compile(reg,Pattern.CASE_INSENSITIVE | Pattern.DOTALL | Pattern.MULTILINE);
	    Matcher m = p.matcher(html);
	        
	     if(!m.find()){
	    	this.validator.add(new ValidationMessage("N&atilde;o foi poss&iacute;vel realizar a avalia&ccedil;&atilde;o! O conte&eacute;do do arquivo n&atilde;o &eacute; do tipo HTML ou XHTML.", "warning"));
	    	return false;
	     }	
		
	     return true;
	}
	
	public Validator getMessage(){
		return this.validator;
	}
	
}