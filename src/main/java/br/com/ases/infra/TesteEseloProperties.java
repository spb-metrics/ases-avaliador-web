package br.com.ases.infra;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletContext;

import java.io.FileReader;

import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.ioc.ApplicationScoped;

@Resource
@ApplicationScoped
public class TesteEseloProperties {
	private static String PROPERTIES_PATH = "/WEB-INF/testeEselo.properties";
	private static String path;
	private Properties properties = new Properties();
	
	public TesteEseloProperties()
	{
		
	}
	
	public TesteEseloProperties(ServletContext servletContext) {
		try {
			this.properties.load(servletContext.getResourceAsStream(PROPERTIES_PATH));
			this.path = servletContext.getRealPath(PROPERTIES_PATH);
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
	
	public BufferedReader getListaTesteEselo() {
		
		File arquivo = new File(path);
		
		BufferedReader reader = null;
	
			try {
				
			reader = new BufferedReader(new FileReader(arquivo));
			
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		return reader;
			
	}
	
	public String getTesteEselo(String key) {
	
		return this.properties.getProperty(key);
			
	}
}
