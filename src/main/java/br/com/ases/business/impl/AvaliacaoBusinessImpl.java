package br.com.ases.business.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;

import org.apache.catalina.util.StringParser;

import net.htmlparser.jericho.Element;
import net.htmlparser.jericho.Source;
import net.htmlparser.jericho.Tag;
import br.com.ases.business.AvaliacaoBusiness;
import br.com.ases.controller.EseloController;
import br.com.ases.controller.EseloController.Nota;
import br.com.ases.domain.HtmlValidation;
import br.com.ases.domain.OccurrenceKey;
import br.com.ases.infra.DeparaAsesComEseloProperties;
import br.com.ases.infra.EseloProperties;
import br.com.ases.infra.TesteEseloProperties;
import br.com.ases.infra.WebChecker;
import br.com.caelum.vraptor.ioc.Component;
import br.com.checker.emag.Occurrence;
import br.com.checker.emag.OccurrenceClassification;
import br.com.checker.emag.SummarizedOccurrence;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sun.corba.se.impl.orbutil.closure.Constant;


@Component
public class AvaliacaoBusinessImpl implements AvaliacaoBusiness {
	EseloProperties eseloProperties = null;
	TesteEseloProperties testeEseloProperties = null;
	DeparaAsesComEseloProperties deparaAsesComEseloProperties = null;
	

	// private static String CSS_VALIDATOR_URL =
	// "http://www.css-validator.org/validator?uri=#{url}&warning=0&output=soap12";
	private static String CSS_VALIDATOR_URL = "http://jigsaw.w3.org/css-validator/validator?uri=#{url}&warning=0&output=soap12";
	// private static String HTML_VALIDATOR_URL =
	// "https://validator.w3.org/nu/?doc=#{url}&out=json";
	private static String HTML_VALIDATOR_URL = "https://validator.w3.org/check?uri=#{url}&output=json";

	private static String PROPERTIES_PATH = "/WEB-INF/deparaAsesComEselo.properties";
	private Properties properties = new Properties();

	private Integer retornaQuantidadeErrosAvisos(List<Entry<OccurrenceKey, List<Occurrence>>> mapaListaOcorrencias,	String recomendacao, String criterio) 
	{
		Iterator it = mapaListaOcorrencias.iterator();
		Integer qtdErros = 0;

		String recomendacaoCompara;
		String criterioCompara;
		boolean tipoErroCompara;

		while (it.hasNext()) {
			Entry<OccurrenceKey, List<Occurrence>> listaOcorrencias = (Entry) it.next();
			for (Occurrence ocorrencias : listaOcorrencias.getValue()) {

				recomendacaoCompara = ocorrencias.getCode();
				criterioCompara = ocorrencias.getCriterio();
				tipoErroCompara = ocorrencias.isError();

				if (recomendacao.equalsIgnoreCase(recomendacaoCompara) && criterio.equalsIgnoreCase(criterioCompara)) {
					qtdErros++;
				}
			}
		}

		return qtdErros;
	}

	
	private Integer retornarQuantidadeItens(Source documento, List<String> elementosBuscar, List<String> atributosBuscar, String tipoTeste)
	{
		Integer qtdItens = 0;
						
		if(tipoTeste.equalsIgnoreCase("e"))
		{
			for (String elementoBuscar : elementosBuscar) {
				
				qtdItens = qtdItens + documento.getAllElements(elementoBuscar).size();
			}
		}else if(tipoTeste.equalsIgnoreCase("a"))
		{
			for (Element element : documento.getAllElements()) {			
				for (String atributoBuscar : atributosBuscar) {
					 System.out.println(element.getAttributeValue(atributoBuscar));
					 qtdItens = qtdItens + (element.getAttributeValue(atributoBuscar)!= null?	1 : 0);
					
					}
				}		
		}else if(tipoTeste.equalsIgnoreCase("ea"))
		{
			for (String elementoBuscar : elementosBuscar) {
				for (Element element : documento.getAllElements(elementoBuscar)) {	
					for (String atributoBuscar : atributosBuscar) {
						 qtdItens = qtdItens + (element.getAttributeValue(atributoBuscar) != null? 1 : 0);
						}
					}
				}
		}else if(tipoTeste.equalsIgnoreCase("startTag"))
		{
			qtdItens = documento.getAllStartTags().size();
		}
						
		return qtdItens;
	}
	
	
	
