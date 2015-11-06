package br.com.ases.business.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;

import br.com.ases.business.AvaliacaoBusiness;
import br.com.ases.controller.EseloController;
import br.com.ases.controller.EseloController.Nota;
import br.com.ases.domain.HtmlValidation;
import br.com.ases.domain.OccurrenceKey;
import br.com.ases.infra.EseloProperties;
import br.com.ases.infra.WebChecker;
import br.com.caelum.vraptor.ioc.Component;
import br.com.checker.emag.Occurrence;
import br.com.checker.emag.OccurrenceClassification;
import br.com.checker.emag.SummarizedOccurrence;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;


@Component
public class AvaliacaoBusinessImpl implements AvaliacaoBusiness{
	EseloProperties eseloProperties = null;
	

	private static String CSS_VALIDATOR_URL = "http://www.css-validator.org/validator?uri=#{url}&warning=0&output=soap12";
	private static String HTML_VALIDATOR_URL = "https://validator.w3.org/nu/?doc=#{url}&out=json";
	
	public Nota obterNota(List<SummarizedOccurrence> occurrences,String url) {
		Nota nota = null;
		try {
		
			WebChecker.PostParams postParams = WebChecker.from(this.eseloProperties.getUrl("url")).withPostRequest();
				
			//Relatorio de Avaliacao
			postParams.addParam("relatorioAvaliacao.date", new Date().toString())
			.addParam("relatorioAvaliacao.url", url);
		
			TreeSet<Integer> rns = new TreeSet<Integer>();
			
			for(SummarizedOccurrence occurence : occurrences){
				String[] idRec = occurence.getCheckPoint().split("\\.");
				rns.add(Integer.parseInt(idRec[0]));
			}
			
			int countReq = 1;
			int countCriterio = 0;
			int qtdLinhas = 0;
			
			for(Integer rn : rns){
				//Recomendação Avaliada
				postParams.addParam("relatorioAvaliacao.recomendacoes["+countReq+"].idRecomendacao",  Integer.toString(rn));
				int qtdErros = 0;
				
				for(SummarizedOccurrence occurence : occurrences){
					String[] idRec = occurence.getCheckPoint().split("\\.");
					
					qtdLinhas = qtdLinhas + occurence.getLines().size();
				
					//CritÃ©rios
					if(rn == Integer.parseInt(idRec[0])){
						qtdErros = qtdErros + Integer.parseInt(occurence.isError()?occurence.getNumberOfOccurrences():"0");
						postParams.addParam("relatorioAvaliacao.recomendacoes["+countReq+"].criterios["+countCriterio+"].idCriterio",idRec[1])
						.addParam("relatorioAvaliacao.recomendacoes["+countReq+"].criterios["+countCriterio+"].qtdeErros",occurence.isError()?occurence.getNumberOfOccurrences():"0")
						.addParam("relatorioAvaliacao.recomendacoes["+countReq+"].criterios["+countCriterio+"].qtdeItens", Integer.toString(occurence.getLines().size()));
						
					}else countCriterio = 0;
					
					countCriterio++;
				}
				
				postParams.addParam("relatorioAvaliacao.recomendacoes["+countReq+"].totalErros", Integer.toString(qtdErros));
				//postParams.addParam("relatorioAvaliacao.qtdeLinhas", Integer.toString(qtdLinhas));
				countReq++;
			}
			
			postParams.addParam("relatorioAvaliacao.qtdeLinhas", Integer.toString(qtdLinhas));
			
			Gson g = new GsonBuilder().create();
			nota  = g.fromJson(postParams.execute().getContent(), Nota.class);
			
			}catch(Exception e){
				nota = new EseloController(null).new Nota(url, "---" , "0.0");
			}
		
			return nota;
		
		/*Nota nota = null ; //Versï¿½o desenvolvida por Rodrigo
		try {
		WebChecker.PostParams postParams = WebChecker.from(CALCULAR_NOTA_REST).withPostRequest()
				.addParam("avaliationReport.url", url)
				.addParam("avaliationReport.date", "2014-04-24 10:07:02.447 GMT-03:00");
				
		int index = 0;
		for(SummarizedOccurrence occurence : occurrences){
			postParams.addParam("avaliationReport.checkPoints["+index+"].identificador", occurence.getCheckPoint())
					  .addParam("avaliationReport.checkPoints["+index+"].totalErrors", occurence.isError()?occurence.getNumberOfOccurrences():"0")
					  .addParam("avaliationReport.checkPoints["+index+"].totalWarnings", ((!occurence.isError() && !occurence.getNumberOfOccurrences().equals(SummarizedOccurrence.EMPTY_LINES) )?occurence.getNumberOfOccurrences():"0"));
			index++;
		}
		
		System.out.println(this.eseloProperties.getUrl("url"));
		System.out.println(postParams.execute().getContent());
		
		Gson g = new GsonBuilder().create();
		nota  = g.fromJson(postParams.execute().getContent(), Nota.class);
		
		}catch(Exception e){
			nota = new EseloController(null).new Nota(url, "---" , "0.0");
		}
		
		return nota;*/
	}
	
