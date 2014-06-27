package br.com.ases.converters;

import java.util.ResourceBundle;

import org.apache.commons.lang3.StringUtils;

import br.com.ases.domain.OccurrenceKey;
import br.com.caelum.vraptor.Convert;
import br.com.caelum.vraptor.Converter;
import br.com.caelum.vraptor.ioc.RequestScoped;

@Convert(OccurrenceKey.class)
@RequestScoped
public class OccurrenceKeyConverter implements Converter<OccurrenceKey> {

	public OccurrenceKey convert(String value,
			Class<? extends OccurrenceKey> type, ResourceBundle bundle) {
		
		if (StringUtils.isEmpty(value))  return null;
		
		return OccurrenceKey.valueOf(value);
	}

}
