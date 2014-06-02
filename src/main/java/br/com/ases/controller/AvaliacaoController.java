package br.com.ases.controller;

import static br.com.checker.emag.core.Checker.behavior;
import static br.com.checker.emag.core.Checker.form;
import static br.com.checker.emag.core.Checker.from;
import static br.com.checker.emag.core.Checker.marking;
import static br.com.checker.emag.core.Checker.multimedia;
import static br.com.checker.emag.core.Checker.content;
import static br.com.checker.emag.core.Checker.presentation;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletContext;

import net.sf.jasperreports.engine.JRException;
import br.com.ases.business.AvaliacaoBusiness;
import br.com.ases.business.impl.AvaliacaoBusinessImpl;
import br.com.ases.controller.EseloController.Nota;
import br.com.ases.domain.ResumoAvaliacao;
import br.com.ases.infra.WebChecker;
import br.com.ases.model.utilities.ManagerReport;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.download.FileDownload;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.ioc.spring.VRaptorRequestHolder;
import br.com.checker.emag.OccurrenceClassification;
import br.com.checker.emag.SummarizedOccurrence;
import br.com.checker.emag.core.Checker;

@Resource
public class AvaliacaoController {
	
	private Result result;
	private AvaliacaoBusiness avaliacaoBusiness;
	private Map<OccurrenceClassification,List<SummarizedOccurrence>> ocorrencias = new HashMap<OccurrenceClassification, List<SummarizedOccurrence>>();
	private ServletContext application;
	
	public AvaliacaoController (Result result, AvaliacaoBusiness avaliacaoBusiness,ServletContext application) {
		this.result = result;
		this.avaliacaoBusiness = avaliacaoBusiness;
		this.application = application;
	}
	
	
	
	@Path("/avaliar-arquivo")
	public void avaliarArquivo(UploadedFile file, boolean mark,
												  boolean content,
												  boolean presentation,
												  boolean multimedia, 
												  boolean form,
												  boolean behavior,
												  int tiporel) throws IOException {
        
		BufferedReader reader = new BufferedReader( new InputStreamReader( file.getFile() ) );
		String html = "";   
	    String linha = "";  
	    while( ( linha = reader.readLine() ) != null )  
	        html += "\n"+linha;
	    
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
		result.of(this).avaliar(null, mark,content,presentation, multimedia, form, behavior, tiporel);
    }
	
	
	@Post("/avaliar")
	public void avaliar(String url, boolean mark, 
									boolean content,
									boolean presentation,
									boolean multimedia, 
									boolean form, 
									boolean behavior,
									int tiporel) {
		
		
		if(tiporel != 5)
			this.result.redirectTo(AvaliacaoController.class).relatorioAvaliacao(url, mark, content, presentation, multimedia, form, behavior, tiporel);
		
		if(url.startsWith("www")) url="http://"+url;
		
		WebChecker pagina = WebChecker.from(url).withGetRequest().execute();
		
		
		Checker checker = from(pagina.getContent());
		
		if(mark) checker.with(marking());
		if(content) checker.with(content());
		if(presentation) checker.with(presentation());
		if(multimedia) checker.with(multimedia());
		if(form) checker.with(form());
		if(behavior) checker.with(behavior());

		result.include("url", url);
		result.include("html", pagina.getParsedContent());
		result.include("nota",avaliacaoBusiness.obterNota(checker.checkSumarized(),url));
		this.sumarizarResultasNoResponse(checker.checkSumarized(), result);
		
		VRaptorRequestHolder.currentRequest().getServletContext().setAttribute("resultadoAvaliacao", checker.checkSumarized()); 
				
	}
	
	@Get("/relatorioavaliacao")
	@Post("/relatorioavaliacao")
	public FileDownload relatorioAvaliacao(String url, boolean mark, 
									boolean content,
									boolean presentation,
									boolean multimedia, 
									boolean form, 
									boolean behavior,
									int tiporel) {
		
		if(url.startsWith("www")) url="http://"+url;
		
		WebChecker pagina = WebChecker.from(url).withGetRequest().execute();
		
		
		Checker checker = from(pagina.getContent());
		
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
				Nota nota = avaliacaoBusiness.obterNota(checker.checkSumarized(), url);
				map.put("pPercentualAses", nota.getValor());
				map.put("pPagina", url);
				map.put("pTitulo", "governoeletronico");
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
		result.include("nota",avaliacaoBusiness.obterNota(checker.checkSumarized(),null));
		this.sumarizarResultasNoResponse(checker.checkSumarized(), result);
		result.of(this).avaliar(null, mark,content,presentation, multimedia, form, behavior, tiporel);
		
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
		
	}
	
	private List<ResumoAvaliacao> obterResumoAvaliacao() {
		List<ResumoAvaliacao>  resultado = new ArrayList<ResumoAvaliacao>();
		
		for(Entry<OccurrenceClassification, List<SummarizedOccurrence>> entry : ocorrencias.entrySet()){
			
			int erros = 0;
			int avisos = 0;
			
			for(SummarizedOccurrence ocorrencia : entry.getValue()){
				if(ocorrencia.isError())
					erros++ ;
				else
					avisos++;
			}
			
			resultado.add(new ResumoAvaliacao(entry.getKey(), erros, avisos));
				
		}
		
		return resultado;
	}
	
	
	@Path("/detalhes-avaliacao")
	public void detalhesAvaliacao(String checkPoint, String hashCode){
		List<SummarizedOccurrence> res = (List<SummarizedOccurrence>) VRaptorRequestHolder.currentRequest().getServletContext().getAttribute("resultadoAvaliacao");
		result.include("detalhesAvaliacao",res); 
		//result.include("recomendacao",resultado.getMapDescription().get(resultado.getCheckPoint()));
	}

}