
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:baseLayout>
   <jsp:body>
       <div class="funcionalidades">
			<ul class="breadcrumb">
				<li>
					<span>Você está em:</span>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}">Página Inicial  |</a>
				</li>
        		<li>Acessibilidade</li>
			</ul>
		</div>
   
   
       <div class="tile --NOVALUE--">	
				<div class="outstanding-header">
					<h2 class="outstanding-title">Acessibilidade</h2>
				</div>
				
				<p class="documentDescription">
					Este portal segue as diretrizes do eMAG (Modelo de Acessibilidade em Governo Eletrônico), conforme as normas do Governo Federal, em obediência ao Decreto nº 5.296, de 2 de Dezembro de 2004.</p>
				
				<div id="content-core">
				
					<p>O termo acessibilidade significa incluir a pessoa com deficiência na participação de atividades como o uso de produtos, serviços e informações. Alguns exemplos são os prédios com rampas de acesso para cadeira de rodas e banheiros adaptados para deficientes.</p>
					<p>Na internet, acessibilidade refere-se principalmente às recomendações do WCAG (<span lang="en">World Content Accessibility Guide</span>) do W3C (<span lang="en">World Wide Web Consortium</span>) e no caso do Governo Brasileiro ao eMAG (Modelo de Acessibilidade em Governo Eletrônico). O eMAG está alinhado as recomendações internacionais, mas estabelece padrões de comportamento acessível para sítios governamentais.</p>
										
					<p>Na parte superior do portal existe uma barra de acessibilidade onde se encontra atalhos de navegação padronizados e a opção para alterar o contraste. Essas ferramentas estão disponíveis em todas as páginas do portal.</p>
		
					<p>Os atalhos padrões do governo federal são:</p>
			
		            <ul>
		            
						<li>Teclando-se Alt + 1 em qualquer página do portal, chega-se diretamente ao começo do conteúdo principal da página.</li>
					
						<li>Teclando-se Alt + 4 em qualquer página do portal, chega-se diretamente ao rodapé do sítio.</li>
		
		            </ul>	
						
					
					<p>Esses atalhos valem para o navegador Chrome, mas existem algumas variações para outros navegadores.</p>
		
					<p>Quem prefere utilizar o Internet Explorer é preciso apertar o botão Enter do seu teclado após uma das combinações acima.</p>
					
					<p>No caso do Firefox, em vez de Alt + número, tecle simultaneamente Alt + Shift + número.</p>
		
					<p>Sendo Firefox no Mac OS, em vez de Alt + Shift + número, tecle simultaneamente Ctrl + Alt + número.</p>
		
					<p>No Opera, as teclas são Shift + Escape + número. Ao teclar apenas Shift + Escape, o usuário encontrará uma janela  com todas as alternativas de ACCESSKEY da página.</p>
		
					<p>Ao final desse texto, você poderá baixar alguns arquivos que explicam melhor o termo acessibilidade e como deve ser implementado nos sítios da Internet.</p>
			
				</div>
				
			<hr class="hr_linhaDupla">						
			<div class="outstanding-header">
				<h2 class="outstanding-title">Leis e decretos sobre acessibilidade</h2>
			</div>
					
			<ul>
				<li><a class="external-link" href="http://www.planalto.gov.br/ccivil_03/_Ato2004-2006/2004/Decreto/D5296.htm">Decreto nº 5.296, de 02 de Dezembro de 2004 (link para um novo sítio)</a></li>
				<li><a href="http://www.planalto.gov.br/ccivil_03/_ato2007-2010/2009/decreto/d6949.htm">Decreto nº 6.949, de 25 de Agosto de 2009 - Promulga a Convenção Internacional sobre os Direitos das Pessoas com Deficiência e seu Protocolo Facultativo, assinados em Nova York, em 30 de Março de 2007 (link para um novo sítio)</a></li>
				<li><a href="http://www.planalto.gov.br/ccivil_03/_ato2011-2014/2012/Decreto/D7724.htm">Decreto nº 7.724, de 16 de Maio de 2012 - Regulamenta a Lei nº 12.527, que dispõe sobre o acesso a informações (link para um novo sítio)</a></li>
				<li><a class="external-link" href="http://www.governoeletronico.gov.br/acoes-e-projetos/eMAG">Modelo de Acessibilidade de Governo Eletrônico (link para um novo sítio)</a></li>
				<li><a href="http://www.governoeletronico.gov.br/biblioteca/arquivos/portaria-no-03-de-07-05-2007">Portaria nº 03, de 07 de Maio de 2007 - Institucionaliza o Modelo de Acessibilidade em Governo Eletrônico – eMAG (formato .pdf - 36 Kb)</a></li> 
			    <li><a href="http://www.planalto.gov.br/ccivil_03/_Ato2015-2018/2015/Lei/L13146.htm">Lei nº 13.146, de 6 de Julho de 2015 - Institui a Lei Brasileira de Inclusão da Pessoa com Deficiência (link para um novo sítio)</a></li>
			    <li><a href="http://www.planalto.gov.br/ccivil_03/_ato2011-2014/2012/Decreto/D7724.htm">Decreto nº 7.724, de 16 de Maio de 2012 - Regulamenta a Lei nº 12.527, que dispõe sobre o acesso a informações (link para um novo sítio)</a></li>
			    <li><a href="http://www.planalto.gov.br/ccivil_03/_ato2011-2014/2011/lei/l12527.htm">Lei nº 12.527, de 18 de Novembro de 2011 - Lei de Acesso à Informação (link para um novo sítio)</a></li>
			</ul>
			
			<hr class="hr_linhaDupla">			
			<div class="outstanding-header">
				<h2 class="outstanding-title">Dúvidas, sugestões e críticas</h2>
			</div>
			
			<p>No caso de problemas com a acessibilidade do portal, favor <a class="external-link" href="${pageContext.request.contextPath}/contato" >entrar em contato</a>.</p>	
			
			<hr class="hr_linhaDupla">
			<div class="outstanding-header">
				<h2 class="outstanding-title">Dicas, links e recursos úteis</h2>
			</div>
			
			<ul>
				<li><a class="external-link" href="http://www.acessibilidadelegal.com/" target="_self" title="">Acessibilidade Legal (link para um novo sítio)</a></li>
				<li><a class="external-link" href="http://www.acessodigital.net/links.html" target="_self" title="">Acesso Digital (link para um novo sítio)</a></li>
			</ul>
		</div>	
   </jsp:body>
</t:baseLayout>