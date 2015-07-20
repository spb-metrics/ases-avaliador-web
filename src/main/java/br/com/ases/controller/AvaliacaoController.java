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
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;

import org.eclipse.jdt.internal.compiler.ast.ForeachStatement;

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
import br.com.ases.model.utilities.Validate;
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
import br.com.checker.emag.Occurrence;
import br.com.checker.emag.OccurrenceClassification;
import br.com.checker.emag.SummarizedOccurrence;
import br.com.checker.emag.core.Checker;

@Resource
public class AvaliacaoController {
	
	private Result result;
	private Validator validator;
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
	Validate validate = new Validate(this.validator);	
		
	if(validate.uploadForm(file)){
		
		
		BufferedReader reader = new BufferedReader( new InputStreamReader( file.getFile() ) );
		String html = "";   
	    String linha = "";  
	    while( ( linha = reader.readLine() ) != null )  
	        //html += "\n"+linha;
	    	html += linha+"\n";
		
		    if(validate.conteudoUploadForm(html)){
		    	
		    	 /*if(tiprel != 5)
		    	 		this.result.redirectTo(AvaliacaoController.class).relatorioAvaliacao(html, mark, content, presentation, multimedia, form, behavior, tiprel, false);*/
				    
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
					
					result.include("contentLenght", String.valueOf(html.getBytes("UTF-8").length));
					result.include("html", html);
					result.include("titulosite", "C&oacute;digo Fonte ou Arquivo");
					result.include("nota",avaliacaoBusiness.obterNota(checker.checkSumarized(),file.getFileName()));
					this.sumarizarResultasNoResponse(checker.checkSumarized(), result);
					this.detalheAvaliacao.inicializar(avaliacaoBusiness.retornarCriterios(checker.check()));
					
					VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("resultadoAvaliacao", checker.checkSumarized());
					VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("urlAvaliada", "");
					VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("contentLenght", String.valueOf(html.getBytes("UTF-8").length));
					
					result.of(this).avaliar(null, mark,content,presentation, multimedia, form, behavior, tiprel);
		    	
		    }else{
		    	this.validator = validate.getMessage();
				this.validator.onErrorUsePageOf(IndexController.class).index();
			}
			
		}else{
			 this.validator = validate.getMessage();
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
		
		Validate validate = new Validate(this.validator);
		
		if(validate.url(url)){
			
			
			/*if(tiporel != 5)
				this.result.redirectTo(AvaliacaoController.class).relatorioAvaliacao(url, mark, content, presentation, multimedia, form, behavior, tiporel, true);*/
			
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
		   
		    result.include("contentLenght", pagina.getContentLength());
			result.include("url", url);
			result.include("html", pagina.getParsedContent());
			result.include("nota",avaliacaoBusiness.obterNota(checker.checkSumarized(),url));
			this.sumarizarResultasNoResponse(checker.checkSumarized(), result);
			
			this.detalheAvaliacao.inicializar(avaliacaoBusiness.retornarCriterios(checker.check()));
			VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("resultadoAvaliacao", checker.checkSumarized());
			VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("urlAvaliada", url);
			VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("contentLenght", pagina.getContentLength());
			
		}else{
			 this.validator = validate.getMessage();
			 this.validator.onErrorUsePageOf(IndexController.class).index();
		}
	}
	
