package br.com.ases.model.utilities;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import br.com.ases.model.entity.RelatorioAvaliacaoJasper;
import br.com.checker.emag.SummarizedOccurrence;
import net.sf.jasperreports.engine.JRAbstractExporter;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRCsvExporter;
import net.sf.jasperreports.engine.export.JRCsvExporterParameter;
import net.sf.jasperreports.engine.export.JRRtfExporter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.oasis.JROdtExporter;

public class ManagerReport {
	String pathTemplate = null;
	
	public ManagerReport(String path){
		this.pathTemplate = path;
	}
	
	public String gerarRelatorio(List list, HashMap<String, Object> map, int tipoRelatorio) throws JRException{
		
		JasperReport report = JasperCompileManager.compileReport(this.pathTemplate);
		
		JasperPrint print = JasperFillManager.fillReport(report, map,new JRBeanCollectionDataSource(
				this.criterioOrdenacao(Ordenacao.ordenarLista(this.carregarBean(list),null)))
				);
		
		//JasperPrint print = JasperFillManager.fillReport(report, map,new JRBeanCollectionDataSource(Ordenacao.ordenarLista(this.carregarBean(list),null)));
		
		return this.getRelatorio(print, tipoRelatorio);
	}
	
	
   public String gerarRelatorioDetalhesAvaliacao(List<String> criterios, HashMap<String, Object> map, int tipoRelatorio) throws JRException{
		
		JasperReport report = JasperCompileManager.compileReport(this.pathTemplate);
		JasperPrint print = JasperFillManager.fillReport(report, map,new JRBeanCollectionDataSource(criterios));		
	   
		return  this.getRelatorio(print, tipoRelatorio);
   }

   private String getRelatorio(JasperPrint print, int tipoRelatorio) throws JRException{
    	
    	File out = null;
		
		try {	
			switch (tipoRelatorio) {
				case 1://Export RTF
					JRAbstractExporter exporterRtf = new JRRtfExporter();                 
					exporterRtf.setParameter(JRExporterParameter.CHARACTER_ENCODING, "UTF-8");                  
					exporterRtf.setParameter(JRExporterParameter.JASPER_PRINT, print); 
					out = File.createTempFile("output.", ".rtf");
					exporterRtf.setParameter(JRExporterParameter.OUTPUT_STREAM, new FileOutputStream(out));   
					exporterRtf.exportReport();
				break;
				case 2://Export XLS
					JRXlsExporter exporterXls = new JRXlsExporter();
					exporterXls.setParameter(JRExporterParameter.JASPER_PRINT, print);
					exporterXls.setParameter(JRExporterParameter.IGNORE_PAGE_MARGINS, true);
					out = File.createTempFile("output.", ".odt");
					exporterXls.setParameter(JRExporterParameter.OUTPUT_STREAM, new FileOutputStream(out));
					exporterXls.exportReport();
				break;
				case 3://Export ODT
					JROdtExporter exporterODT = new JROdtExporter();
				    exporterODT.setParameter(JRExporterParameter.JASPER_PRINT, print);
				    exporterODT.setParameter(JRExporterParameter.IGNORE_PAGE_MARGINS, true);
				    out = File.createTempFile("output.", ".odt");
					exporterODT.setParameter(JRExporterParameter.OUTPUT_STREAM, new FileOutputStream(out));
					exporterODT.exportReport();
				break;
				case 5://Export CSV
					JRCsvExporter csvExporter = new JRCsvExporter();
					csvExporter.setParameter(JRCsvExporterParameter.FIELD_DELIMITER, ",");
					csvExporter.setParameter(JRCsvExporterParameter.CHARACTER_ENCODING, "UTF-8");
					csvExporter.setParameter(JRCsvExporterParameter.RECORD_DELIMITER, ",");
					csvExporter.setParameter(JRCsvExporterParameter.JASPER_PRINT, print);
					csvExporter.setParameter(JRCsvExporterParameter.IGNORE_PAGE_MARGINS, true);
					out = File.createTempFile("output.", ".csv");
					csvExporter.setParameter(JRExporterParameter.OUTPUT_STREAM, new FileOutputStream(out));
					csvExporter.exportReport();
				break;
				default:
					out = File.createTempFile("output.", ".pdf");
					JasperExportManager.exportReportToPdfStream(print, new FileOutputStream(out));
				break;
				
			}
		
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return out.getAbsolutePath();
    } 
	
	private List carregarBean(List <SummarizedOccurrence> list){
		List<RelatorioAvaliacaoJasper> listaImpressao = new ArrayList<RelatorioAvaliacaoJasper>();
		for(SummarizedOccurrence occurrence : list){
	
			RelatorioAvaliacaoJasper relatorioAvaliacao = new RelatorioAvaliacaoJasper();
			relatorioAvaliacao.setGrupo(occurrence.getType().getDescription());
			relatorioAvaliacao.setTipoErro(occurrence.isError() == false ? "Aviso" : "Erro");
			int num = occurrence.getStringLines().split(",").length;
			
			relatorioAvaliacao.setQuantidade(num);
			relatorioAvaliacao.setlinhasCodigo(occurrence.getStringLines());
			relatorioAvaliacao.setRecomendacao(occurrence.getCheckPoint()+" - "+occurrence.getDescription());
			
			listaImpressao.add(relatorioAvaliacao);
			num = 0;
			
		}
		
		return listaImpressao;
	}
	
	private List criterioOrdenacao(List <RelatorioAvaliacaoJasper> list){
		List<RelatorioAvaliacaoJasper> listaImpressao = new ArrayList<RelatorioAvaliacaoJasper>();
		
		String[] grupos = {"Marcação", "Comportamento", "Conteúdo/Informação", "Apresentação / Design", "Multimídia", "Formulários"};
		
		for(String grupo : grupos){
			for(RelatorioAvaliacaoJasper relatorioAvaliacaoJasper : list){
				if(relatorioAvaliacaoJasper.getGrupo().equalsIgnoreCase(grupo))
					listaImpressao.add(relatorioAvaliacaoJasper);
			}	
		}
		
		return listaImpressao;
	}
}