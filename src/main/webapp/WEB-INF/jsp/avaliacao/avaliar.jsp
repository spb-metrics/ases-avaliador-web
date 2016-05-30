<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:baseLayout>
	<jsp:body>
	
<div class="tile --NOVALUE--">
   		
   			<!-- Adicionando avisos(erros) da ferramenta de verificação da sintaxe html e css  -->
				<c:if test="${not empty avisosFerramentasHtmlCssW3c}">
					<c:forEach items="${avisosFerramentasHtmlCssW3c}" var="error">
						<div class="warning">
						<div class="alinName">${error}</div>
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
			<li><a href="${pageContext.request.contextPath}">ASES</a></li>
	
			<li>|  Resumo de avaliação</li>
			
		</ul>
	</div>
    
    
				
    <div class="tile --NOVALUE--">	
		<div class="outstanding-header">
			<h2 class="outstanding-title">Página Avaliada</h2>
		</div>
		
		<c:if test="${not empty url}">
			<strong>Página:</strong> ${url} <br>
		</c:if>
		<strong>Título:</strong> ${titulosite} <br>
		<strong>Tamanho:</strong> ${contentLenght} Bytes <br>
		<strong>Data/Hora:</strong> ${data}
    </div>
    
     <br>
    <div class="tile --NOVALUE--">	
		<div class="outstanding-header" id="notaResumo">		
			<h2 class="outstanding-title">${mensagem_avaliacao}</h2>
		</div>
				
		<div class="row" data-layout-type="row">
		
			<div class="cell width-5 position-2 ${sem_nota}" data-panel="">
				<div id="block">
					<div id="webaxscore" class="scoreB_${webaxscore}">Porcentagem
						<strong>ASES</strong>
						<span>${nota.valor}%</span>
					</div>
				</div>
			</div>
			
			<div class="cell width-7 position-6">
			<table id="tabelaErros${sem_nota}">
				<caption class="tabelaErros">Resumo de Acessibilidade por Seção eMAG</caption>
					<thead>					
						<tr>
							<th id="secao" class="topo">Seção</th>
							<th id="erro" class="topo imgErro"><span>Erro(s)</span></th>
							<th id="aviso" class="topo imgAviso"><span>Aviso(s)</span> </th>
						</tr>
					</thead>
							
					<tfoot>
						<tr id="total">
							<td headers="secao" class="topo">Total</td>
							<td headers="erro" class="topo">${totalErros}</td>
							<td headers="aviso" class="topo">${totalAvisos}</td>
						</tr>
					</tfoot>
							
					<tbody>
						<c:forEach items="${listaResumo}" var="resumo">
							<tr>
							<c:choose>
							<c:when test="${resumo.tipo.description == 'Marcação'}">
								<td headers="secao" class="celula"><a id="#tab-1" href="#inicio_mark">${resumo.tipo.description}</a></td>								
							</c:when>
							<c:when test="${resumo.tipo.description == 'Comportamento'}">
								<td headers="secao" class="celula"><a id="#tab-2"  href="#inicio_behavior">${resumo.tipo.description}</a></td>								
							</c:when>
							<c:when test="${resumo.tipo.description == 'Conteúdo/Informação'}">
								<td headers="secao" class="celula"><a id="#tab-3"  href="#inicio_information">${resumo.tipo.description}</a></td>								
							</c:when>
							<c:when test="${resumo.tipo.description == 'Apresentação / Design'}">
								<td headers="secao" class="celula"><a id="#tab-4"  href="#inicio_presentation">${resumo.tipo.description}</a></td>								
							</c:when>
								<c:when test="${resumo.tipo.description == 'Multimídia'}">
								<td headers="secao" class="celula"><a id="#tab-5"  href="#inicio_multimedia">${resumo.tipo.description}</a></td>								
							</c:when>								
								<c:when test="${resumo.tipo.description == 'Formulários'}">
								<td headers="secao" class="celula"><a id="#tab-6"  href="#inicio_form">${resumo.tipo.description}</a></td>								
							</c:when>
							</c:choose>
								<td headers="erro" class="celula">${resumo.quantidadeErros}</td>
								<td headers="aviso" class="celula">${resumo.quantidadeAvisos}</td>
							</tr>
						</c:forEach>
					</tbody>							
			</table> 
		</div>
		</div>

	</div>
	<div id="corpo">
	<br>
	<hr class="hr_linhaDupla">
	<h2 class="outstanding-title">Resumo de Acessibilidade por recomendações do eMAG</h2>
	
