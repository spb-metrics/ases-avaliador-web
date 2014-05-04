package br.com.ases.teste.eselo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class AvaliationReport {
	
	private String url;
	private Date date;
	private List<CheckPoint> checkPoints;
		
	public AvaliationReport() { 
		this.checkPoints =  new ArrayList<CheckPoint>(); 
	}
	
	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
	
	public Date getDate() {
		return date;
	}
	
	public void setDate(Date date) {
		this.date = date;
	}
	
	public List<CheckPoint> getCheckPoints() {
		return checkPoints;
	}
	
	public void setCheckPoints(List<CheckPoint> checkPoints) {
		this.checkPoints = checkPoints;
	}
	
	
}
