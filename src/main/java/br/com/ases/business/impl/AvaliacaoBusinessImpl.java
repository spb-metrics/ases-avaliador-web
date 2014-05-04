package br.com.ases.business.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import br.com.ases.business.AvaliacaoBusiness;
import br.com.ases.controller.EseloController.Nota;
import br.com.ases.infra.WebChecker;
import br.com.caelum.vraptor.ioc.Component;
import br.com.checker.emag.OccurrenceClassification;
import br.com.checker.emag.SummarizedOccurrence;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


@Component
public class AvaliacaoBusinessImpl implements AvaliacaoBusiness{
	
	private static final String CALCULAR_NOTA_REST = "https://sistemas-treinamento.ifbaiano.edu.br/eselo/calcular-nota";

	public List<SummarizedOccurrence> ocorrenciasNaoComputadas(List<SummarizedOccurrence> ocorrenciasAvaliadas,OccurrenceClassification tipo ) {
		
		List<SummarizedOccurrence> ocorrenciasNaoComputadas = new ArrayList<SummarizedOccurrence>();
		
		SummarizedOccurrence.Builder builder = null;
		for(int i = tipo.getStart() ;i <= tipo.getEnd() ; i++) {
			builder = new SummarizedOccurrence.Builder()
			.setCheckPoint(String.valueOf(i));
			if(!ocorrenciasAvaliadas.contains(builder.build())){
				ocorrenciasNaoComputadas.add(builder.setType(tipo)
												.setIsError(false).build());
			}
		}
		
		return ocorrenciasNaoComputadas;
	}

	public Nota obterNota(List<SummarizedOccurrence> occurrences,String url) {
		
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
		
		
		Gson g = new GsonBuilder().create();
		Nota nota  = g.fromJson(postParams.execute().getContent(), Nota.class);
		
		
		
				
		return nota;
	}

}
