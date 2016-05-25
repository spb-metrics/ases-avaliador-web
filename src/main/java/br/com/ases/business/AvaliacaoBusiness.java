package br.com.ases.business;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletContext;

import net.htmlparser.jericho.Source;
import br.com.ases.controller.EseloController.Nota;
import br.com.ases.domain.OccurrenceKey;
import br.com.checker.emag.Occurrence;
import br.com.checker.emag.OccurrenceClassification;
import br.com.checker.emag.SummarizedOccurrence;


public interface AvaliacaoBusiness {
	Nota obterNota(List<SummarizedOccurrence> occurrences,String url, List<Entry<OccurrenceKey,List<Occurrence>>> mapaListaOcorrencias);
	Nota obterNotaEselo(Source html, String url, List<Entry<OccurrenceKey,List<Occurrence>>> mapaListaOcorrencias);
	Map<OccurrenceKey,Map<String,List<Occurrence>>> retornarCriterios(Map<OccurrenceClassification,List<Occurrence>> resultadoAvaliacao);
	List<Entry<OccurrenceKey,List<Occurrence>>> retornarCriteriosTeste(Map<OccurrenceClassification,List<Occurrence>> resultadoAvaliacao);
	void initEseloProperties(ServletContext servletContext);
	void initDeparaAsesComEseloProperties(ServletContext servletContext);
	public int[] getErrorCount(boolean isCss,String url);
}
