package br.com.ases.controller;

import static br.com.checker.emag.core.Checker.behavior;
import static br.com.checker.emag.core.Checker.content;
import static br.com.checker.emag.core.Checker.form;
import static br.com.checker.emag.core.Checker.from;
import static br.com.checker.emag.core.Checker.marking;
import static br.com.checker.emag.core.Checker.multimedia;
import static br.com.checker.emag.core.Checker.presentation;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;

import org.hibernate.validator.constraints.impl.URLValidator;

import net.sf.jasperreports.engine.JRException;
import br.com.ases.business.AvaliacaoBusiness;
import br.com.ases.business.impl.AvaliacaoBusinessImpl;
import br.com.ases.controller.EseloController.Nota;
import br.com.ases.domain.DetalheAvaliacao;
import br.com.ases.domain.OccurrenceKey;
import br.com.ases.domain.ResumoAvaliacao;
import br.com.ases.infra.WebChecker;
import br.com.ases.model.utilities.DateUtil;
import br.com.ases.model.utilities.ManagerReport;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.interceptor.download.FileDownload;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.ioc.spring.VRaptorRequestHolder;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.com.checker.emag.OccurrenceClassification;
import br.com.checker.emag.SummarizedOccurrence;
import br.com.checker.emag.core.Checker;

@Resource
public class AvaliacaoController {
	
	private Result result;
	private final Validator validator;
	private AvaliacaoBusiness avaliacaoBusiness;
	private Map<OccurrenceClassification,List<SummarizedOccurrence>> ocorrencias = new HashMap<OccurrenceClassification, List<SummarizedOccurrence>>();
	private ServletContext application;
	private DetalheAvaliacao detalheAvaliacao;
	
	public AvaliacaoController (Result result, Validator validator,AvaliacaoBusiness avaliacaoBusiness,ServletContext application,DetalheAvaliacao detalheAvaliacao) {
		this.result = result;
		this.validator = validator;
		this.avaliacaoBusiness = avaliacaoBusiness;
		this.application = application;
		this.detalheAvaliacao = detalheAvaliacao;
		
	}
	
