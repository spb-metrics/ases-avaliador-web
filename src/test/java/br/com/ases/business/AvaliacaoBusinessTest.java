package br.com.ases.business;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

import br.com.ases.business.impl.AvaliacaoBusinessImpl;
import br.com.ases.domain.OccurrenceKey;
import br.com.checker.emag.Occurrence;
import br.com.checker.emag.OccurrenceClassification;

@RunWith(JUnit4.class)
public class AvaliacaoBusinessTest {
	
	@Test
	public void deveAgruparResultadoAvaliacaoPorCriterios() {
		AvaliacaoBusiness avaliacaoBusiness = new AvaliacaoBusinessImpl();
		
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
		
		Map<OccurrenceClassification,List<Occurrence>> resultadoAvaliacao = new HashMap<OccurrenceClassification, List<Occurrence>>();
		
		resultadoAvaliacao.put(OccurrenceClassification.MARK, ocorrenciasMarcacao);
		resultadoAvaliacao.put(OccurrenceClassification.BEHAVIOR, ocorrenciasComportamento);
		
		avaliacaoBusiness.retornarCriterios(resultadoAvaliacao);
		
		for(Entry<OccurrenceKey,Map<String,List<Occurrence>>> entry : avaliacaoBusiness.retornarCriterios(resultadoAvaliacao).entrySet() ) {
			
			System.out.println("RN numero : "+ entry.getKey().getCode()+"\n");
			System.out.println("Criterios ----- \n");
			
			for(Entry<String,List<Occurrence>> entry2 : entry.getValue().entrySet() ) {
				System.out.println("Criterio : " + entry2.getKey()+" \n Linhas :  ");
				for(Occurrence oc : entry2.getValue())
					System.out.println(oc.getLine() + " - ");
			}
			
			System.out.println(" ---------------------------");
		}
		
		
	}

}
