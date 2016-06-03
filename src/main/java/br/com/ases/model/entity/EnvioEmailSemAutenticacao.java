package br.com.ases.model.entity;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage; 
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

import org.apache.regexp.REUtil;

public class EnvioEmailSemAutenticacao {
	private String mailSMTPServer;
	private String mailSMTPServerPort;
	
	/*
	 * caso queira mudar o servidor e a porta, so enviar para o contrutor
	 * os valor como string
	 */
	
	public EnvioEmailSemAutenticacao()
	{
		
	}
	public EnvioEmailSemAutenticacao(String mailSMTPServer, String mailSMTPServerPort) { //Para outro Servidor
		this.mailSMTPServer = mailSMTPServer;
		this.mailSMTPServerPort = mailSMTPServerPort;
	}
	public String sendMail(String from, String to, String subject, String message, String comAutenticacao, String authuser, String authpass) {
		Properties props = new Properties();
		String retorno = "";
             				
		props.put("mail.transport.protocol", "smtp"); //define protocolo de envio como SMTP
		props.put("mail.smtp.starttls.enable","true"); 
		props.put("mail.smtp.host", mailSMTPServer); //server SMTP do GMAIL
		props.put("mail.smtp.auth", comAutenticacao); //ativa autenticacao
		props.put("mail.smtp.user", from); //usuario ou seja, a conta que esta enviando o email (tem que ser do GMAIL)
		props.put("mail.debug", "false");
		props.put("mail.smtp.port", mailSMTPServerPort); //porta
	
		//Cria um autenticador que sera usado a seguir
		SimpleAuth auth = null;
		auth = new SimpleAuth (authuser,authpass);
		//Session - objeto que ira realizar a conexão com o servidor
		/*Como há necessidade de autenticação é criada uma autenticacao que
		 * é responsavel por solicitar e retornar o usuário e senha para 
		 * autenticação */
		Session session = Session.getDefaultInstance(props, auth);
		session.setDebug(true); //Habilita o LOG das ações executadas durante o envio do email
		//Objeto que contém a mensagem
		Message msg = new MimeMessage(session);
		try {
			//Setando o destinatário
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			//Setando a origem do email
			msg.setFrom(new InternetAddress(from));
			//Setando o assunto
			msg.setSubject(subject);
			//Setando o conteúdo/corpo do email
			msg.setContent(message,"text/html");			
			
			
		} catch (Exception e) {
			retorno = e.getMessage();
			System.out.println(">> Erro: Completar Mensagem");
			e.printStackTrace();
			return retorno;
		}
		//Objeto encarregado de enviar os dados para o email
		Transport tr;
		try {
			tr = session.getTransport("smtp"); //define smtp para transporte
			/*
			 *  1 - define o servidor smtp
			 *  2 - seu nome de usuario do gmail
			 *  3 - sua senha do gmail
			 */
			tr.connect(mailSMTPServer, authuser, authpass);			
			msg.saveChanges(); // don't forget this
			//envio da mensagem
			tr.sendMessage(msg, msg.getAllRecipients());
			
			tr.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(">> Erro: Envio Mensagem");
			retorno = e.getMessage();
		}
		return retorno;
	}
	
	
}
//clase que retorna uma autenticacao para ser enviada e verificada pelo servidor smtp
class SimpleAuth extends Authenticator {
	public String username = null;
	public String password = null;
	public SimpleAuth(String user, String pwd) {
		username = user;
		password = pwd;
	}
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication (username,password);
	}
}