	@Path("/avaliar-arquivo")
	public void avaliarArquivo(UploadedFile file, boolean mark,
												  boolean content,
												  boolean presentation,
												  boolean multimedia, 
												  boolean form,
												  boolean behavior,
												  int tiprel) throws IOException {
		
		
		
		
		
	if(this.validadarUploadForm(file)){
		
		
		BufferedReader reader = new BufferedReader( new InputStreamReader( file.getFile() ) );
		String html = "";   
	    String linha = "";  
	    while( ( linha = reader.readLine() ) != null )  
	        html += "\n"+linha;
		
	    if(validarConteudoUploadForm(html)){
	    	
	    	 //if(tiprel != 5)
	    	 if(tiprel != 0)
					this.result.redirectTo(AvaliacaoController.class).relatorioAvaliacao(html, mark, content, presentation, multimedia, form, behavior, tiprel, false);
			    
				Checker checker = from(html);
				
				if(mark) checker.with(marking());
				if(content) checker.with(content());
				if(presentation) checker.with(presentation());
				if(multimedia) checker.with(multimedia());
				if(form) checker.with(form());
				if(behavior) checker.with(behavior());
				
				html = html.replaceAll("<", "&lt;");
				html = html.replaceAll(">", "&gt;");
				html = html.replaceAll(" ", "&nbsp");
				
				result.include("html", html);
				result.include("nota",avaliacaoBusiness.obterNota(checker.checkSumarized(),file.getFileName()));
				this.sumarizarResultasNoResponse(checker.checkSumarized(), result);
				this.detalheAvaliacao.inicializar(avaliacaoBusiness.retornarCriterios(checker.check()));
				VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("resultadoAvaliacao", checker.checkSumarized());
				result.of(this).avaliar(null, mark,content,presentation, multimedia, form, behavior, tiprel);
	    	
	    }else{
			 this.validator.onErrorUsePageOf(IndexController.class).index();
		}	
	    
	    
		   
			
		}else{
			 this.validator.onErrorUsePageOf(IndexController.class).index();
		}	
    }
	
	
	@Post("/avaliar")
	public void avaliar(String url, boolean mark, 
									boolean content,
									boolean presentation,
									boolean multimedia, 
									boolean form, 
									boolean behavior,
									int tiporel) {
		
		if(this.validadarCampoForm(url)){
			
			//if(tiporel != 5)
			if(tiporel != 0)
				this.result.redirectTo(AvaliacaoController.class).relatorioAvaliacao(url, mark, content, presentation, multimedia, form, behavior, tiporel, true);
			
			if(url.startsWith("www")) url="http://"+url;
			
			WebChecker pagina = WebChecker.from(url).withGetRequest().execute();
			
			
			Checker checker = from(pagina.getContent());
			
			if(mark) checker.with(marking());
			if(content) checker.with(content());
			if(presentation) checker.with(presentation());
			if(multimedia) checker.with(multimedia());
			if(form) checker.with(form());
			if(behavior) checker.with(behavior());
			
			Pattern pp = Pattern.compile("(http://www.)?([a-z]*)(.)?");  
		    Matcher mm = pp.matcher(url.toLowerCase());  
		    
		    if (mm.find())
		      	result.include("titulosite", mm.group(2));
		   
			result.include("url", url);
			result.include("html", pagina.getParsedContent());
			result.include("nota",avaliacaoBusiness.obterNota(checker.checkSumarized(),url));
			this.sumarizarResultasNoResponse(checker.checkSumarized(), result);
			
			this.detalheAvaliacao.inicializar(avaliacaoBusiness.retornarCriterios(checker.check()));
			VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("resultadoAvaliacao", checker.checkSumarized()); 
			
		}else{
			 this.validator.onErrorUsePageOf(IndexController.class).index();
		}
	}
	
