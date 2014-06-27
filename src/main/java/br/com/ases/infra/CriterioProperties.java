package br.com.ases.infra;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletContext;

import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.ioc.ApplicationScoped;

@Resource
@ApplicationScoped
public class CriterioProperties {

	private static String PROPERTIES_PATH = "/WEB-INF/criteriosDescriptions.properties";
	private Properties properties = new Properties();
	
	public CriterioProperties(ServletContext servletContext) {
		
		try {
			this.properties.load(servletContext.getResourceAsStream(PROPERTIES_PATH));
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
			
	public String getDescricao(String key) {
		return this.properties.getProperty(key);
	}
	
			
}