	@Get("/relatorioavaliacao")
	@Post("/relatorioavaliacao")
	public FileDownload relatorioAvaliacao( int tiporel) {
		
		List<SummarizedOccurrence> checkerList = (List<SummarizedOccurrence>) VRaptorRequestHolder.currentRequest().getServletContext().getAttribute("resultadoAvaliacao");
		String urlAvaliada = (String) VRaptorRequestHolder.currentRequest().getServletContext().getAttribute("urlAvaliada");
		String contentLenght = (String) VRaptorRequestHolder.currentRequest().getServletContext().getAttribute("contentLenght");
		this.sumarizarResultasNoResponse(checkerList, result);
		
		//================================================ GERAR RELATÓRIO =============================================//
		
				/*Cria um Map de parâmetros*/
				HashMap<String, Object> map = new HashMap<String, Object>();
				
				/*Obtem a nota*/
				AvaliacaoBusinessImpl avaliacaoBusiness = new AvaliacaoBusinessImpl();
				Nota nota = avaliacaoBusiness.obterNota(checkerList, urlAvaliada != "" ? urlAvaliada: "Código Fonte ou Arquivo");
				
				map.put("pPercentualAses", nota.getValor());
				map.put("pPagina", urlAvaliada != "" ? urlAvaliada : "Código Fonte ou Arquivo");
				
				if(urlAvaliada != ""){
					Pattern pp = Pattern.compile("(http://www.)?([a-z]*)(.)?");  
				    Matcher mm = pp.matcher(urlAvaliada.toLowerCase());  
			
				    if (mm.find())
				        map.put("pTitulo",  mm.group(2));
				
				}else
					 map.put("pTitulo", "governoeletronico");
				
				map.put("pTamanho", contentLenght+" Bytes");
				map.put("pDataHoraAvaliacao",   DateUtil.dataHoraAtual());
				
				//Obtem Resumo da AvaliaÃ§Ã£o
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
			
	   			try {
	   				path =  managerReport.gerarRelatorio(checkerList, map, tiporel, "RelatorioAvaliacao");
				} catch (JRException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
	   			File file = new File(path);
	   	
	   	return new FileDownload(file, managerReport.getContentType(), managerReport.getFileName());
	
	   //=========================================== FIM GERAR RELATÓRIO =============================================//
		
	}
	
	@Post("/avaliar-codigo")
	public void avaliarPlainText(String html, boolean mark,
											  boolean content,
											  boolean presentation, 
											  boolean multimedia, 
											  boolean form, 
											  boolean behavior,
											  int tiporel) throws IOException{
		
		Validate validate = new Validate(this.validator);
		
		if(validate.condigoFonte(html)){
		
			/*if(tiporel != 5)
				this.result.redirectTo(AvaliacaoController.class).relatorioAvaliacao(html, mark, content, presentation, multimedia, form, behavior, tiporel, false);*/
			
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
			
			
			result.include("contentLenght", String.valueOf(html.getBytes("UTF-8").length));
			result.include("html", html);
			result.include("titulosite", "C&oacute;digo Fonte ou Arquivo");
			result.include("nota",avaliacaoBusiness.obterNota(checker.checkSumarized(),"C&oacute;digo Fonte ou Arquivo"));
			this.sumarizarResultasNoResponse(checker.checkSumarized(), result);
			this.detalheAvaliacao.inicializar(avaliacaoBusiness.retornarCriterios(checker.check()));
			
			VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("resultadoAvaliacao", checker.checkSumarized());
			VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("urlAvaliada", "");
			VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("contentLenght", String.valueOf(html.getBytes("UTF-8").length));
			
			result.of(this).avaliar(null, mark,content,presentation, multimedia, form, behavior, tiporel);
			
		}else{
			this.validator = validate.getMessage();
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
		List<Occurrence> listOcorrencias = this.detalheAvaliacao.get(rn).getOcorrencias();
		
		//Sorting
		Collections.sort(listOcorrencias, new Comparator<Occurrence>() {
		    public int compare(Occurrence  occurrence1, Occurrence  occurrence2){
	            return  occurrence1.getCriterio().compareTo(occurrence2.getCriterio());
	        }
	    });
		
		result.include("detalhe",this.detalheAvaliacao.get(rn));
		result.include("listOcorrencia",listOcorrencias);
		
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
		
		/*Cria um Map de parâmetros*/
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		List list = this.detalheAvaliacao.get(rn).getCriterios();
		List<String> codigoFonte = new ArrayList();
		for(Occurrence occurrence : this.detalheAvaliacao.get(rn).getOcorrencias()){
			codigoFonte.add(occurrence.getLine() +": "+ occurrence.getTag().replaceAll("&lt;","<").replaceAll("&gt;",">").replaceAll("&nbsp"," ")+"\n\n");
		}
		map.put("codigoFonte",  codigoFonte);
		
				
		List<SummarizedOccurrence> ob = (List<SummarizedOccurrence>) VRaptorRequestHolder.currentRequest().getServletContext().getAttribute("resultadoAvaliacao");
		String recomendacao = "";
		
		for(SummarizedOccurrence occurrence : ob){
			recomendacao = occurrence.getMapDescription().get(rn.getCode());
			break;
		}
		
		map.put("rnAvaliada",  recomendacao);
		map.put("SUBREPORT_DIR",  this.application.getRealPath("")+"/WEB-INF/templates-relatorios/");
			
		
		ManagerReport managerReport = new ManagerReport(this.application.getRealPath("")+"/WEB-INF/templates-relatorios/relatorio-detalhes-avaliacao.jrxml");
		
		String path = null;
		
		try{
			path =  managerReport.gerarRelatorioDetalhesAvaliacao(list,map, tiporel, "DetalhesRelatorioAvaliacao");
		} catch (JRException e) {
			e.printStackTrace();
	    } catch (IOException e) {
			e.printStackTrace();
		}
	   			
	   	File file = new File(path);
	   	
	   	return new FileDownload(file, managerReport.getContentType(), managerReport.getFileName());
	}
	
	/*private boolean validadarCampoForm(String campo){
		boolean isValido = true;
		if(campo == null || campo.length() <= 10 ){
			this.validator.add(new ValidationMessage("Não foi possível realizar a avaliação! Favor preencher o campo URL.", "warning"));
			isValido = false;
		}else{
			try {
			    URL url = new URL(campo);
			    URLConnection conn = url.openConnection();
			    conn.connect();
			} catch (MalformedURLException e) {
				this.validator.add(new ValidationMessage("Não foi possível realizar a avaliação! URL "+campo+" considerada inválida.", "warning"));
				isValido = false;
			} catch (IOException e) {
				this.validator.add(new ValidationMessage("Não foi possível realizar a avaliação! URL "+campo+" considerada inválida.", "warning"));
				isValido = false;
			}
		}
		
		return isValido;
		
	} */
	
	/*private boolean validadarCondigoFonteAvaliar(String campo){
		
		if(campo == null || campo.length() <= 10 ){
			this.validator.add(new ValidationMessage("Não foi possível realizar a avaliação! Favor preencher o campo C&oacute;digo a analisar.", "warning"));
			return false;
		}
		
		String reg = "<html.*?>(.*)<\\/html>";
		 
	    Pattern p = Pattern.compile(reg,Pattern.CASE_INSENSITIVE | Pattern.DOTALL | Pattern.MULTILINE );
	    Matcher m = p.matcher(campo);
	    
	    if(!m.find()){
	    	this.validator.add(new ValidationMessage("Não foi possível realizar a avaliação! O código fonte não é do tipo HTML ou XHTML.", "warning"));
	    	return false;
	    }	
	    
		if(campo.length() > 1048576){
			this.validator.add(new ValidationMessage("Não foi possível realizar a avaliação! Tamanho máximo permitido para código fonte é até 1024KB.", "warning"));
			return false;
		}
		
		return true;
		
	} */


	/*private boolean validadarUploadForm(UploadedFile file){
		
		if(file == null ){
			this.validator.add(new ValidationMessage("Não foi possível realizar a avaliação! Favor realizar o upload do arquivo.", "warning"));
			return false;
		}
		
		String fileType = file.getContentType();
		if(!(fileType.equals("text/html") || fileType.equals("application/xhtml+xml") ||  fileType.equals("application/xhtml") ||  fileType.equals("application/xml"))){
			this.validator.add(new ValidationMessage("Não foi possível realizar a avaliação! As extensões permitidas para o arquivo são: .xht, .htm, .html ou .xhtml.", "warning"));
			return false;
		}
		
		if(file.getSize() > 1048576){
			this.validator.add(new ValidationMessage("Não foi possível realizar o upload do arquivo! Tamanho máximo permitido é de 1024KB.", "warning"));
			return false;
		}
		
		return true;
		
	}*/
	
	/*private boolean validarConteudoUploadForm(String html){
		
		String reg = "<html.*?>(.*)<\\/html>";
	     
	    Pattern p = Pattern.compile(reg,Pattern.CASE_INSENSITIVE | Pattern.DOTALL | Pattern.MULTILINE);
	    Matcher m = p.matcher(html);
	        
	     if(!m.find()){
	    	this.validator.add(new ValidationMessage("Não foi possível realizar a avaliação! O conteúdo do arquivo não é do tipo HTML ou XHTML.", "warning"));
	    	return false;
	     }	
		
	     return true;
	}*/
	
}