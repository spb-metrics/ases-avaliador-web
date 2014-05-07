package br.com.ases.model.utilities;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class ManagerProperties {
	
	public Properties getProp(String path) throws IOException { 
		Properties props = new Properties(); 
		FileInputStream file = new FileInputStream(path); 
		props.load(file); 
		return props; 
	}
}