	public Nota obterNotaEselo(Source documento, String url, List<Entry<OccurrenceKey, List<Occurrence>>> mapaListaOcorrencias) {
		Nota nota = null;
		
		List<String> elementosBuscar;
		List<String> atributosBuscar;
			
		List<RecomendacaoCriterios> lsRecomendacaoCriterios = new ArrayList<RecomendacaoCriterios>();
		RecomendacaoCriterios recomendacaoAdd;

		BufferedReader reader = testeEseloProperties.getListaTesteEselo();		
		String linha = "";
		String[] chaveValor;
		String recomendacaoProperties = "";
		String recomendacaoAntiga = ""; // Serve identificar a mudança de recomendação										
		String recomendacao = "";
		String criterioProperties = "";
		String criterio = "";
		String criterioAntido = "";
		String recomendacaoCriterio[];
		String tipoTeste = "";
		String tipoBusca = "";
		Integer totalLinhas = (documento != null? documento.toString().split("\n").length: 0);
		Integer qtdErrosAvisos = 0;
		Integer countReq = 0;
		Integer countCriterio = 0;
		Integer countChave = 0;
		Integer qtdItens = 0;
		Integer totalErros = 0;
		Integer totalAvisos = 0;
		Boolean isErro;		
		Boolean recomendacaoTemCriterio = false;

		try {

			WebChecker.PostParams postParams = WebChecker.from(this.eseloProperties.getUrl("url")).withPostRequest();

			// Relatorio de Avaliacao
			postParams.addParam("relatorioAvaliacao.date", new Date().toString()).addParam("relatorioAvaliacao.url", url);

			while ((linha = reader.readLine()) != null) {
				
				elementosBuscar = new ArrayList<String>();
				atributosBuscar = new ArrayList<String>();
				
				
				//Separa a chave do valor (tipo de teste)
				chaveValor = linha.split("\\=");

				//chave do arquivo testeEselo.properties sendo (x.y.z)
				recomendacaoCriterio = chaveValor[0].split("\\.");
				
				//Separa a recomendação do critério sendo (x.y) de (x.y.z)
				recomendacaoProperties = recomendacaoCriterio[0].toString() + "." + recomendacaoCriterio[1].toString();
				
				//Semara a critério da recomendação sendo (z) de (x.y.z)		
				criterioProperties = recomendacaoCriterio[2];
				
							
				if (!recomendacaoProperties.equalsIgnoreCase(recomendacaoAntiga) || recomendacaoAntiga.equalsIgnoreCase("")) {
					
					if(lsRecomendacaoCriterios.size() > 0)
					{												
						countReq++;					
						countCriterio = 0;
						postParams.addParam("relatorioAvaliacao.recomendacoes["+ countReq + "].idRecomendacao",	retornaRecomendacaoEselo(recomendacaoAntiga));
						
					for (RecomendacaoCriterios recCriterio : lsRecomendacaoCriterios) {
						countCriterio++;
						 postParams.addParam("relatorioAvaliacao.recomendacoes["+countReq+"].criterios["+countCriterio+"].idCriterio",recCriterio.criterio)
						 .addParam("relatorioAvaliacao.recomendacoes["+countReq+"].criterios["+countCriterio+"].qtdeErros", Integer.toString(recCriterio.qtdErros))
						 .addParam("relatorioAvaliacao.recomendacoes["+countReq+"].criterios["+countCriterio+"].qtdeItens",Integer.toString(recCriterio.qtdItens));
					}
						
						postParams.addParam("relatorioAvaliacao.recomendacoes[" + countReq+ "].totalErros", Integer.toString(totalErros));
						postParams.addParam("relatorioAvaliacao.recomendacoes[" + countReq+ "].totalAvisos", Integer.toString(totalAvisos));
						
						totalAvisos = 0;
						totalErros = 0;
						lsRecomendacaoCriterios = new ArrayList<RecomendacaoCriterios>();
					}
					
					
					
					recomendacaoAntiga = recomendacaoProperties;
					
				}

				// Fim adiciona a recomendação da lista do properties
				
				
				//Cria lista a ser pesquisada e retorna a quantidade de itens
				tipoTeste = chaveValor[1].toString();
				tipoBusca = chaveValor[3].toString();
				isErro = Boolean.parseBoolean(chaveValor[2]);
				
				if(!tipoTeste.equalsIgnoreCase("proporcional"))
				{
					tipoBusca = "startTag";
				}
				else
				{
				
				if(tipoBusca.equalsIgnoreCase("e"))
				{
					countChave= 0;
					
					for (String chave : chaveValor) {	
						if(countChave >= 3)
						{
							elementosBuscar.add(chave);
						}
						countChave++;
					}
				}else if(tipoBusca.equalsIgnoreCase("a"))
				{
					countChave= 0;
					for (String chave : chaveValor) {	
						if(countChave >= 3)
						{
							atributosBuscar.add(chave);	
						}
						countChave++;
					}
				}else if(tipoBusca.equalsIgnoreCase("ea"))
				{
					countChave= 0;
					for (String chave : chaveValor) {
						if(countChave >= 3)
						{
							if(chave.substring(0,1).equalsIgnoreCase("e"))
							{
								elementosBuscar.add(chave.substring(1,(chave.length())));	
							}
							else if(chave.substring(0,1).equalsIgnoreCase("a"))
							{
								atributosBuscar.add(chave.substring(1,(chave.length())));
							}
						}
						
						countChave++;						
					}
				} 
				}			
				//Fim Cria lista a ser pesquisada e retorna a quantidade de itens
				
				if(!tipoBusca.equalsIgnoreCase("1"))
				{
					qtdItens = retornarQuantidadeItens(documento, elementosBuscar, atributosBuscar,tipoBusca);
				}
				else
				{
					qtdItens = 1;
				}
				
				
				qtdErrosAvisos = retornaQuantidadeErrosAvisos(mapaListaOcorrencias, recomendacaoProperties, criterioProperties);
				
								
				// postParams.addParam("relatorioAvaliacao.recomendacoes["+countReq+"].criterios["+countCriterio+"].idCriterio",criterioProperties)
				// .addParam("relatorioAvaliacao.recomendacoes["+countReq+"].criterios["+countCriterio+"].qtdeErros", Integer.toString(qtdErrosAvisos))
				// .addParam("relatorioAvaliacao.recomendacoes["+countReq+"].criterios["+countCriterio+"].qtdeItens",Integer.toString(qtdItens));
				 
				if(isErro)
				{
					totalErros = totalErros + qtdErrosAvisos;
				}
				else
				{
					totalAvisos = totalAvisos + qtdErrosAvisos;
				}		
				
				recomendacaoAdd = new RecomendacaoCriterios();
				
				if(qtdItens > 0 || !tipoTeste.equalsIgnoreCase("proporcional"))
				{
				
				recomendacaoAdd.setCriterio(criterioProperties);
				recomendacaoAdd.setQtdErros(qtdErrosAvisos);
				recomendacaoAdd.setQtdItens(qtdItens);
				lsRecomendacaoCriterios.add(recomendacaoAdd);
				}
			
			}
			
			if(lsRecomendacaoCriterios.size() > 0)
			{												
				countReq++;					
				countCriterio = 0;
				postParams.addParam("relatorioAvaliacao.recomendacoes["+ countReq + "].idRecomendacao",	retornaRecomendacaoEselo(recomendacaoAntiga));
				
			for (RecomendacaoCriterios recCriterio : lsRecomendacaoCriterios) {
				countCriterio++;
				 postParams.addParam("relatorioAvaliacao.recomendacoes["+countReq+"].criterios["+countCriterio+"].idCriterio",recCriterio.criterio)
				 .addParam("relatorioAvaliacao.recomendacoes["+countReq+"].criterios["+countCriterio+"].qtdeErros", Integer.toString(recCriterio.qtdErros))
				 .addParam("relatorioAvaliacao.recomendacoes["+countReq+"].criterios["+countCriterio+"].qtdeItens",Integer.toString(recCriterio.qtdItens));
			}
				
				postParams.addParam("relatorioAvaliacao.recomendacoes[" + countReq+ "].totalErros", Integer.toString(totalErros));
				postParams.addParam("relatorioAvaliacao.recomendacoes[" + countReq+ "].totalAvisos", Integer.toString(totalAvisos));
				
				totalAvisos = 0;
				totalErros = 0;
				lsRecomendacaoCriterios = new ArrayList<RecomendacaoCriterios>();
				
			}
			//postParams.addParam("relatorioAvaliacao.recomendacoes[" + countReq+ "].totalErros", Integer.toString(totalErros));
			//postParams.addParam("relatorioAvaliacao.recomendacoes[" + countReq+ "].totalAvisos", Integer.toString(totalAvisos));
			postParams.addParam("relatorioAvaliacao.qtdeLinhas", Integer.toString(totalLinhas));
			
			Gson g = new GsonBuilder().create();
			nota = g.fromJson(postParams.execute().getContent(), Nota.class);
			
			
		} catch (IOException e) {

			e.printStackTrace();
		}

		return nota;

	}


