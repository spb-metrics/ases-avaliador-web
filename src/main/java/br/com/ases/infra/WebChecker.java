package br.com.ases.infra;

import java.io.IOException;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;

public class WebChecker {

	private static final String HTTP_PROTOCOL_ALLOW_CIRCULAR_REDIRECTS = "http.protocol.allow-circular-redirects";
	private HttpClient client;
	private HttpMethod method;
	private String url;
	private int statusCode;
	private String content;
	
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
	
	public WebChecker execute() {
		try {
			
			this.statusCode = client.executeMethod(this.method);
			this.content = method.getResponseBodyAsString();
			
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
	
	public String getParsedContent() {
		this.content = this.content.replaceAll("<", "&lt;");
		this.content = this.content.replaceAll(">", "&gt;");
		this.content = this.content.replaceAll(" ", "&nbsp");
		return content;
	}
	
	
}
