<%@ page  contentType="text/html; charset=UTF-8"  %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:baseLayout>
   <jsp:body>
   
      <form name="form1" action="relatorioavaliacao" method="post">
			<fieldset>
				 <legend>Exportar Resultado</legend>
					 <p>
					   <label for="uri"></label>
					   <img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/pdf.png" alt="pdf" title="Gerar em PDF" height="20" width="20">
					   <input type="radio" name="tiporel" value="4">PDF
					   <img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/odt.png" alt="odt" title="Gerar em ODT" height="20" width="20">
					   <input type="radio" name="tiporel" value="3">ODT
					   <img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/xls.png" alt="xls" title="Gerar em XLS" height="20" width="20">
					   <input type="radio" name="tiporel" value="2">XLS
					   <img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/doc-rtf.png" alt="xls" title="Gerar em RFT" height="20" width="20">
					   <input type="radio" name="tiporel" value="1">RTF
					
					   <label for="uri"><input id="url" name="url" value="${url}" size="50" type="hidden"></label>
					   <input class="submit" name="executar" value="Executar" type="submit">
					</p>
			</fieldset>
		</form>
   
      <div class="tile --NOVALUE--">	
		<div class="outstanding-header">
			<h2 class="outstanding-title">Página avaliada</h2>
		</div>
		<p>
		<c:if test="${not empty url}">
			<strong>Página:</strong> ${url}
			<br>
		</c:if>
		<strong>Título:</strong> ${titulosite}
		<br>
		<strong>Tamanho:</strong> ${contentLenght} Bytes  
		<br>
		<strong>Data/Hora:</strong> ${data}
     </div>
     
     <div class="tile --NOVALUE--">	
			<div class="outstanding-header">
				<h2 class="outstanding-title">Nota e Resumo da Avaliação de Acessibilidade</h2>
			</div>
				<p></p>
				<p></p>
				<div class="row" data-layout-type="row">
					<div class="cell width-5 position-2 " data-panel="">
						<div id="block">
							<div id="webaxscore" class="scoreB">Porcentagem
								<strong>ASES</strong>
								<span>${nota.valor}%</span>
							</div>
						</div>
					</div>
					<div class="cell width-7 position-6 " data-panel="">
						<table id="tabelaErros">
							<tbody>
							<tr>
								<td class="topo">Seção</td>
								<td class="topo"><img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/stop.gif" alt="erro" height="20" width="20"> Erro(s) </td>
								<td class="topo"><img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/alert.gif" alt="alerta" height="19" width="20"> Avisos </td>
							</tr>
							<c:forEach items="${listaResumo}" var="resumo">
								<tr>
									<td class="celula">${resumo.tipo.description}</td>
									<td class="celula">${resumo.quantidadeErros}</td>
									<td class="celula">${resumo.quantidadeAvisos}</td>
								</tr>
							</c:forEach>
							</tbody>
							<tfoot>
								<td class="topo">Total</td>
								<td class="topo">${totalErros}</td>
								<td class="topo">${totalAvisos}</td>
							</tfoot>
						</table> 
					</div>
				
				</div>
						
			</div>
			
			
			<div class="tile --NOVALUE--">
				<div class="outstanding-header">
    		    <!-- 	 -->
				</div>
					<div class="domtab">

						<ul class="domtabs">
							<li class=""><a href="#pri1">Marcação</a></li>
							<li class=""><a href="#pri2">Comportamento</a></li>
							<li class=""><a href="#pri3">Conteúdo / Informação</a></li>
							<li class=""><a href="#pri4">Apresentação / Design</a></li>
							<li class=""><a href="#pri5">Multimídia</a></li>
							<li class=""><a href="#pri6">Formulários</a></li>
						</ul>
					
						<div style="display: block;">
							<a name="pri1" id="pri1"></a>
							<t:listaResultado cssClass="mark" lista="${LISTA_MARK}"/>
						</div>
					 
					
						<div style="display: none;">
							
							<a name="pri2" id="pri2"></a>
							<t:listaResultado cssClass="behavior" lista="${LISTA_BEHAVIOR}"/>
						</div>
					 
					
						<div style="display: none;">
						
							<a name="pri3" id="pri3"></a>
							<t:listaResultado cssClass="information" lista="${LISTA_CONTENT_INFORMATION}"/>
						</div>
					 
						<div style="display: none;">
							<a name="pri4" id="pri4"></a>
							<t:listaResultado cssClass="presentation" lista="${LISTA_PRESENTATION_DESIGN}"/>
						</div> 
					 
						<div style="display: none;">
							<a name="pri5" id="pri5"></a>
							<t:listaResultado cssClass="multimedia" lista="${LISTA_MULTIMEDIA}"/>
						</div>
					 
						<div style="display: none;">
							<a name="pri6" id="pri6"></a>
							<t:listaResultado cssClass="form" lista="${LISTA_FORM}"/>
						</div>
					 
					</div>

			</div>
       		
       		
       		
       		
   </jsp:body>
</t:baseLayout>