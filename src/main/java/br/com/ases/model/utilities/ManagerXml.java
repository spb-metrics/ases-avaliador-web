package br.com.ases.model.utilities;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import br.com.ases.model.entity.PerguntaFrequente;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.Dom4JDriver;

/**
 * @category xml
 * @version 1.0*/
public class ManagerXml {
		
	private String pathArquivo;
	
	/**
	 * Classe ManagerXml. Gerência o arquivo xml de Perguntas e Respostas
	 * @param String diretorioDoArquivo*/
	public ManagerXml(String pathArquivo){
		this.pathArquivo = pathArquivo;
	}
	
	/**
	 * setPerguntaFrequente insere uma nova pergunta e resposta no arquivo xml.
	 * @param PerguntaFrequente perguntaFrequente
	 * @return {@link Boolean}
	 * @*/
	public boolean setPerguntaFrequente(PerguntaFrequente perguntaFrequente){
		
		boolean status =  true;
		
        List<PerguntaFrequente> listNovasPerguntas = new ArrayList<PerguntaFrequente>();
        try {
        	 XStream xStream = new XStream(new Dom4JDriver());
             xStream.alias("perguntasFrequentes", ArrayList.class);
             xStream.processAnnotations(PerguntaFrequente.class);
  
             BufferedReader input;
			
				input = new BufferedReader(new FileReader(this.pathArquivo));
			
             ArrayList<PerguntaFrequente> perguntas = (ArrayList) xStream.fromXML(input);
             input.close();
 
            for (PerguntaFrequente pergunta : perguntas) {
            	            	            	
            	listNovasPerguntas.add(pergunta);
            }
        
        PerguntaFrequente novaPerguntaFrequente = new PerguntaFrequente();
        novaPerguntaFrequente.setId(perguntaFrequente.getId());
        novaPerguntaFrequente.setPergunta(perguntaFrequente.getPergunta());
        novaPerguntaFrequente.setResposta(perguntaFrequente.getResposta());
        
        listNovasPerguntas.add(perguntaFrequente);
        
        XStream xStreamOut = new XStream();
        xStreamOut.alias("perguntasFrequentes", List.class);
        xStreamOut.alias("perguntaFrequente", PerguntaFrequente.class);
 
        File arquivo = new File(this.pathArquivo);
        FileOutputStream gravar;
 
            gravar = new FileOutputStream(arquivo);
            gravar.write(xStreamOut.toXML(listNovasPerguntas).getBytes());
            gravar.close();
            
        } catch (Exception e) {
        	status = false;
			e.printStackTrace();
	
		}
 
        return status;
    }
    
	/**
	 * getPerguntasFrequentes retorna um ArrayList de PerguntasFrequentes.
	 * @return {@link ArrayList}
	 * @*/
	public ArrayList<PerguntaFrequente> getPerguntasFrequentes(){
		
		ArrayList<PerguntaFrequente> perguntas = null;
        
		try {
            XStream xStream = new XStream(new Dom4JDriver());
            xStream.alias("perguntasFrequentes", ArrayList.class);
            xStream.processAnnotations(PerguntaFrequente.class);
 
            BufferedReader input = new BufferedReader(new FileReader(this.pathArquivo));
            perguntas = (ArrayList) xStream.fromXML(input);
            input.close();
 
 
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        
        return perguntas;
	}   
	
	/**
	 * xmlPerguntaFrequenteExiste verifica se o arquivo xml existe.
	 * @return {@link ArrayList}
	 * @*/
	public boolean xmlPerguntaFrequenteExiste(){
		boolean isExiste = true;
		File arquivo = new File(this.pathArquivo);  
		if (!arquivo.exists())   
		   isExiste = false;  
	
		return isExiste;
	}
}
