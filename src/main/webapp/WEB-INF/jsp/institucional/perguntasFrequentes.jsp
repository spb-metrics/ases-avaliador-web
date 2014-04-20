<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:baseLayout>
   <jsp:body>
       <div class="tile --NOVALUE--">	
       		<c:if test="${not empty mensagem}">
				<div id="mensagem">
   					<div class="${status}"> <div class="alinName">${mensagem}</div></div>
				</div>
			</c:if>
			
			<div class="outstanding-header">
				<h2 class="outstanding-title">Perguntas Frequentes</h2>
			</div>
					
			<dt>
				<c:forEach var="perguntaFrequente" items="${perguntasFrequentes}">
					<dd class="summary"><strong><a href="#resp${perguntaFrequente.id}">${perguntaFrequente.pergunta}</a></strong></dd>
				</c:forEach> 	
			</dt>
		</div>
		
		<div class="tile --NOVALUE--">	
			<div class="outstanding-header">
				<h2 class="outstanding-title">Respostas Perguntas Frequentes</h2>
			</div>
			<dt>
				<c:forEach var="perguntaFrequente" items="${perguntasFrequentes}">
					<dd class="summary"><a name="resp${perguntaFrequente.id}"><i>${perguntaFrequente.resposta}</i></a></dd>
				</c:forEach> 
			</dt>
		</div>
   </jsp:body>
</t:baseLayout>