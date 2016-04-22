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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;

import net.sf.jasperreports.engine.JRException;
import br.com.ases.business.AvaliacaoBusiness;
import br.com.ases.controller.EseloController.Nota;
import br.com.ases.domain.DetalheAvaliacao;
import br.com.ases.domain.DetalheAvaliacao.Criterio;
import br.com.ases.domain.OccurrenceKey;
import br.com.ases.domain.ResumoAvaliacao;
import br.com.ases.infra.UtilitiesProperties;
import br.com.ases.infra.EseloProperties;
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
import br.com.checker.emag.Occurrence;
import br.com.checker.emag.OccurrenceClassification;
import br.com.checker.emag.SummarizedOccurrence;
import br.com.checker.emag.core.Checker;
import br.com.checker.emag.core.ContentEvaluation;


@Resource
public class AvaliacaoController {
	EseloProperties eseloProperties = null;
	
	private String tituloPagina;
	//Altera a mensagem caso não esteja usando o ESELO (Nota e Resumo da Avaliação de Acessibilidade)
	private String mensagem_avaliacao = null;
	
	//Esconde a nota caso não esteja usando o ESELO		
	private String sem_nota = null;
	private String tituloSite;
	private String dataHoraAvaliacao;
	private String webaxscore;
	private Result result;
	private Validator validator;
	private AvaliacaoBusiness avaliacaoBusiness;
	private Map<OccurrenceClassification,List<SummarizedOccurrence>> ocorrencias = new HashMap<OccurrenceClassification, List<SummarizedOccurrence>>();
	private ServletContext application;
	private DetalheAvaliacao detalheAvaliacao;
	private UtilitiesProperties utilitiesProperties;
	
	
	public AvaliacaoController (Result result, Validator validator,AvaliacaoBusiness avaliacaoBusiness,ServletContext application,DetalheAvaliacao detalheAvaliacao) {
		this.result = result;
		this.validator = validator;
		this.avaliacaoBusiness = avaliacaoBusiness;
		this.application = application;
		this.detalheAvaliacao = detalheAvaliacao;		
		this.avaliacaoBusiness.initEseloProperties(application);
		this.initEseloProperties(application);
		this.utilitiesProperties = new UtilitiesProperties(application);
				
	}
	
