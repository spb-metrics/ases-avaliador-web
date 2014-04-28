package br.com.ases.business.impl;

import java.util.ArrayList;
import java.util.List;

import br.com.ases.business.AvaliacaoBusiness;
import br.com.caelum.vraptor.ioc.Component;
import br.com.checker.emag.OccurrenceClassification;
import br.com.checker.emag.SummarizedOccurrence;


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

}
