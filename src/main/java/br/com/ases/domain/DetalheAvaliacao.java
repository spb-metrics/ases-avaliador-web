package br.com.ases.domain;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeSet;

import lombok.Getter;
import lombok.Setter;
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
	
	public Detalhe get(OccurrenceKey rn, boolean type) {
		return new Detalhe(rn.getCode(),type,this.detalhes.get(rn));
	}
	
	
	public @Getter class Detalhe {
		
		private List<Criterio> criterios;
		//private Set<Occurrence> ocorrencias;
		private List<Occurrence> ocorrencias;
		
		public Detalhe(String rn,Map<String, List<Occurrence>> map) {
			
			//this.ocorrencias = new TreeSet<Occurrence>();
			this.ocorrencias = new ArrayList<Occurrence>();
			this.criterios = new ArrayList<DetalheAvaliacao.Criterio>();
			
			for(Entry<String, List<Occurrence>> entry : map.entrySet()){
				criterios.add(new Criterio(rn,entry.getKey(),entry.getValue()));
				
				int count = 0;
				for(Occurrence ocorrencia : entry.getValue()){
					ocorrencia.setPosLineOccurrence(ocorrencia.getLine().toString()+"."+ocorrencia.getColumn().toString()+"."+count);
					ocorrencias.add(ocorrencia);
					count++;
				}	
			}
			
			Collections.sort(this.criterios);
		}
		
		public Detalhe(String rn, boolean type, Map<String, List<Occurrence>> map) {
			
			//this.ocorrencias = new TreeSet<Occurrence>();
			this.ocorrencias = new ArrayList<Occurrence>();
			this.criterios = new ArrayList<DetalheAvaliacao.Criterio>();
			
			for(Entry<String, List<Occurrence>> entry : map.entrySet()){
				criterios.add(new Criterio(rn, type, entry.getKey(),entry.getValue()));
				
				int count = 0;
				for(Occurrence ocorrencia : entry.getValue()){
					
					if(ocorrencia.isError() == type){
						ocorrencia.setPosLineOccurrence(ocorrencia.getLine().toString()+"."+ocorrencia.getColumn().toString()+"."+count);
						ocorrencias.add(ocorrencia);
						count++;
					}
					
					
				}	
			}
		
			Collections.sort(this.criterios);
		}
		
	}
	
	public @Getter @Setter class  Criterio implements Comparable<Criterio>{
		private String id;
		private String descricao;
		private List<String> linhas;
		private List<String> linhasColunas;
		private String numeroOcorrencias;
		
		public Criterio(String rn, String key,List<Occurrence> ocorrencias) {
			this.linhas = new ArrayList<String>();
			this.linhasColunas = new ArrayList<String>();
			//TODO concatenar rn + key
			this.descricao = criterioProperties.getDescricao(rn+"."+key);
			
			this.id = key;
			
			int count = 0;
			for(Occurrence ocorrencia : ocorrencias) {
				linhasColunas.add(ocorrencia.getLine().toString()+"."+ocorrencia.getColumn().toString()+"."+count);
				linhas.add(ocorrencia.getLine().toString());
				count++;
			}
			
			this.numeroOcorrencias = String.valueOf(ocorrencias.size());
			
			Collections.sort(linhas, new Comparator<String>() {
				public int compare(String o1, String o2) {
					return Integer.valueOf(o1).compareTo(Integer.valueOf(o2));
				}
			});
		}
		
		public Criterio(String rn, boolean type, String key,List<Occurrence> ocorrencias) {
			this.linhas = new ArrayList<String>();
			this.linhasColunas = new ArrayList<String>();
			
			int count = 0;
			for(Occurrence ocorrencia : ocorrencias) {
				if(ocorrencia.isError() == type){
					linhasColunas.add(ocorrencia.getLine().toString()+"."+ocorrencia.getColumn().toString()+"."+count);
					linhas.add(ocorrencia.getLine().toString());
					count++;
				}
			}
			
			
			
			if(count > 0){
				//TODO concatenar rn + key
				this.descricao = criterioProperties.getDescricao(rn+"."+key);
				this.id = key;
				this.numeroOcorrencias = String.valueOf(count);
				
				Collections.sort(linhas, new Comparator<String>() {
					public int compare(String o1, String o2) {
						return Integer.valueOf(o1).compareTo(Integer.valueOf(o2));
					}
				});
			}
		}
		
		
		
		
		
		public int compareTo(Criterio other) {
			if(this.id == null)
				return 0;
			else
				if(other.id == null)
					return 0;
				else
					return Integer.valueOf(this.id).compareTo(Integer.valueOf(other.id));
		}

		
	}
}
