<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<t:baseLayout>
	<jsp:body>

<div class="container">

	<div class="tile --NOVALUE--">
   		
   			<!-- ADICIONANDO ERROS -->
				<c:if test="${not empty errors}">
					<c:forEach items="${errors}" var="error">
						<div class="${error.category}">
						<div class="alinName">${error.message}</div>
					</div>
					<br />
					</c:forEach>				
				</c:if>
		</div>

	<div class="funcionalidades">
			<ul class="breadcrumb">
				<li>
				<span>Você está em: </span>
				</li>
				<li>ASES</li>
			
			</ul>
	</div>
	
	 <div class="outstanding-header">
	<h2 class="outstanding-title">Formas de Avaliação</h2>
	</div>
	
		<div class="containerTab">
		

   <div class="tab">
       <input type="radio" id="tab-1" name="tab-group-1"
						checked="checked">
     <label class="rarios" for="tab-1">Validação pela URI</label>
       
       <div class="contenteudo">
           <form name="form1" action="avaliar" method="post">
								<input type="hidden" name="mark" value="true">
								<input type="hidden" name="content" value="true">
								<input type="hidden" name="presentation" value="true">
								<input type="hidden" name="multimedia" value="true">
								<input type="hidden" name="form" value="true">
								<input type="hidden" name="behavior" value="true">
												  		
				
									<label class="" for="url">URL:</label><input id="url"
								name="url" value="http://" size="40" type="text">
									<input id="input_tab_1" class="submit" name="executar"
								value="Executar" type="submit">
								
							</form>
       </div> 
   </div>
    
   <div class="tab">
       <input type="radio" id="tab-2" name="tab-group-1">
       <label class="rarios" for="tab-2">Validação pelo upload de arquivo</label>
       
       <div class="contenteudo">
           <form name="form2" action="avaliar-arquivo" method="post"
							enctype="multipart/form-data">
								<input type="hidden" name="mark" value="true">
								<input type="hidden" name="content" value="true">
								<input type="hidden" name="presentation" value="true">
								<input type="hidden" name="multimedia" value="true">
								<input type="hidden" name="form" value="true">
								<input type="hidden" name="behavior" value="true">
								<input type="hidden" name="tiporel" value="html">
								
																	
										<label for="up_file">Arquivo:</label><input id="up_file"
								name="file" size="30" type="file">
										<input id="input_tab_2" class="submit" name="executar"
								value="Executar" type="submit">
								
							</form>
       </div> 
   </div>
    
    <div class="tab">
       <input type="radio" id="tab-3" name="tab-group-1">
       <label class="rarios" for="tab-3">Validação pelo código fonte</label>
     
       <div class="contenteudo">
       <form name="form3" action="avaliar-codigo" method="post"
							enctype="multipart/form-data">
								<input type="hidden" name="mark" value="true">
								<input type="hidden" name="content" value="true">
								<input type="hidden" name="presentation" value="true">
								<input type="hidden" name="multimedia" value="true">
								<input type="hidden" name="form" value="true">
								<input type="hidden" name="behavior" value="true">							
								
									
										<label for="input">Código a analisar:<br>
						<textarea id="input" name="html" rows="8" cols="75"></textarea>					</label>
										<br><input class="submit" name="executar"
								value="Executar" type="submit">
								
								</form>       

       </div> 
   </div>
    </div>
</div>
	
	
	</jsp:body>
</t:baseLayout>