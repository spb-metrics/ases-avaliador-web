package br.com.ases.business.impl;

import java.util.ArrayList;
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

	public Nota obterNota(List<SummarizedOccurrence> occurrences) {
		
		WebChecker.PostParams postParams = WebChecker.from("http://127.0.0.1:8080/ases/calcular-nota").withPostRequest()
				.addParam("resumo.url", "www.globo.com");
				
		int index = 0;
		for(SummarizedOccurrence occurence : occurrences){
			postParams.addParam("resumo.checkPoints["+index+"].identificador", occurence.getCheckPoint())
					  .addParam("resumo.checkPoints["+index+"].totalErrors", occurence.isError()?occurence.getNumberOfOccurrences():"0")
					  .addParam("resumo.checkPoints["+index+"].totalWarnings", ((!occurence.isError() && !occurence.getNumberOfOccurrences().equals(SummarizedOccurrence.EMPTY_LINES) )?occurence.getNumberOfOccurrences():"0"));
			index++;
		}
		
		
		Gson g = new GsonBuilder().create();
		Nota nota  = g.fromJson(postParams.execute().getContent(), Nota.class);
		
		
		
				
		return nota;
	}

}
