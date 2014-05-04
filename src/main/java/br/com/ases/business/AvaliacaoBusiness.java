package br.com.ases.business;

import java.util.List;

import br.com.ases.controller.EseloController.Nota;
import br.com.checker.emag.OccurrenceClassification;
import br.com.checker.emag.SummarizedOccurrence;


public interface AvaliacaoBusiness {
	
	public List<SummarizedOccurrence> ocorrenciasNaoComputadas(List<SummarizedOccurrence> ocorrenciasAvaliadas,OccurrenceClassification tipo );
	public Nota obterNota(List<SummarizedOccurrence> occurrences,String url);
}
