package br.com.ases.model.utilities;

import java.net.MalformedURLException;  

import org.apache.commons.mail.EmailAttachment;  
import org.apache.commons.mail.EmailException;  
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.MultiPartEmail;  
  

/**
 * @category utilities
 * @version 1.0*/
public class Email {  
	
	private String authUser;
	private String authPass;
	private String host;
	private int port;
	private MultiPartEmail email;
	private  EmailAttachment anexo;
	
	private final String HOST = "smtp.gmail.com";
	private final int PORT = 465;
	private final String AUTHUSER = "contato.asesweb";
	private final String AUTHPASS = "@s3sc@nt@t@#";
    
	/**
	 * @param String host, int port, String authUser, String authPass*/
	public Email(String host, int port, String authUser, String authPass){
    	this.host = host;
    	this.port = port;
    	this.authUser = authUser;
    	this.authPass = authPass;
    	this.email = new HtmlEmail();  
    }  
    
    public Email() {
    	this.host = HOST;
    	this.port = PORT;
    	this.authUser = AUTHUSER;
    	this.authPass = AUTHPASS;
    	this.email = new MultiPartEmail();
    }
    
    /** 
     * @param  String nomeDestinatario, String emailDestinatario, String nomeRemetente, String emailRemetente, String assunto, String mensagem
     * @throws EmailException  
     * @throws MalformedURLException
     * @return String*/  
	public String sendEmail( String nomeDestinatario, String emailDestinatario, String nomeRemetente, String emailRemetente, String assunto, String mensagem) throws EmailException {  
       
    	this.email.setHostName(this.host); // o servidor SMTP para envio do e-mail  
    	this.email.addTo(emailDestinatario, nomeDestinatario); //destinat�rio  
    	this.email.setFrom(emailRemetente, nomeRemetente); // remetente  
    	this.email.setSubject(assunto); // assunto do e-mail  
    	this.email.setMsg(mensagem); //conteudo do e-mail  
    	this.email.setAuthentication(this.authUser, this.authPass);  
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