	public Map<OccurrenceKey,Map<String,List<Occurrence>>> retornarCriterios(Map<OccurrenceClassification,List<Occurrence>> resultadoAvaliacao){
		
		Map<OccurrenceKey,Map<String,List<Occurrence>>> resultadoCriterios = new HashMap<OccurrenceKey, Map<String,List<Occurrence>>>();
		
		for( Entry<OccurrenceClassification,List<Occurrence>> entrada:  resultadoAvaliacao.entrySet()) {
			
			for(Entry<OccurrenceKey,List<Occurrence>> ocorrenciasPorRN : agruparOcorrenciaPorRN(entrada.getValue()).entrySet()){
				
				if(resultadoCriterios.get(ocorrenciasPorRN.getKey())== null)
					resultadoCriterios.put(ocorrenciasPorRN.getKey(), new HashMap<String, List<Occurrence>>());
				
				
				Map<String,List<Occurrence>> mapaCriterios = resultadoCriterios.get(ocorrenciasPorRN.getKey());
				for(Occurrence ocorrencia : ocorrenciasPorRN.getValue()){
					
					if (mapaCriterios.get(ocorrencia.getCriterio()) == null)
						mapaCriterios.put(ocorrencia.getCriterio(), new ArrayList<Occurrence>());
					
					mapaCriterios.get(ocorrencia.getCriterio()).add(ocorrencia);
					
				}
			}
				
		}
		
		return resultadoCriterios;
		
	}
	
	
	private Map<OccurrenceKey,List<Occurrence>> agruparOcorrenciaPorRN(List<Occurrence> occurrences) {
		
		Map<OccurrenceKey,List<Occurrence>> map = new HashMap<OccurrenceKey, List<Occurrence>>();
		OccurrenceKey occurrenceKey = null;
		for(Occurrence occurrence : occurrences) {
			occurrenceKey = new OccurrenceKey(occurrence);
			
			if(map.get(occurrenceKey) ==null) {
				map.put(occurrenceKey, new ArrayList<Occurrence>());
				map.get(occurrenceKey).add(occurrence);
			}else {
				map.get(occurrenceKey).add(occurrence);
			}
				
		}
		return map;
	}
	
