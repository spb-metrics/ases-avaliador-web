<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:baseLayout>
   <jsp:body>
       <div class="tile --NOVALUE--">	
					<div class="outstanding-header">
						<h2 class="outstanding-title">Contato</h2>
					</div>
				</div>
					<c:if test="${not empty mensagem}">
						<div id="mensagem">
   							<div class="${status}"> <div class="alinName">${mensagem}</div></div>
						</div>
					</c:if>
					
					<c:forEach var="error" items="${errors}">  
   							<%-- <div class=" ${error.category}"> ${error.message}</div><br/> --%> 
   							<div class="${error.category}"> <div class="alinName">${error.message}</div></div>  
   					</c:forEach>  
   					
   					
   					
				    <form method="post" action="${pageContext.request.contextPath}/contato/confirmacao">   
					<fieldset>   
						<legend>Formulário de Contato</legend>
						<br>   
						<label for="nome">Nome:</label>   
						<input type="text" name="contato.nome" value="${contato.nome}" id="nome" size="50"/>
						<br>
						<br>   
						<label for="nome">E-mail:</label >   
						<input type="text" name="contato.email" value="${contato.email}" size="50"/> 
						<br>
						<br>  
						<label for="assunto">Assunto:</label>   
						<select name="contato.assunto"  id="assunto">
							<option value="" selected="selected">Selecione o assunto desejado</option>   
							<option value="informacoes">Informações</option>   
							<option value="sugestoes">Sugestões</option>   
							<option value="duvidas">Dúvidas</option>   
						</select>
						<br>
						<br>   
						<label for="msg">Mensagem:</label>   
						<textarea name="contato.mensagem" id="mensagem">${contato.mensagem}</textarea> 
						<br>
						<br>  
						<input type="submit" name="enviar" id="enviar" value="Enviar" class="bnt" />   
					</fieldset>   
					</form>  
   </jsp:body>
</t:baseLayout>