	public Nota obterNota(List<SummarizedOccurrence> occurrences, String url,
			List<Entry<OccurrenceKey, List<Occurrence>>> mapaListaOcorrencias) {
		Nota nota = null;
		try {

			WebChecker.PostParams postParams = WebChecker.from(
					this.eseloProperties.getUrl("url")).withPostRequest();

			// Relatorio de Avaliacao
			postParams.addParam("relatorioAvaliacao.date",
					new Date().toString()).addParam("relatorioAvaliacao.url",
					url);

			TreeSet<Integer> rns = new TreeSet<Integer>();

			for (SummarizedOccurrence occurence : occurrences) {
				String[] idRec = occurence.getCheckPoint().split("\\.");
				rns.add(Integer.parseInt(idRec[0]));

			}

			int countReq = 1;
			int countCriterio = 1;
			int qtdLinhas = 0;

			

			/*
			 * for(Integer rn : rns){ //Recomendação Avaliada //
			 * postParams.addParam
			 * ("relatorioAvaliacao.recomendacoes["+countReq+"].idRecomendacao",
			 * Integer.toString((rn)));
			 * 
			 * int qtdErros = 0;
			 * 
			 * 
			 * 
			 * for(SummarizedOccurrence occurence : occurrences){ String[] idRec
			 * = occurence.getCheckPoint().split("\\.");
			 * 
			 * 
			 * qtdLinhas = qtdLinhas + occurence.getLines().size();
			 * 
			 * //CritÃ©rios
			 * 
			 * 
			 * 
			 * if(rn == Integer.parseInt(idRec[0])){ 
			 * 
			 * qtdErros = qtdErros + Integer.parseInt(occurence.isError()?occurence.getNumberOfOccurrences():"0");
			 * postParams.addParam("relatorioAvaliacao.recomendacoes["+countReq+"].criterios["+countCriterio+"].idCriterio",idRec[1])
			 * .addParam("relatorioAvaliacao.recomendacoes["+countReq+"].criterios["+countCriterio+"].qtdeErros",occurence.isError()?occurence.getNumberOfOccurrences():"0")
			 * .addParam("relatorioAvaliacao.recomendacoes["+countReq+"].criterios["+countCriterio+"].qtdeItens",Integer.toString(occurence.getLines().size()));
			 * 
			 * 
			 * }else countCriterio = 0;
			 * 
			 * countCriterio++; }
			 * 
			 * postParams.addParam("relatorioAvaliacao.recomendacoes["+countReq+"].totalErros", Integer.toString(qtdErros));
			 * //postParams.addParam("relatorioAvaliacao.qtdeLinhas",Integer.toString(qtdLinhas)); countReq++;
			 * 
			 * }
			 */

			postParams.addParam("relatorioAvaliacao.qtdeLinhas", Integer.toString(qtdLinhas));

			Gson g = new GsonBuilder().create();
			nota = g.fromJson(postParams.execute().getContent(), Nota.class);

		} catch (Exception e) {
			nota = new EseloController(null).new Nota(url, "---", "0.0");

		}

		return nota;

		/*
		 * Nota nota = null ; //Versï¿½o desenvolvida por Rodrigo try {
		 * WebChecker.PostParams postParams =
		 * WebChecker.from(CALCULAR_NOTA_REST).withPostRequest()
		 * .addParam("avaliationReport.url", url)
		 * .addParam("avaliationReport.date",
		 * "2014-04-24 10:07:02.447 GMT-03:00");
		 * 
		 * int index = 0; for(SummarizedOccurrence occurence : occurrences){
		 * postParams
		 * .addParam("avaliationReport.checkPoints["+index+"].identificador",
		 * occurence.getCheckPoint())
		 * .addParam("avaliationReport.checkPoints["+index+"].totalErrors",
		 * occurence.isError()?occurence.getNumberOfOccurrences():"0")
		 * .addParam("avaliationReport.checkPoints["+index+"].totalWarnings",
		 * ((!occurence.isError() &&
		 * !occurence.getNumberOfOccurrences().equals(SummarizedOccurrence
		 * .EMPTY_LINES) )?occurence.getNumberOfOccurrences():"0")); index++; }
		 * 
		 * System.out.println(this.eseloProperties.getUrl("url"));
		 * System.out.println(postParams.execute().getContent());
		 * 
		 * Gson g = new GsonBuilder().create(); nota =
		 * g.fromJson(postParams.execute().getContent(), Nota.class);
		 * 
		 * }catch(Exception e){ nota = new EseloController(null).new Nota(url,
		 * "---" , "0.0"); }
		 * 
		 * return nota;
		 */
	}