	@Get("/relatorioavaliacao")
	@Post("/relatorioavaliacao")
	public FileDownload relatorioAvaliacao(String url, boolean mark, 
									boolean content,
									boolean presentation,
									boolean multimedia, 
									boolean form, 
									boolean behavior,
									int tiporel, boolean isUrl) {
		
		Checker checker = null;
		WebChecker pagina = null;
		
		if(isUrl){
			if(url.startsWith("www")) url="http://"+url;
			
			pagina = WebChecker.from(url).withGetRequest().execute();
			checker = from(pagina.getContent());
		}else{
			checker = from(url);
		}
		
		if(mark) checker.with(marking());
		if(content) checker.with(content());
		if(presentation) checker.with(presentation());
		if(multimedia) checker.with(multimedia());
		if(form) checker.with(form());
		if(behavior) checker.with(behavior());
		this.sumarizarResultasNoResponse(checker.checkSumarized(), result);
		
	//================================= GERAR RELATÓRIO =============================================//
		
				/*Cria um Map de parâmetros*/
				HashMap<String, Object> map = new HashMap<String, Object>();
				
				/*Obtem a nota*/
				AvaliacaoBusinessImpl avaliacaoBusiness = new AvaliacaoBusinessImpl();
				Nota nota = avaliacaoBusiness.obterNota(checker.checkSumarized(), isUrl ? url: "C�digo Fonte ou Arquivo");
				Pattern pp = Pattern.compile("(http://www.)?([a-z]*)(.)?");  
			    Matcher mm = pp.matcher(url.toLowerCase());
				
				map.put("pPercentualAses", nota.getValor());
				map.put("pPagina", isUrl ? url: "C�digo Fonte ou Arquivo");
				map.put("pTitulo", mm.find() ? mm.group(2): "governoeletronico");
				map.put("pTamanho", "29.8 KB (30475 bytes)");
				map.put("pDataHoraAvaliacao",  nota.getData());
				
				//Obtem Resumo da Avaliação
				List<ResumoAvaliacao> resumoErrosAvisos  = obterResumoAvaliacao();
				
				int totalErros = 0;
				int totalAvisos = 0;
				
				for(ResumoAvaliacao resumo :resumoErrosAvisos ){
					map.put(resumo.getTipo()+"_A",resumo.getQuantidadeAvisos());
					map.put(resumo.getTipo()+"_E",resumo.getQuantidadeErros());
				
					totalErros+=resumo.getQuantidadeErros();
					totalAvisos+=resumo.getQuantidadeAvisos();
				}
				
				map.put("TOTAL_E",totalErros);
				map.put("TOTAL_A",totalAvisos);
				
				ManagerReport managerReport = new ManagerReport(this.application.getRealPath("")+"/WEB-INF/templates-relatorios/relatorio-avaliacao.jrxml");
				String path =null;
				String contentType = null;
	   			String filename = null;
	
	   			try {
		   			switch (tiporel) {
			   			case 1://Export RTF
							path =  managerReport.gerarRelatorio(checker.checkSumarized(), map, 1);
							contentType = "application/rtf";
							filename = "RelatorioAvaliacao.rtf";
						break;
						case 2://Export XLS
							path =  managerReport.gerarRelatorio(checker.checkSumarized(), map, 2);
							contentType = "application/xls";
							filename = "RelatorioAvaliacao.xls";
						break;
						case 3://Export ODT
							path =  managerReport.gerarRelatorio(checker.checkSumarized(), map, 3);
							contentType = "application/odt";
							filename = "RelatorioAvaliacao.odt";
						break;
						default:
							path =  managerReport.gerarRelatorio(checker.checkSumarized(), map, 4);
							contentType = "application/pdf";
							filename = "RelatorioAvaliacao.pdf";
						break;
		   			}
	   			} catch (JRException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	   			File file = new File(path);
	   	
	   	return new FileDownload(file, contentType, filename);
	
	   	//================================= FIM GERAR RELATÓRIO =============================================//
		
	}
	
	@Post("/avaliar-codigo")
	public void avaliarPlainText(String html, boolean mark,
											  boolean content,
											  boolean presentation, 
											  boolean multimedia, 
											  boolean form, 
											  boolean behavior,
											  int tiporel) {
		
		if(this.validadarCondigoFonteAvaliar(html)){
		
			//if(tiporel != 5)
			if(tiporel != 0)
				this.result.redirectTo(AvaliacaoController.class).relatorioAvaliacao(html, mark, content, presentation, multimedia, form, behavior, tiporel, false);
			
			Checker checker = from(html);
			
			if(mark) checker.with(marking());
			if(content) checker.with(content());
			if(presentation) checker.with(presentation());
			if(multimedia) checker.with(multimedia());
			if(form) checker.with(form());
			if(behavior) checker.with(behavior());
			
			html = html.replaceAll("<", "&lt;");
			html = html.replaceAll(">", "&gt;");
			html = html.replaceAll(" ", "&nbsp");
			
			result.include("html", html);
			result.include("nota",avaliacaoBusiness.obterNota(checker.checkSumarized(),"C�digo Fonte ou Arquivo"));
			this.sumarizarResultasNoResponse(checker.checkSumarized(), result);
			result.of(this).avaliar(null, mark,content,presentation, multimedia, form, behavior, tiporel);
			
		}else{
			 this.validator.onErrorUsePageOf(IndexController.class).index();
		}
	}
	
	
	private void sumarizarResultasNoResponse(List<SummarizedOccurrence> resultadoAvaliacao, Result result){
		
		for(SummarizedOccurrence occurrence : resultadoAvaliacao){
			if(ocorrencias.get(occurrence.getType()) == null)
				ocorrencias.put(occurrence.getType(), new ArrayList<SummarizedOccurrence>());
			
			ocorrencias.get(occurrence.getType()).add(occurrence);
		}
		
		for(Entry<OccurrenceClassification, List<SummarizedOccurrence>> entry : ocorrencias.entrySet()) {
			List<SummarizedOccurrence> ocorrenciasComputadas = entry.getValue();
			Collections.sort(ocorrenciasComputadas);
			
			result.include("LISTA_"+entry.getKey().toString(),ocorrenciasComputadas);
		}
		
		List<ResumoAvaliacao> resumoErrosAvisos  = obterResumoAvaliacao();
		int totalErros = 0;
		int totalAvisos = 0;
		
		for(ResumoAvaliacao resumo :resumoErrosAvisos ){
			totalErros+=resumo.getQuantidadeErros();
			totalAvisos+=resumo.getQuantidadeAvisos();
		}
		
		result.include("totalErros",totalErros);
		result.include("totalAvisos",totalAvisos);
		result.include("listaResumo",resumoErrosAvisos);
		result.include("data", DateUtil.dataHoraAtual());
		
	}
	
	private List<ResumoAvaliacao> obterResumoAvaliacao() {
		List<ResumoAvaliacao>  resultado = new ArrayList<ResumoAvaliacao>();
		
		for(OccurrenceClassification classificacao : OccurrenceClassification.values()) {
		
			
			int erros = 0;
			int avisos = 0;
			
			List<SummarizedOccurrence> listaOcorrencias = ocorrencias.get(classificacao);
			
			if(listaOcorrencias!=null){
				for(SummarizedOccurrence ocorrencia : ocorrencias.get(classificacao) ){
					if(ocorrencia.isError())
						erros++ ;
					else
						avisos++;
				}
			}
			
			resultado.add(new ResumoAvaliacao(classificacao, erros, avisos));
		}
		
		return resultado;
	}
	
	
	@Path("/detalhes-avaliacao/{rn}")
	public void detalhesAvaliacao(OccurrenceKey rn){
		result.include("detalhe",this.detalheAvaliacao.get(rn));
		
		List<SummarizedOccurrence> ob = (List<SummarizedOccurrence>) VRaptorRequestHolder.currentRequest().getServletContext().getAttribute("resultadoAvaliacao");
		String recomendacao = "";
		
		for(SummarizedOccurrence occurrence : ob){
			recomendacao = occurrence.getMapDescription().get(rn.getCode());
			break;
		}
		
		result.include("recomendacao",recomendacao);
		result.include("rn",rn.getCode());
	}
	
	@Post("/exportar-detalhes-avaliacao")
	public FileDownload exportarDetalhesAvaliacao(OccurrenceKey rn, int tiporel){
		
		/*Cria um Map de par�metroe*/
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		List list = this.detalheAvaliacao.get(rn).getCriterios();
		
		List<SummarizedOccurrence> ob = (List<SummarizedOccurrence>) VRaptorRequestHolder.currentRequest().getServletContext().getAttribute("resultadoAvaliacao");
		String recomendacao = "";
		
		for(SummarizedOccurrence occurrence : ob){
			recomendacao = occurrence.getMapDescription().get(rn.getCode());
			break;
		}
		
		map.put("rnAvaliada",  recomendacao);
		
		ManagerReport managerReport = new ManagerReport(this.application.getRealPath("")+"/WEB-INF/templates-relatorios/relatorio-detalhes-avaliacao.jrxml");
		
		String path = null;
		String contentType = null;
		String filename = null;
		
		
		try{
   			switch (tiporel) {
	   			case 1://Export RTF
					path =  managerReport.gerarRelatorioDetalhesAvaliacao(list,map, tiporel);
					contentType = "application/rtf";
					filename = "DetalhesRelatorioAvaliacao.rtf";
				break;
				case 2://Export XLS
					path =  managerReport.gerarRelatorioDetalhesAvaliacao(list,map, tiporel);
					contentType = "application/xls";
					filename = "DetalhesRelatorioAvaliacao.xls";
				break;
				case 3://Export ODT
					path =  managerReport.gerarRelatorioDetalhesAvaliacao(list,map, tiporel);
					contentType = "application/odt";
					filename = "DetalhesRelatorioAvaliacao.odt";
				break;
				default:
					path =  managerReport.gerarRelatorioDetalhesAvaliacao(list,map, tiporel);
					contentType = "application/pdf";
					filename = "DetalhesRelatorioAvaliacao.pdf";
				break;
   			}
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	    }
	   			
	   	File file = new File(path);
	   	
	   	return new FileDownload(file, contentType, filename);
	}
	
	private boolean validadarCampoForm(String campo){
		boolean isValido = true;
		if(campo == null || campo.length() <= 10 ){
			this.validator.add(new ValidationMessage("N�o foi poss�vel realizar a avalia��o! Favor preencher o campo URL.", "warning"));
			isValido = false;
		}else{
		
		
		try {
		    URL url = new URL(campo);
		    URLConnection conn = url.openConnection();
		    conn.connect();
		} catch (MalformedURLException e) {
			this.validator.add(new ValidationMessage("N�o foi poss�vel realizar a avalia��o! URL "+campo+" considerada inv�lida.", "warning"));
			isValido = false;
		} catch (IOException e) {
			this.validator.add(new ValidationMessage("N�o foi poss�vel realizar a avalia��o! URL "+campo+" considerada inv�lida.", "warning"));
			isValido = false;
		}
		}
		
		return isValido;
		
	} 
	
	
	private boolean validadarCondigoFonteAvaliar(String campo){
		
		if(campo == null || campo.length() <= 10 ){
			this.validator.add(new ValidationMessage("N�o foi poss�vel realizar a avalia��o! Favor preencher o campo C�digo a Analizar.", "warning"));
			return false;
		}
		
		String reg = "<html.*?>(.*)<\\/html>";
		 
	    Pattern p = Pattern.compile(reg,Pattern.CASE_INSENSITIVE | Pattern.DOTALL | Pattern.MULTILINE );
	    Matcher m = p.matcher(campo);
	    
	    if(!m.find()){
	    	this.validator.add(new ValidationMessage("N�o foi poss�vel realizar a avalia��o! O conte�do do arquivo n�o � do tipo HTML ou XHTML.", "warning"));
	    	return false;
	    }	
	    
		if(campo.length() > 1048576){
			this.validator.add(new ValidationMessage("N�o foi poss�vel realizar o upload do arquivo! Tamanho m�ximo permitido � de 1024KB.", "warning"));
			return false;
		}
		
		return true;
		
	} 


	private boolean validadarUploadForm(UploadedFile file){
		
		if(file == null ){
			this.validator.add(new ValidationMessage("N�o foi poss�vel realizar a avalia��o! Favor realizar o upload do arquivo.", "warning"));
			return false;
		}
		
		String fileType = file.getContentType();
		if(!(fileType.equals("text/html") || fileType.equals("application/xhtml+xml") ||  fileType.equals("application/xhtml") ||  fileType.equals("application/xml"))){
			this.validator.add(new ValidationMessage("N�o foi poss�vel realizar a avalia��o. As extens�es permitidas para o arquivo s�o: .xht, .htm, .html ou .xhtml!", "warning"));
			return false;
		}
		
		if(file.getSize() > 1048576){
			this.validator.add(new ValidationMessage("N�o foi poss�vel realizar o upload do arquivo! Tamanho m�ximo permitido � de 1024KB.", "warning"));
			return false;
		}
		
		return true;
		
	}
	
	
	private boolean validarConteudoUploadForm(String html){
		
		String reg = "<html.*?>(.*)<\\/html>";
	     
	    Pattern p = Pattern.compile(reg,Pattern.CASE_INSENSITIVE | Pattern.DOTALL | Pattern.MULTILINE);
	    Matcher m = p.matcher(html);
	        
	     if(!m.find()){
	    	this.validator.add(new ValidationMessage("N�o foi poss�vel realizar a avalia��o! O conte�do do arquivo n�o � do tipo HTML ou XHTML.", "warning"));
	    	return false;
	     }	
		
	     return true;
	}
	
}