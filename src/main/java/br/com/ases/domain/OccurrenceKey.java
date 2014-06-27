package br.com.ases.domain;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import br.com.checker.emag.Occurrence;


@EqualsAndHashCode
public @Getter class OccurrenceKey {
	private String code;
	
	public OccurrenceKey (Occurrence occurrence) {
		this.code = occurrence.getCode();
	}
	
	private OccurrenceKey(String code){
		this.code = code;
	}
	
	public static OccurrenceKey valueOf(String code){
		return new OccurrenceKey(code);
	}
	
	
}