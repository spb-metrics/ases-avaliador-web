package br.com.ases.domain;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import lombok.Getter;
import br.com.ases.infra.CriterioProperties;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.ioc.SessionScoped;
import br.com.checker.emag.Occurrence;

@Resource
@SessionScoped
public class DetalheAvaliacao {

	private CriterioProperties criterioProperties;
	private Map<OccurrenceKey,Map<String,List<Occurrence>>> detalhes;
	
	public DetalheAvaliacao(CriterioProperties criterioProperties){
		this.criterioProperties = criterioProperties;
	}
	
	public void inicializar(Map<OccurrenceKey,Map<String,List<Occurrence>>> detalhes) {
		this.detalhes = detalhes;
	}
	
	
	public Detalhe get(OccurrenceKey rn) {
		return new Detalhe(rn.getCode(),this.detalhes.get(rn));
	}
	
	
	public @Getter class Detalhe {
		
		private List<Criterio> criterios;
		private List<Occurrence> ocorrencias;
		
		public Detalhe(String rn,Map<String, List<Occurrence>> map) {
			
			this.ocorrencias = new ArrayList<Occurrence>();
			this.criterios = new ArrayList<DetalheAvaliacao.Criterio>();
			
			for(Entry<String, List<Occurrence>> entry : map.entrySet()){
				criterios.add(new Criterio(rn,entry.getKey(),entry.getValue()));
				
				for(Occurrence ocorrencia : entry.getValue())
					ocorrencias.add(ocorrencia);
			}
		}
		
	}
	
	public @Getter class  Criterio {
		private String id;
		private String descricao;
		private List<String> linhas;
		private String numeroOcorrencias;
		
		public Criterio(String rn, String key,List<Occurrence> ocorrencias) {
			this.linhas = new ArrayList<String>();
			//TODO concatenar rn + key
			this.descricao = criterioProperties.getDescricao("1.1");
			
			this.id = key;
			for(Occurrence ocorrencia : ocorrencias) {
				linhas.add(ocorrencia.getLine().toString());
			}
			this.numeroOcorrencias = String.valueOf(ocorrencias.size());
		}
	}
}
