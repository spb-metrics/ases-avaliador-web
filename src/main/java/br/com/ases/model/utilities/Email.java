package br.com.ases.model.utilities;

import java.io.IOException;
import java.net.MalformedURLException;  
import java.util.Date;
import java.util.Properties;

import lombok.AccessLevel;
import lombok.Getter;
import net.htmlparser.jericho.Source;

import org.apache.commons.mail.EmailAttachment;  
import org.apache.commons.mail.EmailException;  
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.MultiPartEmail;  
  

/**
 * @category utilities
 * @version 1.0*/
public class Email {  
	
	@Getter private String authUser;
	@Getter private String authPass;
	@Getter private String host;
	@Getter private String auth;
	@Getter private int port;
	@Getter private String to;

	private MultiPartEmail email;
	private  EmailAttachment anexo;
	
	
	private void initConf(String path){
		ManagerProperties managerProperties = new ManagerProperties();  
		try {
			Properties prop = managerProperties.getProp(path);
			
			this.host  = prop.getProperty("prop.email.host"); 
			this.port = Integer.parseInt(prop.getProperty("prop.email.port")); 
			this.authUser = prop.getProperty("prop.email.authuser");
			this.authPass = prop.getProperty("prop.email.authpass");
			this.auth = prop.getProperty("prop.email.auth");
			this.to = prop.getProperty("prop.email.to");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	/**
	 * @param String host, int port, String authUser, String authPass*/
	public Email(String host, int port, String authUser, String authPass, String auth, String to){
		this.host = host;
    	this.port = port;
    	this.authUser = authUser;
    	this.authPass = authPass;
    	this.auth = auth;
    	this.to = to;
    	this.email = new HtmlEmail();
    	
    }  
	    
	/**
	 * @param String path. Caminho do arquivo mail.properties*/
    public Email(String path) {
    	this.initConf(path);
    	this.email = new MultiPartEmail();
    }
    
    /** 
     * @param  String nomeDestinatario, String emailDestinatario, String nomeRemetente, String emailRemetente, String assunto, String mensagem
     * @throws EmailException  
     * @throws MalformedURLException
     * @return String*/  
	public String sendEmail( String nomeDestinatario, String emailDestinatario, String nomeRemetente, String emailRemetente, String assunto, String mensagem, boolean isHtml) throws EmailException {  
       
    	this.email.setHostName(this.host); // o servidor SMTP para envio do e-mail  
    	this.email.addTo(emailDestinatario, nomeDestinatario); //destinatï¿½rio  
    	this.email.setFrom(emailRemetente, emailRemetente+", "); // remetente
    	this.email.setSubject(assunto); // assunto do e-mail
    	
    	if(isHtml)
    		this.email.setContent("<p>Olá, <b>"+nomeRemetente+"</b> enviou a seguinte mensagem:</p> \n "+mensagem, "text/html");
    	else
    		this.email.setMsg("<p>Olá, <b>"+nomeRemetente+"</b> enviou a seguinte mensagem:</p> \n "+mensagem); //conteudo do e-mail  
    	
    	this.email.setSentDate(new Date());
    	
    	//this.email.setAuthentication(this.authUser, this.authPass);  
    	
    	
    	
    	this.email.setSmtpPort(this.port);  
    	this.email.setSSL(true);  
    	this.email.setTLS(true);  
    
    	try {
    		this.email.send();
    		return "";
		
    	} catch (Exception e) {
			return e.getMessage();
		}
    }  
 
    /**
     * @param String pathArquivo, String descricao, String nome
     * @return void
     * @exception EmailException*/
    public void addAnexo(String pathArquivo, String descricao, String nome) throws EmailException{
    	this.anexo = new EmailAttachment();  
    	this.anexo.setPath(pathArquivo); //caminho do arquivo (RAIZ_PROJETO/teste/teste.txt)  
    	this.anexo.setDisposition(EmailAttachment.ATTACHMENT);  
    	this.anexo.setDescription(descricao);  
    	this.anexo.setName(nome);          
        this.email.attach(anexo); 
    }
   
}  