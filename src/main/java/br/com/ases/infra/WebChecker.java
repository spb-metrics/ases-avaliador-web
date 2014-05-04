package br.com.ases.infra;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
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
	
	public PostParams withPostRequest(){
		
        return new PostParams(this,new PostMethod(this.url));
        
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
		
		WebChecker pagina = WebChecker.from("http://127.0.0.1:8080/ases/calcular-nota").withPostRequest()
				.addParam("resumo.url", "www.globo.com")
				.addParam("resumo.checkPoints[0].identificador", "Marcação")
				.addParam("resumo.checkPoints[0].totalErrors", "10")
				.addParam("resumo.checkPoints[0].totalWarnings", "5")
				.addParam("resumo.checkPoints[1].identificador", "Formulário")
				.addParam("resumo.checkPoints[1].totalErrors", "3")
				.addParam("resumo.checkPoints[1].totalWarnings", "6")
				.execute();
		
		System.out.println(pagina.getContent());
	}
	
}
