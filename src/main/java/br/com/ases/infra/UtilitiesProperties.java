package br.com.ases.infra;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletContext;

import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.ioc.ApplicationScoped;

@Resource
@ApplicationScoped
public class UtilitiesProperties {

	private static String PROPERTIES_PATH = "/WEB-INF/naoexibircodigofonte.properties";
	private Properties properties = new Properties();
	
	public UtilitiesProperties(ServletContext servletContext) {
		
		try {
			this.properties.load(servletContext.getResourceAsStream(PROPERTIES_PATH));
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
			
	public String get(String key) {
		return this.properties.getProperty(key);
	}
}