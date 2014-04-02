<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:baseLayout>
   <jsp:body>
      <div class="tile --NOVALUE--">	
					<div class="outstanding-header">
						<h2 class="outstanding-title">Confirmação do Contato</h2>
					</div>
				</div>
			
				    <form method="get" action="${pageContext.request.contextPath}">   
					<fieldset>   
						<legend>Formulário de Confirmação do Contato</legend>
						<br>   
						<label for="nome">Nome:</label>   
						<input type="text" name="nome" id="nome" value="Higo Gomes" size="50" readonly="readonly"/>
						<br>
						<br>   
						<label for="nome">E-mail:</label >   
						<input type="text" name="email" id="email" value="higo.gomes@planejamento.gov.br" size="50" readonly="readonly"/> 
						<br>
						<br>  
						<label for="assunto">Assunto:</label>   
						<input type="text" name="assunto" id="assunto" value="informações" readonly="readonly"/>   
						</select>
						<br>
						<br>   
						<label for="msg">Mensagem:</label>   
						<textarea name="msg" id="msg" readonly="readonly">ghkljfhghsfklgshklgklsfjklslfsnlfnlfnlskkl</textarea> 
						<br>
						<br>  
						<a href="contato_preenchido.htm"><input type="button" name="corrigir" id="corrigir" value="Corrigir" /></a>
						<input type="submit" name="confirmar" id="confirmar" value="Confirmar" />   
					</fieldset>   
					</form>  
   </jsp:body>
</t:baseLayout>