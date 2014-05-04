package br.com.ases.teste.eselo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Result{
	
	private String url;
	private Date date;
	
	private List<CheckPoint> checkPoints;
	
	public Result(){ 
		this.checkPoints =  new ArrayList<CheckPoint>(); 
		//this.date = new GregorianCalendar();
	}
	
	public void addCheckPoint(CheckPoint checkPoint) { this.checkPoints.add(checkPoint) ; }
	
	public String getUrl() { return url; }
	
	public void setUrl(String url) { this.url = url; }
	
	public Date getDate() { return date; }
	
	public void setDate(Date date) { this.date = date; }
	
	public List<CheckPoint> getCheckPoints() { return checkPoints; }
	
}