	public int[] getErrorCount(boolean isCss,String url){
		int errors = 0;
		int warnings = 0;
		
		try{
			if(isCss){
				String content = WebChecker.from(CSS_VALIDATOR_URL.replace("#{url}", url)).withGetRequest().execute().getContent();
				Matcher m = Pattern.compile("<m:errorcount>(\\d)*</m:errorcount>",Pattern.MULTILINE).matcher(content);
				if(m.find())
					errors =  Integer.valueOf(m.group(0).replace("<m:errorcount>", "").replace("</m:errorcount>", ""));
				
				m = Pattern.compile("<m:warningcount>(\\d)*</m:warningcount>",Pattern.MULTILINE).matcher(content);
				
				if(m.find())
					warnings =  Integer.valueOf(m.group(0).replace("<m:warningcount>", "").replace("</m:warningcount>", ""));
				
			}else{
				
				String content = WebChecker.from(HTML_VALIDATOR_URL.replace("#{url}", url)).withGetRequest().execute().getContent();
				Gson g = new GsonBuilder().create();
				HtmlValidation a =  g.fromJson(content, HtmlValidation.class);
				int[] errorsWarnings = a.getQtdWarningsErros();
				errors = errorsWarnings[1];
				warnings = errorsWarnings[0];
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return new int[]{errors,warnings};
	}
	
	public static void main(String ...arg) {
		int[] teste = new AvaliacaoBusinessImpl().getErrorCount(false, "http://www.agritempo.gov.br/agritempo/index.jsp");
		
		System.out.println("errors :" +teste[0]);
		System.out.println("warnings :" +teste[1]);
	}
	
	public static Map<OccurrenceClassification,List<Occurrence>> resultadoAvaliacao = new HashMap<OccurrenceClassification, List<Occurrence>>();
	
	static {
		Occurrence ocorrencia1 = new Occurrence(10, 5, "1", true, "<a hrf=\"#home\">Tag home completa</a>",OccurrenceClassification.MARK,"1");
		Occurrence ocorrencia2 = new Occurrence(55, 10, "1", false, "<a hrf=\"#home2\">Tag home completa 2</a>",OccurrenceClassification.MARK,"1");
		Occurrence ocorrencia3 = new Occurrence(60, 5, "2", true, "<h1>Teste</h1>",OccurrenceClassification.MARK,"2");
		Occurrence ocorrencia4 = new Occurrence(90, 10, "2", false, "<h2>Teste H2</h2>",OccurrenceClassification.MARK,"3");
		Occurrence ocorrencia5 = new Occurrence(115, 10, "1", false, "<a hrf=\"#home2\">Tag home completa 3</a>",OccurrenceClassification.MARK);
		List<Occurrence> ocorrenciasMarcacao = new ArrayList<Occurrence>();
		ocorrenciasMarcacao.add(ocorrencia1);
		ocorrenciasMarcacao.add(ocorrencia2);
		ocorrenciasMarcacao.add(ocorrencia3);
		ocorrenciasMarcacao.add(ocorrencia4);
		ocorrenciasMarcacao.add(ocorrencia5);
		
		Occurrence ocorrencia1Comportamento = new Occurrence(10, 5, "3", true, "<a hrf=\"#home\">Tag home completa</a>",OccurrenceClassification.BEHAVIOR,"1");
		Occurrence ocorrencia2Comportamento = new Occurrence(55, 10, "3", false, "<a hrf=\"#home2\">Tag home completa 2</a>",OccurrenceClassification.BEHAVIOR,"1");
		Occurrence ocorrencia3Comportamento = new Occurrence(60, 5, "3", true, "<h1>Teste</h1>",OccurrenceClassification.BEHAVIOR,"2");
		Occurrence ocorrencia4Comportamento = new Occurrence(90, 10, "4", false, "<h2>Teste H2</h2>",OccurrenceClassification.BEHAVIOR,"2");
		List<Occurrence> ocorrenciasComportamento = new ArrayList<Occurrence>();
		ocorrenciasComportamento.add(ocorrencia1Comportamento);
		ocorrenciasComportamento.add(ocorrencia2Comportamento);
		ocorrenciasComportamento.add(ocorrencia3Comportamento);
		ocorrenciasComportamento.add(ocorrencia4Comportamento);
		
		resultadoAvaliacao.put(OccurrenceClassification.MARK, ocorrenciasMarcacao);
		resultadoAvaliacao.put(OccurrenceClassification.BEHAVIOR, ocorrenciasComportamento);
	}

	public void initEseloProperties(ServletContext servletContext) {
		this.eseloProperties = new EseloProperties(servletContext);
		
	}
	
}
