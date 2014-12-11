package br.com.ases.infra;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;

public class WebChecker {
	private static final String CONTENT_LENGHT = "Content-Length" ;
	private static final String HTTP_PROTOCOL_ALLOW_CIRCULAR_REDIRECTS = "http.protocol.allow-circular-redirects";
	private HttpClient client;
	private HttpMethod method;
	private String url;
	private int statusCode;
	private String content;
	private String contentLength;
	
	private WebChecker(HttpClient client,String url) { 
		this.client = client; 
		this.url = url;
	}
	
	public static WebChecker from(String url) {
		
		HttpClient client = new HttpClient();
		client.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler(3,false));
		client.getParams().setParameter(HTTP_PROTOCOL_ALLOW_CIRCULAR_REDIRECTS, true); 
		
		return new WebChecker(client,url);
	}
	
	public WebChecker withGetRequest() {
		this.method = new GetMethod(this.url);
		this.method.setRequestHeader("user-agent", "Mozilla/5.0");
		this.method.setFollowRedirects(true);
		return this;
	}
	
	public PostParams withPostRequest(){
		
        return new PostParams(this,new PostMethod(this.url));
        
	}
	
	public WebChecker execute() {
		try {
			
			this.statusCode = client.executeMethod(this.method);
			this.content = method.getResponseBodyAsString();
			this.contentLength = String.valueOf(this.content.getBytes("UTF-8").length);
			
		} catch (HttpException e) {
		      System.err.println("Fatal protocol violation: " + e.getMessage());
		      e.printStackTrace();
		} catch (IOException e) {
		      System.err.println("Fatal transport error: " + e.getMessage());
		      e.printStackTrace();
		} finally {
		
		      method.releaseConnection();
		} 
		return this;
		
	}
	
	public String getContent() { return content; }
	public int getStatusCode() { return statusCode; }
	public String getContentLength() { return contentLength; }
	
	public String getParsedContent() {
		this.content = this.content.replaceAll("<", "&lt;");
		this.content = this.content.replaceAll(">", "&gt;");
		this.content = this.content.replaceAll(" ", "&nbsp");
		return content;
	}
	
	private void setMethod(HttpMethod method){
		this.method = method;
	}
	private void setRequestHeader(String key, String value){
		this.method.setRequestHeader(key,value);
	}
	public class PostParams{
		private  List<NameValuePair> data = new ArrayList<NameValuePair>();
		private WebChecker webChecker;
		private PostMethod post;
		
		private PostParams(WebChecker webChecker,PostMethod post){
			this.webChecker = webChecker;
			this.post = post;
		}
		
		public PostParams addParam(String key, String value) {
			this.data.add(new NameValuePair(key,value));
			return this;
		}
		
		public WebChecker execute(){
			this.post.setRequestBody(data.toArray(new NameValuePair[data.size()] ));
	        this.webChecker.setMethod(post);
	        this.webChecker.setRequestHeader("user-agent", "Mozilla/5.0");
			this.webChecker.execute();
			return webChecker;
		}
		
		
	}

	
	public static void main(String ...arg){
		
		WebChecker pagina = WebChecker.from("https://sistemas-treinamento.ifbaiano.edu.br/eselo/calcular-nota").withPostRequest()
				.addParam("avaliationReport.url", "http://www.globo.com")
				.addParam("avaliationReport.date","2014-04-24 10:07:02.447 GMT-03:00")
				.addParam("avaliationReport.checkPoints[0].identificador", "2")
				.addParam("avaliationReport.checkPoints[0].totalErrors", "10")
				.addParam("avaliationReport.checkPoints[0].totalWarnings", "5")
				.addParam("avaliationReport.checkPoints[1].identificador", "3")
				.addParam("avaliationReport.checkPoints[1].totalErrors", "3")
				.addParam("avaliationReport.checkPoints[1].totalWarnings", "6")
				.execute();
		
		System.out.println(pagina.getContent());
		
		
		
		NumberFormat myFormat = NumberFormat.getInstance();
	    
	    myFormat.setMaximumFractionDigits(2);
	    myFormat.setMinimumFractionDigits(0);
	    
	    System.out.println(myFormat.format("100.0"));
		 
	}
	
}
