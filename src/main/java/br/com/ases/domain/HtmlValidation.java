package br.com.ases.domain;

import java.util.ArrayList;
import java.util.List;

public class HtmlValidation {

	List<Message> messages = new ArrayList<HtmlValidation.Message>();
	
	
	public List<Message> getMessages() {
		return messages;
	}
	
	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}
	
	public int[] getQtdWarningsErros(){
		int warnings=0;
		int erros = 0;
		for(Message message: this.messages ){
			if(message.isError())
				erros++;
			else if (message.isWarning())
				warnings++;
		}
			
		return new int[]{warnings,erros};
	}
	
	public HtmlValidation(){}
	
	public class Message{
		
		private String type;
		
		private String subType;
		
		public String getType() { return type; }
		
		public void setType(String type) { this.type = type; }
		
		public String getSubType() { return subType; }
		
		public void setSubType(String subType) { this.subType = subType; }
		
		public boolean isWarning(){ return "info".equals(type) && "warning".equals(this.subType); }
		
		public boolean isError(){ return "error".equals(this.type);}
		
	}
}



