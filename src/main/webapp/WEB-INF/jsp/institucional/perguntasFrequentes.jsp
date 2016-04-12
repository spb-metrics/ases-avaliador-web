<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<t:baseLayout>
   <jsp:body>
       <div class="funcionalidades"> 
	   		<ul class="breadcrumb">
				<li>
					<span>Você está em:</span>
				</li>
				<li>
					<li><a href="${pageContext.request.contextPath}">ASES</a></li>
				</li>
               	<li>|  Perguntas Frequentes</li>
			</ul>
	   </div>
   
       <div class="tile --NOVALUE--">	
       		<c:if test="${not empty mensagem}">
				<div id="mensagem">
   					<div class="${status}"> <div class="alinName">${mensagem}</div></div>
				</div>
			</c:if>
			
			<div class="outstanding-header">
				<h2 class="outstanding-title">Perguntas Frequentes</h2>
			</div>
		</div>
					
		<ul id="perguntas" class="perguntasRespostas">
			<c:forEach var="perguntaFrequente" items="${perguntasFrequentes}">
				<li><strong><a href="#resp${perguntaFrequente.id}">${perguntaFrequente.pergunta}</a></strong></li>
			</c:forEach> 	
		</ul>
		
		
		<hr class="hr_linhaDupla">
		<div class="tile --NOVALUE--">	
			<div class="outstanding-header">
				<h2 class="outstanding-title">Respostas Perguntas Frequentes</h2>
			</div>
		</div>
		    <ul id="respostas" class="perguntasRespostas">
				<c:forEach var="perguntaFrequente" items="${perguntasFrequentes}">
					<li><a name="resp${perguntaFrequente.id}" id="resp${perguntaFrequente.id}"><i>${perguntaFrequente.resposta}</i></a></li>
				</c:forEach> 
		    </ul>
		
   </jsp:body>
</t:baseLayout>