	// Passa a recomendação do Ases como chave e retorna a recomendação do Eselo
	// contida no deparaAsesComEselo.properties
	private String retornaRecomendacaoEselo(String recomendacaoAses) {
		String recomendacaoEselo;

		recomendacaoEselo = this.deparaAsesComEseloProperties
				.getRecomendacao(recomendacaoAses);

		return recomendacaoEselo;
	}

	public List<Entry<OccurrenceKey, List<Occurrence>>> retornarCriteriosTeste(
			Map<OccurrenceClassification, List<Occurrence>> resultadoAvaliacao) {

		Map<OccurrenceKey, Map<String, List<Occurrence>>> resultadoCriterios = new HashMap<OccurrenceKey, Map<String, List<Occurrence>>>();

		List<Map<String, List<Occurrence>>> testemapaCriterios = new ArrayList<Map<String, List<Occurrence>>>();

		List<Entry<OccurrenceKey, List<Occurrence>>> ocorrenciasPorRnTeste = new ArrayList<Map.Entry<OccurrenceKey, List<Occurrence>>>();

		for (Entry<OccurrenceClassification, List<Occurrence>> entrada : resultadoAvaliacao
				.entrySet()) {

			for (Entry<OccurrenceKey, List<Occurrence>> ocorrenciasPorRN : agruparOcorrenciaPorRN(
					entrada.getValue()).entrySet()) {

				if (resultadoCriterios.get(ocorrenciasPorRN.getKey()) == null)
					resultadoCriterios.put(ocorrenciasPorRN.getKey(),
							new HashMap<String, List<Occurrence>>());

				ocorrenciasPorRnTeste.add(ocorrenciasPorRN);

				Map<String, List<Occurrence>> mapaCriterios = resultadoCriterios
						.get(ocorrenciasPorRN.getKey());
				for (Occurrence ocorrencia : ocorrenciasPorRN.getValue()) {

					if (mapaCriterios.get(ocorrencia.getCriterio()) == null)
						mapaCriterios.put(ocorrencia.getCriterio(),
								new ArrayList<Occurrence>());

					mapaCriterios.get(ocorrencia.getCriterio()).add(ocorrencia);

				}

			}

		}

		return ocorrenciasPorRnTeste;
	}

