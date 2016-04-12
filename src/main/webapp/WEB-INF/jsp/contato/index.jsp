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
               	<li>|  Contato</li>
			</ul>
	   </div>
   
   
       <div class="tile --NOVALUE--">	
					<div class="outstanding-header">
						<h2 class="outstanding-title">Contato</h2>
					</div>
				</div>
					<c:if test="${not empty mensagem}">
						<div class="warning">
							<div class="alinName fonteWarning">${mensagem}</div>
						</div>
					</c:if>
					
					<c:forEach var="error" items="${errors}">  
   						<div class="warning">	
   							<div class="alinName fonteWarning">${error.message}</div>
   						</div>
   					</c:forEach>  
   				   				   				
				    <form method="post" action="${pageContext.request.contextPath}/contato/confirmacao">   
				    	<fieldset class="formContato">   
							<legend>Formulário de Contato</legend>
							<br>   
							<label id="labelNome" for="nome">Nome:</label>  
							<input type="text" name="contato.nome" value="${contato.nome}" id="nome" size="50"/>
							<br>
							<br>   
							<label id="labelEmail" for="email">E-mail:</label>   
							<input type="text" name="contato.email" value="${contato.email}" id="email" size="50"/> 
							<br>
							<br>  
							<label id="labelAssunto" for="assunto">Assunto:</label>
							<select name="contato.assunto"  id="assunto">
								<option value="" selected="selected">Selecione o assunto desejado</option>   
								<option value="Informações">Informações</option>   
								<option value="Sugestões">Sugestões</option>   
								<option value="Dúvidas">Dúvidas</option>     
							</select>
							<br>
							<br>   
							<label class="labelContato" for="mensagem">Mensagem:</label>   
							<textarea name="contato.mensagem" id="mensagem" cols="110" rows="8">${contato.mensagem}</textarea> 
							<br>
							<br>  
							<input type="submit" name="enviar" id="enviar" value="Enviar" class="bnt"/>   
						</fieldset>   
					</form>
					  
   </jsp:body>
</t:baseLayout>