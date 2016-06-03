package br.com.ases.controller;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;

import javax.servlet.ServletContext;

import org.apache.commons.mail.EmailException;

import br.com.ases.model.entity.Contato;
import br.com.ases.model.entity.EnvioEmailSemAutenticacao;
import br.com.ases.model.utilities.Email;
import br.com.ases.model.utilities.StringHelper;
import br.com.ases.model.utilities.Validate;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.ioc.spring.VRaptorRequestHolder;

@Resource
@Path("/contato")
public class ContatoController {

	private String tituloPagina = "Contato - ASES";
	private Result result;
	private Validator validator;
	private ServletContext application;

	public ContatoController(Result result, Validator validator,
			ServletContext application) {

		this.result = result;
		this.validator = validator;
		this.application = application;

		// Seta o título da página
		VRaptorRequestHolder.currentRequest().getServletContext()
				.setAttribute("tituloPagina", tituloPagina);
	}

	@Path("")
	public void index() {

	}

	@Post("/confirmacao")
	public void confirmation(Contato contato) throws EmailException,
			MalformedURLException, UnsupportedEncodingException {

		Validate validate = new Validate(this.validator);

		if (validate.contato(contato)) {
			String respSendEmail;
			
			Email email = new Email(this.application.getRealPath("") + "/WEB-INF/mail.properties");
			
			EnvioEmailSemAutenticacao envioEmailSemAutenticacao = new EnvioEmailSemAutenticacao(email.getHost(), Integer.toString(email.getPort()));
			
			respSendEmail = envioEmailSemAutenticacao.sendMail(contato.getEmail(),email.getTo(), StringHelper.convertFromUTF8(contato.getAssunto()), StringHelper.convertFromUTF8(contato.getMensagem()),email.getAuth(), email.getAuthUser(), email.getAuthPass());


			/*String respSendEmail = email.sendEmail("Contato","govbr@planejamento.gov.br", contato.getNome(),contato.getEmail(),StringHelper.convertFromUTF8(contato.getAssunto()),
					StringHelper.convertFromUTF8(contato.getMensagem()), true);*/

			if (respSendEmail.equals("")) {
				result.include("mensagem", "Mensagem enviada com Sucesso");
				result.include("status", "success");

			} else {
				result.include("mensagem",
						"Não foi possível enviar a mensagem! Ocorreu o problema: " + respSendEmail);
				result.include("status", "error");
			}

			this.result.redirectTo(ContatoController.class).index();

		} else {
			this.validator = validate.getMessage();
			this.validator.onErrorUsePageOf(ContatoController.class).index();

		}
	}

}