package br.com.ases.business;

import java.util.List;
import java.util.Map;

import br.com.ases.controller.EseloController.Nota;
import br.com.ases.domain.OccurrenceKey;
import br.com.checker.emag.Occurrence;
import br.com.checker.emag.OccurrenceClassification;
import br.com.checker.emag.SummarizedOccurrence;


public interface AvaliacaoBusiness {
	Nota obterNota(List<SummarizedOccurrence> occurrences,String url);
	Map<OccurrenceKey,Map<String,List<Occurrence>>> retornarCriterios(Map<OccurrenceClassification,List<Occurrence>> resultadoAvaliacao);
}