	public Map<OccurrenceKey, Map<String, List<Occurrence>>> retornarCriterios(
			Map<OccurrenceClassification, List<Occurrence>> resultadoAvaliacao) {

		Map<OccurrenceKey, Map<String, List<Occurrence>>> resultadoCriterios = new HashMap<OccurrenceKey, Map<String, List<Occurrence>>>();

		for (Entry<OccurrenceClassification, List<Occurrence>> entrada : resultadoAvaliacao
				.entrySet()) {

			for (Entry<OccurrenceKey, List<Occurrence>> ocorrenciasPorRN : agruparOcorrenciaPorRN(
					entrada.getValue()).entrySet()) {

				if (resultadoCriterios.get(ocorrenciasPorRN.getKey()) == null)
					resultadoCriterios.put(ocorrenciasPorRN.getKey(),
							new HashMap<String, List<Occurrence>>());

				Map<String, List<Occurrence>> mapaCriterios = resultadoCriterios
						.get(ocorrenciasPorRN.getKey());
				for (Occurrence ocorrencia : ocorrenciasPorRN.getValue()) {

					if (mapaCriterios.get(ocorrencia.getCriterio()) == null)
						mapaCriterios.put(ocorrencia.getCriterio(),
								new ArrayList<Occurrence>());

					mapaCriterios.get(ocorrencia.getCriterio()).add(ocorrencia);

				}
			}

		}

		return resultadoCriterios;

	}

