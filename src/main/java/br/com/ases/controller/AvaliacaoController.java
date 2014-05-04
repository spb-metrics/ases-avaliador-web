package br.com.ases.controller;

import static br.com.checker.emag.core.Checker.behavior;
import static br.com.checker.emag.core.Checker.form;
import static br.com.checker.emag.core.Checker.from;
import static br.com.checker.emag.core.Checker.marking;
import static br.com.checker.emag.core.Checker.multimedia;
import static br.com.checker.emag.core.Checker.content;
import static br.com.checker.emag.core.Checker.presentation;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import br.com.ases.business.AvaliacaoBusiness;
import br.com.ases.domain.ResumoAvaliacao;
import br.com.ases.infra.WebChecker;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.checker.emag.OccurrenceClassification;
import br.com.checker.emag.SummarizedOccurrence;
import br.com.checker.emag.core.Checker;
@Resource
public class AvaliacaoController {
	
	private Result result;
	private AvaliacaoBusiness avaliacaoBusiness;
	private Map<OccurrenceClassification,List<SummarizedOccurrence>> ocorrencias = new HashMap<OccurrenceClassification, List<SummarizedOccurrence>>();
	
	
	public AvaliacaoController (Result result, AvaliacaoBusiness avaliacaoBusiness) {
		this.result = result;
		this.avaliacaoBusiness = avaliacaoBusiness;
	}
	
	
	@Post
	@Path("/avaliar-arquivo")
	public void avaliarArquivo(UploadedFile file, boolean mark,
												  boolean content,
												  boolean presentation,
												  boolean multimedia, 
												  boolean form,
												  boolean behavior) throws IOException {
        
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
		result.include("nota",avaliacaoBusiness.obterNota(checker.checkSumarized()));
		this.sumarizarResultasNoResponse(checker.checkSumarized(), result);
		result.of(this).avaliar(null, mark,content,presentation, multimedia, form, behavior);
    }
	
	
	@Post("/avaliar")
	public void avaliar(String url, boolean mark, 
									boolean content,
									boolean presentation,
									boolean multimedia, 
									boolean form, 
									boolean behavior) {
		
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
		result.include("nota",avaliacaoBusiness.obterNota(checker.checkSumarized()));
		this.sumarizarResultasNoResponse(checker.checkSumarized(), result);
		
	}
	
	@Post("/avaliar-codigo")
	public void avaliarPlainText(String html, boolean mark,
											  boolean content,
											  boolean presentation, 
											  boolean multimedia, 
											  boolean form, 
											  boolean behavior) {
		
		
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
		this.sumarizarResultasNoResponse(checker.checkSumarized(), result);
		result.of(this).avaliar(null, mark,content,presentation, multimedia, form, behavior);
		
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
	

}
