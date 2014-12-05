<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<t:baseLayout>
   <jsp:body>
   		<div class="tile --NOVALUE--">
   		
   			<!-- ADICIONANDO ERROS -->
				<c:if test="${not empty errors}">
					<c:forEach items="${errors}" var="error">
						<div class="${error.category}"><div class="alinName">${error.message}</div></div><br/>
					</c:forEach>				
				</c:if>
   		
       		<div class="domtab">
						<ul class="domtabs">
							<li class=""><a href="#pri1">Validação pela URI</a></li>
							<li class=""><a href="#pri2">Validação pelo upload de arquivo</a></li>
							<li class=""><a href="#pri3">Validação pelo código fonte</a></li>
						</ul>
					
						<div style="display: block;">
							<a name="pri1" id="pri1"></a>
							
							<form name="form1" action="avaliar" method="post">
								<input type="hidden" name="mark" value="true">
								<input type="hidden" name="content" value="true">
								<input type="hidden" name="presentation" value="true">
								<input type="hidden" name="multimedia" value="true">
								<input type="hidden" name="form" value="true">
								<input type="hidden" name="behavior" value="true">
												  
								<fieldset>
									 <legend>Validação pela URI</legend>
									
									<%-- <p><label for="uri"> Exibir Resultado: </label>
									   <img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/html.png" alt="html" title="Gerar em HTML" height="20" width="20">
									   <input type="radio" name="tiporel" value="5" checked="checked">HTML
									   <img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/pdf.png" alt="pdf" title="Gerar em PDF" height="20" width="20">
									   <input type="radio" name="tiporel" value="4">PDF
									   <img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/odt.png" alt="odt" title="Gerar em ODT" height="20" width="20">
									   <input type="radio" name="tiporel" value="3">ODT
									   <img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/xls.png" alt="xls" title="Gerar em XLS" height="20" width="20">
									   <input type="radio" name="tiporel" value="2">XLS
									   <img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/doc-rtf.png" alt="xls" title="Gerar em RFT" height="20" width="20">
									   <input type="radio" name="tiporel" value="1">RTF
									</p> --%>
									<label for="uri">URL: <input id="url" name="url" value="http://" size="50" type="text"></label>
									<input class="submit" name="executar" value="Executar" type="submit">
								</fieldset>
							</form>
							
						</div>
					 
						<div style="display: none;">
							
							<a name="pri2" id="pri2"></a>
							
							<form name="form2" action="avaliar-arquivo" method="post" enctype="multipart/form-data">
								<input type="hidden" name="mark" value="true">
								<input type="hidden" name="content" value="true">
								<input type="hidden" name="presentation" value="true">
								<input type="hidden" name="multimedia" value="true">
								<input type="hidden" name="form" value="true">
								<input type="hidden" name="behavior" value="true">
								<input type="hidden" name="tiporel" value="html">
								
								<fieldset>
									<legend>Validação pelo upload de arquivo</legend>
									
										<%-- <p><label for="uri"> Exibir Resultado: </label>
										   <img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/html.png" alt="html" title="Gerar em HTML" height="20" width="20">
										   <input type="radio" name="tiprel" value="5" checked="checked">HTML
										   <img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/pdf.png" alt="pdf" title="Gerar em PDF" height="20" width="20">
										   <input type="radio" name="tiprel" value="4">PDF
										   <img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/odt.png" alt="odt" title="Gerar em ODT" height="20" width="20">
										   <input type="radio" name="tiprel" value="3">ODT
										   <img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/xls.png" alt="xls" title="Gerar em XLS" height="20" width="20">
										   <input type="radio" name="tiprel" value="2">XLS
										   <img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/doc-rtf.png" alt="xls" title="Gerar em RFT" height="20" width="20">
										   <input type="radio" name="tiprel" value="1">RTF
										</p> --%>
										<label for="up_file">Arquivo: <input id="up_file" name="file" size="30" type="file"></label>
										<input class="submit" name="executar" value="Executar" type="submit">
								</fieldset>
							</form>
					 
						</div>
					 
					
					
						<div style="display: none;">
						
							<a name="pri3" id="pri3"></a>
							
							<form name="form3" action="avaliar-codigo" method="post" enctype="multipart/form-data">
								<input type="hidden" name="mark" value="true">
								<input type="hidden" name="content" value="true">
								<input type="hidden" name="presentation" value="true">
								<input type="hidden" name="multimedia" value="true">
								<input type="hidden" name="form" value="true">
								<input type="hidden" name="behavior" value="true">
								
									<fieldset>
										 <legend>Validação pelo código fonte</legend>
										
										<%-- <p><label for="uri"> Exibir Resultado: </label>
										   <img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/html.png" alt="html" title="Gerar em HTML" height="20" width="20">
										   <input type="radio" name="tiporel" value="5" checked="checked">HTML
										   <img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/pdf.png" alt="pdf" title="Gerar em PDF" height="20" width="20">
										   <input type="radio" name="tiporel" value="4">PDF
										   <img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/odt.png" alt="odt" title="Gerar em ODT" height="20" width="20">
										   <input type="radio" name="tiporel" value="3">ODT
										   <img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/xls.png" alt="xls" title="Gerar em XLS" height="20" width="20">
										   <input type="radio" name="tiporel" value="2">XLS
										   <img src="${pageContext.request.contextPath}/inicial_arquivos/imagens/doc-rtf.png" alt="xls" title="Gerar em RFT" height="20" width="20">
										   <input type="radio" name="tiprel" value="1">RTF
										</p> --%>
										<label for="input">Código a analisar:<br><textarea id="input" name="html" rows="8" cols="75"></textarea>					</label>
										<input class="submit" name="executar" value="Executar" type="submit">
									</fieldset>
								</form>
					 
						</div>
					
					</div>
		</div>
   </jsp:body>
</t:baseLayout>