	private Map<OccurrenceKey, List<Occurrence>> agruparOcorrenciaPorRN(
			List<Occurrence> occurrences) {

		Map<OccurrenceKey, List<Occurrence>> map = new HashMap<OccurrenceKey, List<Occurrence>>();
		OccurrenceKey occurrenceKey = null;
		for (Occurrence occurrence : occurrences) {
			occurrenceKey = new OccurrenceKey(occurrence);

			if (map.get(occurrenceKey) == null) {
				map.put(occurrenceKey, new ArrayList<Occurrence>());
				map.get(occurrenceKey).add(occurrence);
			} else {
				map.get(occurrenceKey).add(occurrence);
			}

		}
		return map;
	}

	public int[] getErrorCount(boolean isCss, String url) {
		int errors = 0;
		int warnings = 0;

		try {
			if (isCss) {
				String content = WebChecker
						.from(CSS_VALIDATOR_URL.replace("#{url}", url))
						.withGetRequest().execute().getContent();
				Matcher m = Pattern.compile(
						"<m:errorcount>(\\d)*</m:errorcount>",
						Pattern.MULTILINE).matcher(content);
				if (m.find())
					errors = Integer.valueOf(m.group(0)
							.replace("<m:errorcount>", "")
							.replace("</m:errorcount>", ""));

				m = Pattern.compile("<m:warningcount>(\\d)*</m:warningcount>",
						Pattern.MULTILINE).matcher(content);

				if (m.find())
					warnings = Integer.valueOf(m.group(0)
							.replace("<m:warningcount>", "")
							.replace("</m:warningcount>", ""));

			} else {

				String content = WebChecker.from(HTML_VALIDATOR_URL.replace("#{url}", url)).withGetRequest().execute().getContent();
				Gson g = new GsonBuilder().create();
				HtmlValidation a = g.fromJson(content, HtmlValidation.class);
				int[] errorsWarnings = a.getQtdWarningsErros();
				errors = errorsWarnings[1];
				warnings = errorsWarnings[0];

			}
		} catch (Exception e) {
			errors = -10;
			warnings = -10;
			e.printStackTrace();
		}

		return new int[] { errors, warnings };
	}

	public static void main(String... arg) {
		int[] teste = new AvaliacaoBusinessImpl().getErrorCount(false, "http://www.agritempo.gov.br/agritempo/index.jsp");

		System.out.println("errors :" + teste[0]);
		System.out.println("warnings :" + teste[1]);
	}