<div class="containerAvaliacao">

   <div class="tabAvaliacao">
       <input type="radio" id="tab-1" name="tab-group-1" checked="checked">
     <label class="rariosAvaliacao" for="tab-1">Marcação</label>
       
       <div class="contenteudoAvaliacao">
				<t:listaResultado cssClass="mark" lista="${LISTA_MARK}" />			
       </div> 
            
   </div>
   
   <div class="tabAvaliacao">
       <input type="radio" id="tab-2" name="tab-group-1">
       <label class="rariosAvaliacao" for="tab-2">Comportamento</label>
       
       <div class="contenteudoAvaliacao">
				<t:listaResultado cssClass="behavior" lista="${LISTA_BEHAVIOR}" />        
       </div> 
   </div>
    
    <div class="tabAvaliacao">
       <input type="radio" id="tab-3" name="tab-group-1">
       <label class="rariosAvaliacao" for="tab-3">Conteúdo/Informação</label>
     
       <div class="contenteudoAvaliacao">
				<t:listaResultado cssClass="information"
							lista="${LISTA_CONTENT_INFORMATION}" />
       </div> 
   </div>
   
     <div class="tabAvaliacao">
       <input type="radio" id="tab-4" name="tab-group-1">
       <label class="rariosAvaliacao" for="tab-4">Apresentação / Design</label>
       
       <div class="contenteudoAvaliacao">
				<t:listaResultado cssClass="presentation"
							lista="${LISTA_PRESENTATION_DESIGN}" />      
       </div> 
   	</div>
  
     <div class="tabAvaliacao">
       		<input type="radio" id="tab-5" name="tab-group-1">
       		<label class="rariosAvaliacao" for="tab-5">Multimídia</label>
       
       		<div class="contenteudoAvaliacao">
				<t:listaResultado cssClass="multimedia" lista="${LISTA_MULTIMEDIA}" />       
         	</div>
       </div>        
       
        <div class="tabAvaliacao">
       		<input type="radio" id="tab-6" name="tab-group-1">
       		<label class="rariosAvaliacao" for="tab-6">Formulários</label>
       
       		<div class="contenteudoAvaliacao">    
     			<t:listaResultado cssClass="form" lista="${LISTA_FORM}" />
       		</div> 
   		</div>
	
</div>
<br>
		<hr class="hr_linhaDupla">
		
		<h2 class="outstanding-title">Aviso</h2>


<p>Avaliação tem por base testes automáticos em código-fonte (X)HTML interpretados do <a href="http://emag.governoeletronico.gov.br/">Modelo de Acessibilidade em Governo Eletrônico (eMAG) (link para novo sítio)</a>. </p>

<p>Lembrar que nota não contempla os itens classificados como avisos e os itens passíveis de avaliação humana. Para saber quais testes são contemplados pelo software, <a href="${pageContext.request.contextPath}/criteriosSucesso">favor verificar os critérios de sucesso trabalhados pelo ASESWEB</a>.</p> 
	
		<hr class="hr_linhaDupla">
	<h2 class="outstanding-title">Exportar Resultado</h2>
      <form name="form1" action="relatorioavaliacao" method="post">
			<fieldset>
					<legend>
						Tipos de Exportação
					</legend>
				   <br>
				   
					
							<div id="pdf">		
							<input type="radio" id="tiporel" name="tiporel" value="4" checked="checked"><label for="tiporel">PDF</label>
							<input id="url" name="url" value="${url}" type="hidden">
					   		<input class="submit" name="executar" value="Executar" type="submit">
							</div>
					   
					 
				
			</fieldset>
	</form>
	
		</div>

	</jsp:body>
</t:baseLayout>