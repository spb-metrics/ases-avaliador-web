package br.com.ases.business;

import java.util.List;

import br.com.checker.emag.OccurrenceClassification;
import br.com.checker.emag.SummarizedOccurrence;


public interface AvaliacaoBusiness {
	
	public List<SummarizedOccurrence> ocorrenciasNaoComputadas(List<SummarizedOccurrence> ocorrenciasAvaliadas,OccurrenceClassification tipo );

}
