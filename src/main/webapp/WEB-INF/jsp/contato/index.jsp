<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:baseLayout>
   <jsp:body>
       <div class="tile --NOVALUE--">	
					<div class="outstanding-header">
						<h2 class="outstanding-title">Contato</h2>
					</div>
				</div>
			
				    <form method="post" action="${pageContext.request.contextPath}/contato/confirmacao">   
					<fieldset>   
						<legend>Formulário de Contato</legend>
						<br>   
						<label for="nome">Nome:</label>   
						<input type="text" name="nome" id="nome" size="50"/>
						<br>
						<br>   
						<label for="nome">E-mail:</label >   
						<input type="text" name="email" id="email" size="50"/> 
						<br>
						<br>  
						<label for="assunto">Assunto:</label>   
						<select name="assunto" id="assunto">
						<option value="0" selected="selected">Selecione o assunto desejado</option>   
						<option value="informacoes">Informações</option>   
						<option value="sugestoes">Sugestões</option>   
						<option value="duvidas">Dúvidas</option>   
						</select>
						<br>
						<br>   
						<label for="msg">Mensagem:</label>   
						<textarea name="msg" id="msg"></textarea> 
						<br>
						<br>  
						<input type="submit" name="enviar" id="enviar" value="Enviar" class="bnt" />   
					</fieldset>   
					</form>  
   </jsp:body>
</t:baseLayout>