	private void DefinirCorWebaxscore(String valorNota) {
		
		//Define a cor do webaxscore na página "Avaliar" de acordo a pontuação
		
		Double notaAvaliacao = Double.parseDouble(valorNota.replaceFirst(",", ".")) ;
				
		if(notaAvaliacao >= 70)
		{
			webaxscore = "verde";
		}
		else if(notaAvaliacao >= 50 & notaAvaliacao < 70)
		{
			webaxscore = "amarela";
		}
		else
		{
			webaxscore = "vermelha";
		}					
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
					
					
					this.tituloSite = "";
					
					ContentEvaluation conteudo = new ContentEvaluation(checker.getDocument());
									
					this.tituloSite =	conteudo.retornarTituloSiteAvaliado();
					
					result.include("titulosite", tituloSite);
									
					Nota nota = avaliacaoBusiness.obterNota(checker.checkSumarized(),file.getFileName());
					
					result.include("nota",nota);
					this.sumarizarResultasNoResponse(checker.checkSumarized(), result);
					this.detalheAvaliacao.inicializar(avaliacaoBusiness.retornarCriterios(checker.check()));
					 		
					
					
					VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("resultadoAvaliacao", checker.checkSumarized());
					VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("urlAvaliada", "");
					VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("contentLenght", String.valueOf(html.getBytes("UTF-8").length));
					VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("notaAvaliacao", nota);
					
										
					//Altera a cor de webaxscore de acordo a pontuacao
										
					DefinirCorWebaxscore(nota.getValor());	
					
					VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("webaxscore", webaxscore);
					//Seta o valor do título no template
					tituloPagina = "Resumo de avaliação por upload de arquivo - ASES";
					VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("tituloPagina", tituloPagina);
																	
					
					VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("titulosite", tituloSite);
					
					this.dataHoraAvaliacao = (String)DateUtil.dataHoraAtual();
					VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("data", dataHoraAvaliacao);
					
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
			int[] errorsWarningsCss = avaliacaoBusiness.getErrorCount(true,url);
			int[] errorsWarningsHtml = avaliacaoBusiness.getErrorCount(false,url);
			
			Checker checker = from(pagina.getContent(),url);
			
			if(mark) checker.with(marking());
			if(content) checker.with(content());
			if(presentation) checker.with(presentation());
			if(multimedia) checker.with(multimedia());
			if(form) checker.with(form());
			if(behavior) checker.with(behavior());
			
			
			Pattern pp = Pattern.compile("(http://www.)?([a-z]*)(.)?");  
		    Matcher mm = pp.matcher(url.toLowerCase().replace("https", "http"));  
		   	
		    if (mm.find())
		    	
		    this.tituloSite = "";
			
			ContentEvaluation conteudo = new ContentEvaluation(checker.getDocument());
							
			this.tituloSite =	conteudo.retornarTituloSiteAvaliado();
			
			result.include("titulosite", tituloSite);
		      
		    
		    result.include("contentLenght", pagina.getContentLength());
			result.include("url", url);
			result.include("html", pagina.getParsedContent());
			Nota nota = avaliacaoBusiness.obterNota(checker.checkSumarized(),url);
			result.include("nota",nota);
			this.sumarizarResultasNoResponse(checker.checkSumarized(), result);
			
			this.detalheAvaliacao.inicializar(avaliacaoBusiness.retornarCriterios(checker.check()),errorsWarningsCss,errorsWarningsHtml);
			VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("resultadoAvaliacao", checker.checkSumarized());
			VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("urlAvaliada", url);
			VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("contentLenght", pagina.getContentLength());
			VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("notaAvaliacao", nota);
			
			
			//Altera a cor de webaxscore de acordo a pontuacao
			
			DefinirCorWebaxscore(nota.getValor());		
			
			VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("webaxscore", webaxscore);
			
			
			//Seta o valor do título no template
			tituloPagina = "Resumo de avaliação por URI - ASES";
			VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("tituloPagina", tituloPagina);
			
		
			
			VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("titulosite", tituloSite);
			
			this.dataHoraAvaliacao = (String)DateUtil.dataHoraAtual();
			VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("data", dataHoraAvaliacao);
			
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
		
		//================================================ GERAR RELATï¿½RIO =============================================//
		
				/*Cria um Map de parï¿½metros*/
				HashMap<String, Object> map = new HashMap<String, Object>();
				
				/*Obtem a nota*/
				//AvaliacaoBusinessImpl avaliacaoBusiness = new AvaliacaoBusinessImpl();
				Nota nota  = (Nota) VRaptorRequestHolder.currentRequest().getServletContext().getAttribute("notaAvaliacao");
				
				map.put("pPercentualAses", nota.getValor());
				map.put("pPagina", urlAvaliada != "" ? urlAvaliada : "Código Fonte ou Arquivo");
				
				if(urlAvaliada != ""){
					Pattern pp = Pattern.compile("(http://www.)?([a-z]*)(.)?");  
				    Matcher mm = pp.matcher(urlAvaliada.toLowerCase());  
			
				    if (mm.find())
				        map.put("pTitulo", VRaptorRequestHolder.currentRequest().getServletContext().getAttribute("titulosite"));
				
				}else
					 map.put("pTitulo", VRaptorRequestHolder.currentRequest().getServletContext().getAttribute("titulosite"));
				
				map.put("pTamanho", contentLenght+" Bytes");
				dataHoraAvaliacao = (String)VRaptorRequestHolder.currentRequest().getServletContext().getAttribute("data");
				map.put("pDataHoraAvaliacao",   dataHoraAvaliacao);
				
				
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
	
	   //=========================================== FIM GERAR RELATï¿½RIO =============================================//
		
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
			
			SimpleDateFormat sdf= new SimpleDateFormat("dd/MM/yyyy H:mm:ss");
			
			result.include("contentLenght", String.valueOf(html.getBytes("UTF-8").length));
			result.include("html", html);
			 this.tituloSite = "";
				
				ContentEvaluation conteudo = new ContentEvaluation(checker.getDocument());
								
				this.tituloSite =	conteudo.retornarTituloSiteAvaliado();
				
				result.include("titulosite", tituloSite);
			      
			Nota nota = avaliacaoBusiness.obterNota(checker.checkSumarized(),tituloSite + " - "+sdf.format(new Date()));
			
			result.include("nota",nota);
			this.sumarizarResultasNoResponse(checker.checkSumarized(), result);
			this.detalheAvaliacao.inicializar(avaliacaoBusiness.retornarCriterios(checker.check()));
			
			VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("resultadoAvaliacao", checker.checkSumarized());
			VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("urlAvaliada", "");
			VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("contentLenght", String.valueOf(html.getBytes("UTF-8").length));
			VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("notaAvaliacao", nota);
			
			
			//Altera a cor de webaxscore de acordo a pontuacao
			
			DefinirCorWebaxscore(nota.getValor());
			
			VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("webaxscore", webaxscore);
			
			
			//Seta o valor do título no template
			tituloPagina = "Resumo de avaliação por código fonte - ASES";
			VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("tituloPagina", tituloPagina);
			result.of(this).avaliar(null, mark,content,presentation, multimedia, form, behavior, tiporel);
			
						
			VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("titulosite", tituloSite);
			
			this.dataHoraAvaliacao = (String)DateUtil.dataHoraAtual();
			VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("data", dataHoraAvaliacao);
			
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
						for (int line : ocorrencia.getLines()) 
							erros++ ;	
					else
						for (int line : ocorrencia.getLines())
							avisos++;
						
				}
			}
			
			resultado.add(new ResumoAvaliacao(classificacao, erros, avisos));
		}
		
		return resultado;
	}
	
	
	@Path("/detalhes-avaliacao/{rn}/{type}")
	public void detalhesAvaliacao(OccurrenceKey rn, boolean type){
		
		tituloPagina = "Detalhes da avaliação - ASES";
		VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("tituloPagina", tituloPagina);
		

		List<Occurrence> listOcorrencias = this.detalheAvaliacao.get(rn, type).getOcorrencias();
		
		
		
		//Sorting
		/*Collections.sort(listOcorrencias, new Comparator<Occurrence>() {
		    public int compare(Occurrence  occurrence1, Occurrence  occurrence2){
	            return  occurrence1.getCriterio().compareTo(occurrence2.getCriterio());
	        }
	    });*/
		
		//Sorting
			Collections.sort(listOcorrencias, new Comparator<Occurrence>() {
			    public int compare(Occurrence  occurrence1, Occurrence  occurrence2){
		            return  occurrence1.getLine().compareTo(occurrence2.getLine());
		        }
		    });
			
		result.include("detalhe",this.detalheAvaliacao.get(rn, type));
		result.include("listOcorrencia",listOcorrencias);
		result.include("isError",type);
		if(type){
			result.include("qtdOcorrenciasCss",this.detalheAvaliacao.getErrorsCss());
			result.include("qtdOcorrenciasHtml",this.detalheAvaliacao.getErrorsHtml());
		}else{
			result.include("qtdOcorrenciasCss",this.detalheAvaliacao.getWarningsCss());
			result.include("qtdOcorrenciasHtml",this.detalheAvaliacao.getWarningsHtml());
		}
		
		
		List<SummarizedOccurrence> ob = (List<SummarizedOccurrence>) VRaptorRequestHolder.currentRequest().getServletContext().getAttribute("resultadoAvaliacao");
		String recomendacao = "";
		
		for(SummarizedOccurrence occurrence : ob){
			recomendacao = occurrence.getMapDescription().get(rn.getCode());
			break;
		}
		
		result.include("recomendacao",recomendacao);
		result.include("rn",rn.getCode());
		result.include("aReq",this.utilitiesProperties.get("notExibCrit"));
		result.include("aReqIsCss",this.utilitiesProperties.get("reqCss"));
		result.include("aReqIsW3c",this.utilitiesProperties.get("notExibCritW3c"));
		result.include("url",VRaptorRequestHolder.currentRequest().getServletContext().getAttribute("urlAvaliada").toString().replaceAll("(https://)|(http://)", ""));
		
		
	}
	
	@Post("/exportar-detalhes-avaliacao")
	public FileDownload exportarDetalhesAvaliacao(OccurrenceKey rn, int tiporel, boolean isError){
		
		/*Cria um Map de parametros*/
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//List list = this.detalheAvaliacao.get(rn,isError).getCriterios();
		
		List<String> aReq = new ArrayList();
		//List<Integer> index = new ArrayList();
		
		String[] crit = this.utilitiesProperties.get("notExibCrit").split(" ");
		
		for (String c : crit) 
			aReq.add(c.trim());
		
		List<Criterio> listCrit = this.detalheAvaliacao.get(rn, isError).getCriterios();
		
	    
		List<Criterio> list = new ArrayList<DetalheAvaliacao.Criterio>();
		
		for(Criterio criterio : listCrit ){
	    	if(aReq.contains(rn.getCode()+"."+criterio.getId()))
				criterio.setLinhas(new ArrayList());
			
			if(criterio.getId() != null)
				list.add(criterio);
		}
		
		List<String> codigoFonte = new ArrayList();
		
		for(Occurrence occurrence : this.detalheAvaliacao.get(rn, isError).getOcorrencias()){
			if(!aReq.contains(rn.getCode()+"."+occurrence.getCriterio()))
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
	public void initEseloProperties(ServletContext servletContext) {
		this.eseloProperties = new EseloProperties(servletContext);
		
		//Esconde a nota caso não esteja usando o ESELO	
		sem_nota = this.eseloProperties.getSem_nota("sem_nota");
		VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("sem_nota", sem_nota);
		
		//Altera a mensagem caso não esteja usando o ESELO (Nota e Resumo da Avaliação de Acessibilidade)
		mensagem_avaliacao = this.eseloProperties.getMensagem_avaliacao("mensagem_avaliacao");
		VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("mensagem_avaliacao", mensagem_avaliacao);
	}
}