	public static Map<OccurrenceClassification, List<Occurrence>> resultadoAvaliacao = new HashMap<OccurrenceClassification, List<Occurrence>>();

	static {
		Occurrence ocorrencia1 = new Occurrence(10, 5, "1", true, "<a hrf=\"#home\">Tag home completa</a>", OccurrenceClassification.MARK, "1");
		Occurrence ocorrencia2 = new Occurrence(55, 10, "1", false, "<a hrf=\"#home2\">Tag home completa 2</a>", OccurrenceClassification.MARK, "1");
		Occurrence ocorrencia3 = new Occurrence(60, 5, "2", true, "<h1>Teste</h1>", OccurrenceClassification.MARK, "2");
		Occurrence ocorrencia4 = new Occurrence(90, 10, "2", false, "<h2>Teste H2</h2>", OccurrenceClassification.MARK, "3");
		Occurrence ocorrencia5 = new Occurrence(115, 10, "1", false, "<a hrf=\"#home2\">Tag home completa 3</a>", OccurrenceClassification.MARK);
		List<Occurrence> ocorrenciasMarcacao = new ArrayList<Occurrence>();
		ocorrenciasMarcacao.add(ocorrencia1);
		ocorrenciasMarcacao.add(ocorrencia2);
		ocorrenciasMarcacao.add(ocorrencia3);
		ocorrenciasMarcacao.add(ocorrencia4);
		ocorrenciasMarcacao.add(ocorrencia5);

		Occurrence ocorrencia1Comportamento = new Occurrence(10, 5, "3", true, "<a hrf=\"#home\">Tag home completa</a>", OccurrenceClassification.BEHAVIOR, "1");
		Occurrence ocorrencia2Comportamento = new Occurrence(55, 10, "3", false, "<a hrf=\"#home2\">Tag home completa 2</a>", OccurrenceClassification.BEHAVIOR, "1");
		Occurrence ocorrencia3Comportamento = new Occurrence(60, 5, "3", true, "<h1>Teste</h1>", OccurrenceClassification.BEHAVIOR, "2");
		Occurrence ocorrencia4Comportamento = new Occurrence(90, 10, "4", false, "<h2>Teste H2</h2>", OccurrenceClassification.BEHAVIOR,
				"2");
		List<Occurrence> ocorrenciasComportamento = new ArrayList<Occurrence>();
		ocorrenciasComportamento.add(ocorrencia1Comportamento);
		ocorrenciasComportamento.add(ocorrencia2Comportamento);
		ocorrenciasComportamento.add(ocorrencia3Comportamento);
		ocorrenciasComportamento.add(ocorrencia4Comportamento);

		resultadoAvaliacao.put(OccurrenceClassification.MARK, ocorrenciasMarcacao);
		resultadoAvaliacao.put(OccurrenceClassification.BEHAVIOR, ocorrenciasComportamento);
	}

	public void initEseloProperties(ServletContext servletContext) {
		this.eseloProperties = new EseloProperties(servletContext);
		initDeparaAsesComEseloProperties(servletContext);
		initTesteEselo(servletContext);		
	}


	private void initTesteEselo(ServletContext servletContext) {
		this.testeEseloProperties = new TesteEseloProperties(servletContext);

	}

	public void initDeparaAsesComEseloProperties(ServletContext servletContext) {
		this.deparaAsesComEseloProperties = new DeparaAsesComEseloProperties(
				servletContext);
	}

	public class RecomendacaoCriterios {
		
		private String criterio;
		private Integer qtdErros;
		private Integer qtdItens;
		public String getCriterio() {
			return criterio;
		}
		public void setCriterio(String criterio) {
			this.criterio = criterio;
		}
		public Integer getQtdErros() {
			return qtdErros;
		}
		public void setQtdErros(Integer qtdErros) {
			this.qtdErros = qtdErros;
		}
		public Integer getQtdItens() {
			return qtdItens;
		}
		public void setQtdItens(Integer qtdItens) {
			this.qtdItens = qtdItens;
		}

		

	}
}
