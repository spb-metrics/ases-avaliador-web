<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:baseLayout>
   <jsp:body>
       <div class="tile --NOVALUE--">	
				<div class="outstanding-header">
					<h2 class="outstanding-title">Perguntas Frequentes</h2>
				</div>
				<dt>
					<dd class="summary"><strong><a href="#resp1">Pergunta 1</a></strong></dd>
					<dd class="summary"><strong><a href="#resp2">Pergunta 2</a></strong></dd>
					<dd class="summary"><strong><a href="#resp3">Pergunta 3</a></strong></dd>
				</dt>
			</div>
			
			
			<div class="tile --NOVALUE--">	
				<div class="outstanding-header">
					<h2 class="outstanding-title">Respostas Perguntas Frequentes</h2>
				</div>
				<dt>
					<dd class="summary"><a name="resp1"><i>Respota pergunta 1</i></a></dd>
					<dd class="summary"><a name="resp2"><i>Respota pergunta 2</i></a></dd>
					<dd class="summary"><a name="resp3"><i>Respota pergunta 3</i></a></dd>
				</dt>
			</div>
   </jsp:body>
</t:baseLayout>