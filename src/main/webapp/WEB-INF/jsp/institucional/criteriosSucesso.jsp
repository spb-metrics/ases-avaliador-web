
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:baseLayout>
	<jsp:body> 
       	       	      
       	      		 <div class="funcionalidades">
						<ul class="breadcrumb">
							<li>
								<span>Você está em:</span>
							</li>							
								<li>
								<a href="${pageContext.request.contextPath}">ASES</a>
								</li>
							
               				<li>|  Critérios de Sucesso</li>
						</ul>
					</div>
				    
				  	<div class="tile --NOVALUE--">
						<div class="outstanding-header">
							<h2 class="outstanding-title">Critérios de Avaliação</h2>
						</div>
					</div>
									
					<p class="criterios">
					As recomendações de acessibilidade foram desmembradas em critérios de avaliação. 
					Para cada critério de avaliação das recomendações foram estabelecidos parâmetros de acordo com a sua natureza.</p>
								
								
					<hr class="hr_linhaDupla">			
				    <h3 class="subtitulo">Recomendação 1.1 - Respeitar os padrões <span lang="en">Web</span></h3>
				    
				    <p class="criterios">
				    Os padrões <span lang="en">Web</span> são recomendações do W3C (<span lang="en">World Wide Web Consortium</span>), as quais
				    são destinadas a orientar os desenvolvedores para o uso de boas práticas que tornam a
				    <span lang="en">web</span> acessivel para todos, permitindo assim que os desenvolvedores criem experiências
				    ricas, alimentadas por um vasto armazenamento de dados, os quais estão disponiveis
				    para qualquer dispositivo e compatíveis com atuais e futuros agentes de usuário (ex: navegadores).</p>
				    
				    
				    <table class="tabelaCriterioSucesso">
				    	<caption>Critérios de Avaliação e como avaliar Recomendação 1.1</caption>
				    	<thead>
				    		<tr>
				    			<th id="numero_11" class="topoCriterios indice0">Número</th>
				    			<th id="criterio_11" class="topoCriterios indice1">Critério</th>
				    			<th id="como_avaliar_11" class="topoCriterios indice2">Como avaliar</th>
				    		</tr>
				    	</thead>
				    	<tbody>
				    					    		
				    		<tr id="criterio_111">
				    			<td headers="numero_11" class="celulaCriterios">1.1.1</td>
				    			<td headers="criterio_11" class="celulaCriterios">Não foram respeitados os Padrões <span lang="en">Web</span> HTML</td>
				    			<td headers="como_avaliar_11" class="celulaCriterios">Verificar erros e avisos apresentados pelo <span lang="en">webservice</span> de validação HTML fornecido pelo W3C: <a
						href="https://validator.w3.org/nu/">https://validator.w3.org/nu/ (<span lang="en">link</span> para um novo sítio)</a>.</td>
				    		</tr>
				    		<tr id="criterio_112">
				    			<td headers="numero_11" class="celulaCriterios">1.1.2</td>
				    			<td headers="criterio_11" class="celulaCriterios">Não foram respeitados os Padrões <span lang="en">Web</span> CSS</td>
				    			<td headers="como_avaliar_11" class="celulaCriterios">Verificar erros e avisos apresentados pelo <span lang="en">webservice</span> de validação CSS fornecido pelo W3C: <a
						href="https://jigsaw.w3.org/css-validator/">https://jigsaw.w3.org/css-validator/ (<span lang="en">link</span> para um novo sítio)</a>.</td>
				    		</tr>
				    		<tr id="criterio_113">
				    			<td headers="numero_11" class="celulaCriterios">1.1.3</td>
				    			<td headers="criterio_11" class="celulaCriterios">Presença de CSS(s) <span lang="en">in-line</span></td>
				    			<td headers="como_avaliar_11" class="celulaCriterios">Verificar a presença do atributo "<span lang="en">style</span>" no código das páginas HTML.</td>
				    		</tr>
				    		<tr id="criterio_114">
				    			<td headers="numero_11" class="celulaCriterios">1.1.4</td>
				    			<td headers="criterio_11" class="celulaCriterios">Presença de CSS(s) interno</td>
				    			<td headers="como_avaliar_11" class="celulaCriterios">Verificar a presença da tag HTML &lt;<span lang="en">style</span>&gt; no código das páginas HTML.</td>
				    		</tr>
				    		<tr id="criterio_115">
				    			<td headers="numero_11" class="celulaCriterios">1.1.5</td>
				    			<td headers="criterio_11" class="celulaCriterios">Presença de <span lang="en">javascript</span>(s) <span lang="en">in-line</span></td>
				    			<td headers="como_avaliar_11" class="celulaCriterios">Verificar a presença de código <span lang="en">javascript</span> dentro dos atributos de eventos no código HTML a serem avaliados:<span lang="en"> onload, onunload, onblur, onchange, onfocus, onsearch, onselect, onsubmit, onkeydown, onkeypress, onkeyup, onclick, ondblclick, onmousedown, onmousesemove, onmouseout, onmouseover, onmouseup, onmousewheel, oncopy, oncut, onpaste e onabort.</span></td>
				    		</tr>
				    		<tr id="criterio_116">
				    			<td headers="numero_11" class="celulaCriterios">1.1.6</td>
				    			<td headers="criterio_11" class="celulaCriterios">Presença de <span lang="en">javascript</span>(s) interno</td>
				    			<td headers="como_avaliar_11" class="celulaCriterios">Verificar a presença de código <span lang="en">javascript</span> dentro da tag &lt;<span lang="en">script</span>&gt;.</td>
				    		</tr>
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 1.2 - Organizar o código HTML de forma lógica e semântica</h3>
				    <p class="criterios">O código HTML deve ser organizado de forma lógica e semântica, ou seja, apresentando os elementos em uma ordem compreensível e correspondendo ao conteúdo desejado. Cada elemento HTML deve ser utilizado para o fim que ele foi criado.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 1.2</caption>
				    		<thead>
				    			<tr>
				    			    <th id="numero_12" class="topoCriterios indice0">Número</th>				  
				    				<th id="criterio_12" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_12" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    		<tr id="criterio_122">
				    		    <td headers="numero_12" class="celulaCriterios">1.2.2</td>
				    			<td headers="criterio_12" class="celulaCriterios">Presença de tags HTML sem atributo e conteúdo de texto</td>
				    			<td headers="como_avaliar_12" class="celulaCriterios">Verificar a presença de tags HTML (&lt;h1&gt;, &lt;h2&gt;, &lt;h3&gt;, &lt;h4&gt;, &lt;h5&gt;, &lt;h6&gt;,
				&lt;a&gt;, &lt;p&gt;) que apresentem inicio e fechamento, mas sem conteúdo de texto. Possível exemplo seria &lt;a&gt;&lt;/a&gt; ou &lt;div&gt;&lt;/div&gt;.</td>
				    		</tr>		    		
				    		<tr id="criterio_123">
				    		    <td headers="numero_12" class="celulaCriterios">1.2.3</td>
				    			<td headers="criterio_12" class="celulaCriterios">Presença de tags HTML sem atributo e conteúdo de texto</td>
				    			<td headers="como_avaliar_12" class="celulaCriterios">Verificar a presença de tags HTML que apresentem inicio e fechamento, mas sem conteúdo de texto. Possível exemplo seria &lt;a&gt;&lt;/a&gt; ou &lt;div&gt;&lt;/div&gt;.</td>
				    		</tr>
				    	    </tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 1.3 - Utilizar corretamente os níveis de cabeçalho</h3>
				    <p class="criterios">Os níveis de cabeçalho (elementos HTML H1 a H6) devem ser utilizados de forma hierárquica, pois organizam a ordem de importância e subordinação dos conteúdos, facilitando a leitura e compreensão.</p>
		            
		            <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 1.3</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_13" class="topoCriterios  indice0">Número</th>
				    				<th id="criterio_13" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_13" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_131">
				    		    <td headers="numero_13" class="celulaCriterios">1.3.1</td>
				    			<td headers="criterio_13" class="celulaCriterios">Os niveis de título não foram utilizados</td>
				    			<td headers="como_avaliar_13" class="celulaCriterios">Verificar a ausência dos níveis de cabeçalho (&lt;h1&gt;, &lt;h2&gt;, &lt;h3&gt;, &lt;h4&gt;, &lt;h5&gt; e &lt;h6&gt;) nas páginas HTML.</td>
				    		</tr>
				    		<tr id="criterio_132">
				    		    <td headers="numero_13" class="celulaCriterios">1.3.2</td>
				    			<td headers="criterio_13" class="celulaCriterios">A hierarquia dos níveis de título está incorreta</td>
				    			<td headers="como_avaliar_13" class="celulaCriterios">Verificar a falta de ordem sequencial da presença de níveis de cabeçalho. Exemplo: a presença do nível &lt;h3&gt; depende do nível anterior &lt;h2&gt;.</td>
				    		</tr>
				    		<tr id="criterio_134">
				    		    <td headers="numero_13" class="celulaCriterios">1.3.4</td>
				    			<td headers="criterio_13" class="celulaCriterios">Foi utilizado somente o nível H1</td>
				    			<td headers="como_avaliar_13" class="celulaCriterios">Verificar a presença do nível da cabeçalho &lt;h1&gt; sem categorizar outros assuntos da página em níveis de cabeçalho.</td>
				    		</tr>
				    		<tr id="criterio_136">
				    		    <td headers="numero_13" class="celulaCriterios">1.3.6</td>
				    			<td headers="criterio_13" class="celulaCriterios">Presença de mais de 1 cabeçalho</td>
				    			<td headers="como_avaliar_13" class="celulaCriterios">Verificar a presença de níveis de cabeçalho &lt;h1&gt; sendo utilizados de forma repetida.</td>
				    		</tr>
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 1.4 - Ordenar de forma lógica e intuitiva a leitura e tabulação</h3>
				    <p class="criterios">Deve-se criar o código HTML com uma sequência lógica de leitura para percorrer links, controles de formulários e objetos. Essa sequência é determinada pela ordem em que se encontra no código HTML.</p>
		            
		            <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 1.4</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_14" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_14" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_14" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_141">
				    		    <td headers="numero_14" class="celulaCriterios">1.4.1</td>
				    			<td headers="criterio_14" class="celulaCriterios">O bloco de conteúdo não esta antes do bloco de menu no HTML</td>
				    			<td headers="como_avaliar_14" class="celulaCriterios">Verificar se a presença do código da página que representa o menu está posicionado depois do código que representa o conteúdo da página HTML.</td>
				    		</tr>
				    		<tr id="criterio_143">
				    		    <td headers="numero_14" class="celulaCriterios">1.4.3</td>
				    			<td headers="criterio_14" class="celulaCriterios">Presença do atributo <span lang="en">TABINDEX</span></td>
				    			<td headers="como_avaliar_14" class="celulaCriterios">Verificar a presença de utilização do atributo "<span lang="en">tabindex</span>" nas páginas HTML.</td>
				    		</tr>
				    		<tr id="criterio_146">
				    		    <td headers="numero_14" class="celulaCriterios">1.4.6</td>
				    			<td headers="criterio_14" class="celulaCriterios">Presença de número do <span lang="en">tabindex</span> menor do que 0 e maior 32767</td>
				    			<td headers="como_avaliar_14" class="celulaCriterios">Verificar a presença do conteúdo -1 do atributo "<span lang="en">tabindex</span>" com o intuito de não influenciar a ordem do código da página, ou verificar se a presença de conteúdo do atributo "<span lang="en">tabindex</span>" esta superior a 32767 e inferior a 0.</td>
				    		</tr>
				    		
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 1.5 - Fornecer âncoras para ir direto a um bloco de conteúdo </h3>
				    <p class="criterios">Devem ser fornecidas âncoras, disponíveis na barra de acessibilidade, que apontem para links relevantes presentes na mesma página. Assim, é possivel ir ao bloco do conteúdo desejado. Os links devem ser colocados em lugares estratégicos da página, como no início e fim do conteúdo e início e fim do menu. É importante ressaltar que o primeiro <span lang="en">link</span> da página deve ser o: "ir para o conteúdo".</p>
		            
		            <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 1.5</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_15" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_15" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_15" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_151">
				    		    <td headers="numero_15" class="celulaCriterios">1.5.1</td>
				    			<td headers="criterio_15" class="celulaCriterios">Não foram encontradas âncoras que permitam saltar pelas diferentes seções da página</td>
				    			<td headers="como_avaliar_15" class="celulaCriterios">Verificar a ausência de links com conteúdo de atributo "href" que comecem com "#".</td>
				    		</tr>
				    		<tr id="criterio_152">
				    		    <td headers="numero_15" class="celulaCriterios">1.5.2</td>
				    			<td headers="criterio_15" class="celulaCriterios">Foram encontradas âncoras que permitem saltar pelas diferentes seções da página, porém algumas não possuem um destino correspondente</td>
				    			<td headers="como_avaliar_15" class="celulaCriterios">Verificar a presença de links com conteúdo de atributo "href" que comecem com "#", porém não há o destino da âncora na página HTML.</td>
				    		</tr>
				    		<tr id="criterio_154">
				    		    <td headers="numero_15" class="celulaCriterios">1.5.4</td>
				    			<td headers="criterio_15" class="celulaCriterios">Não existem atalhos</td>
				    			<td headers="como_avaliar_15" class="celulaCriterios">Verificar a ausência de tags HTML com atributo "<span lang="en">accesskey</span>" na página.</td>
				    		</tr>
				    		<tr id="criterio_1510">
				    		    <td headers="numero_15" class="celulaCriterios">1.5.10</td>
				    			<td headers="criterio_15" class="celulaCriterios">O primeiro <span lang="en">link</span> é uma âncora para o conteúdo da página</td>
				    			<td headers="como_avaliar_15" class="celulaCriterios">Verificar a presença de <span lang="en">link</span> com conteúdo de atributo "href" que comece com "#", e o destino da âncora seja um conteúdo específico da página HTML.</td>
				    		</tr>
				    		<tr id="criterio_1511">
				    		    <td headers="numero_15" class="celulaCriterios">1.5.11</td>
				    			<td headers="criterio_15" class="celulaCriterios">Presença de atributo <span lang="en">ACCESSKEY</span> com conteúdo repetido</td>
				    			<td headers="como_avaliar_15" class="celulaCriterios">Verificar a presença do atributo <span lang="en">"accesskey"</span> e conteúdo repetido em outros <span lang="en">"accesskeys"</span> da página HTML.</td>
				    		</tr>
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 1.6 - Não utilizar tabelas para diagramação</h3>
				    <p class="criterios">As tabelas devem ser utilizadas apenas para dados tabulares e não para efeitos de disposição dos elementos da página.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 1.6</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_16" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_16" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_16" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_161">
				    		    <td headers="numero_16" class="celulaCriterios">1.6.1</td>
				    			<td headers="criterio_16" class="celulaCriterios">Foram utizadas tabelas</td>
				    			<td headers="como_avaliar_16" class="celulaCriterios">Verificar a presença da tag &lt;<span lang="en">table</span>&gt; na página HTML.</td>
				    		</tr>
				    		
				    		<tr id="criterio_162">
				    		    <td headers="numero_16" class="celulaCriterios">1.6.2</td>
				    			<td headers="criterio_16" class="celulaCriterios">Há formulário construído dentro de tabela</td>
				    			<td headers="como_avaliar_16" class="celulaCriterios">Verificar a presença da tag &lt;<span lang="en">form</span>&gt; entre a tag &lt;<span lang="en">table</span>&gt;.</td>
				    		</tr>
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 1.7 - Separar links adjacentes</h3>
				    <p class="criterios">Links adjacentes devem ser separados por mais do que simples espaços, para que não fiquem confusos, em especial para usuários que utilizam leitor de tela. Para isso, é recomendado o uso de listas, onde cada elemento dentro da lista é um <span lang="en">link</span>. As listas podem ser estilizadas visualmente com CSS para que os itens sejam mostrados da maneira desejada, como um ao lado do outro.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 1.7</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_17" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_17" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_17" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_171">
				    		    <td headers="numero_17" class="celulaCriterios">1.7.1</td>
				    			<td headers="criterio_17" class="celulaCriterios">Há links adjacentes sem nenhum tipo de separação ou separação por espaços em branco</td>
				    			<td headers="como_avaliar_17" class="celulaCriterios">Verificar a presença de links dispostos numa forma sequencial sem separação explícita (caracteres especiais) ou separação explícita por espaços em branco.</td>
				    		</tr>
				    		
				    		
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 1.8 - Dividir as áreas de informação</h3>
				    <p class="criterios">Áreas de informação devem ser divididas em grupos fáceis de gerenciar. As divisões mais comuns são: "topo", "conteúdo", "menu" e "rodapé". Nas páginas internas deve-se manter uma mesma divisão para que o usuário se familiarize mais rapidamente com a estrutura do sítio. É importante destacar, entretanto, que a página inicial pode ter uma divisão diferente das páginas internas, pois ela normalmente contém mais elementos.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 1.8</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_18" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_18" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_18" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_183">
				    		    <td headers="numero_18" class="celulaCriterios">1.8.3</td>
				    			<td headers="criterio_18" class="celulaCriterios">Ausência de divisão de áreas quando do uso do HTML 5</td>		
				    			<td headers="como_avaliar_18" class="celulaCriterios">Verificar a ausência das tags: <span lang="en">&lt;header&gt;, &lt;footer&gt;, &lt;section&gt;, &lt;aside&gt;, &lt;nav&gt; e &lt;article&gt;</span>.</td>
				    		</tr>
				    		
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 1.9 - Não abrir novas instâncias sem a solicitação do usuário</h3>
				    <p class="criterios">A decisão de utilizar-se de novas instâncias - por exemplo abas ou janelas - para acesso a páginas, serviços ou qualquer informação, deve ser de escolha do usuário.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 1.9</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_19" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_19" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_19" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_191">
				    		    <td headers="numero_19" class="celulaCriterios">1.9.1</td>
				    			<td headers="criterio_19" class="celulaCriterios">Há <span lang="en">link</span> que abre nova página ou aba</td>		
				    			<td headers="como_avaliar_19" class="celulaCriterios">Verificar a presença de links com atributo "<span lang="en">target</span>" preenchido com "_<span lang="en">blank</span>".</td>
				    		</tr>
				    					    		
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 2.1 - Disponibilizar todas as funções da página via teclado</h3>
				    <p class="criterios">Todas as funções da página que utilizam linguagens de <span lang="en">script</span> (<span lang="en">javascript</span>) devem ser programadas, primeiramente, para o uso com o teclado. O foco não deverá estar bloqueado ou fixado em um elemento da página, para que o usuário possa mover-se pelo teclado por todos os elementos. Isso inclui movimentação em janelas modais (abertura de janela de dialogo que bloqueia qualquer interação com a janela principal). </p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 2.1</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_21" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_21" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_21" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_212">
				    		    <td headers="numero_21" class="celulaCriterios">2.1.2</td>
				    			<td headers="criterio_21" class="celulaCriterios">Há funcionalidade que só funciona pelo <span lang="en">mouse</span></td>		
				    			<td headers="como_avaliar_21" class="celulaCriterios">Verificar a presença dos eventos (<span lang="en">onmousedown, onmouseup, onmouseover, onmouseout</span>) nas tags HTML e a ausência de evento para permitir a manipulação por teclado.</td>
				    		</tr>
				    		
				    		<tr id="criterio_216">
				    		    <td headers="numero_21" class="celulaCriterios">2.1.6</td>
				    			<td headers="criterio_21" class="celulaCriterios">Presença de evento <span lang="en">DBLCLICK</span> ou <span lang="en">ONDBCLICK</span> no elemento HTML</td>		
				    			<td headers="como_avaliar_21" class="celulaCriterios">Verificar a presença do evento "<span lang="en">ondblclick</span>" nas tags HTML.</td>
				    		</tr>	
				    				
				    		<tr id="criterio_218">
				    		    <td headers="numero_21" class="celulaCriterios">2.1.8</td>
				    			<td headers="criterio_21" class="celulaCriterios"> Presença de eventos associados a elementos não interativos</td>		
				    			<td headers="como_avaliar_21" class="celulaCriterios">Verificar a presença de eventos HTML associados a elementos estáticos da página HTML. Um exemplo é a presença de mudança de contexto no nível de cabeçalho.</td>
				    		</tr>			    		
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
		            <h3 class="subtitulo">Recomendação 2.2 - Garantir que os objetos programáveis sejam acessíveis</h3>
				    <p class="criterios">Deve-se garantir que scripts, conteúdos dinâmicos e outros elementos programáveis sejam acessíveis e que seja possível sua execução via navegação.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 2.2</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_22" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_22" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_22" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_221">
				    		    <td headers="numero_22" class="celulaCriterios">2.2.1</td>
				    			<td headers="criterio_22" class="celulaCriterios">Presença de elemento <span lang="en">SCRIPT</span> sem o elemento <span lang="en">NOSCRIPT</span></td>		
				    			<td headers="como_avaliar_22" class="celulaCriterios">Verificar a presença do elemento &lt;<span lang="en">script</span>&gt; sem o elemento &lt;<span lang="en">noscript</span>&gt; na página.</td>
				    		</tr>		
				    		<tr id="criterio_222">
				    		    <td headers="numero_22" class="celulaCriterios">2.2.2</td>
				    			<td headers="criterio_22" class="celulaCriterios">Presença de elemento <span lang="en">OBJECT</span> sem o conteúdo alternativo</td>		
				    			<td headers="como_avaliar_22" class="celulaCriterios">Verificar a presença do elemento &lt;<span lang="en">object</span>&gt; sem texto entre os elementos. Exemplo: &lt;<span lang="en">object</span>&gt; Digite aqui o texto alternativo &lt;/<span lang="en">object</span>&gt;.</td>
				    		</tr>	
				    		
				    		<tr id="criterio_223">
				    		    <td headers="numero_22" class="celulaCriterios">2.2.3</td>
				    			<td headers="criterio_22" class="celulaCriterios">Presença de elemento <span lang="en">EMBED</span> na página HTML</td>		
				    			<td headers="como_avaliar_22" class="celulaCriterios">Verificar a presença do elemento &lt;<span lang="en">embed</span>&gt; sem texto entre os elementos. Exemplo: &lt;<span lang="en">embed</span>&gt; Digite aqui o texto alternativo &lt;/<span lang="en">embed</span>&gt;.</td>
				    		</tr>
				    		
				    		<tr id="criterio_224">
				    		    <td headers="numero_22" class="celulaCriterios">2.2.4</td>
				    			<td headers="criterio_22" class="celulaCriterios">Presença de elemento <span lang="en">APPLET</span> na página HTML</td>		
				    			<td headers="como_avaliar_22" class="celulaCriterios">Verificar a presença do elemento &lt;<span lang="en">applet</span>&gt; sem texto entre os elementos. Exemplo:&lt;<span lang="en">applet</span>&gt; Digite aqui o texto alternativo &lt;/<span lang="en">applet</span>&gt;.</td>
				    		</tr>				    		
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 2.3 - Não criar páginas com atualização automática periódica</h3>
				    <p class="criterios">A atualização automática periódica tira do usuário a autonomia em relação à escolha (semelhante a abertura de novas instâncias em navegadores) e pode confundir e desorientar os usuários, especialmente usuários que utilizam leitores de tela.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 2.3</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_23" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_23" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_23" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_231">
				    		    <td headers="numero_23" class="celulaCriterios">2.3.1</td>
				    			<td headers="criterio_23" class="celulaCriterios">Página que se atualiza automaticamente</td>		
				    			<td headers="como_avaliar_23" class="celulaCriterios">Verificar a presença do elemento &lt;<span lang="en">meta</span>&gt; e o atributo "http-equiv" com o conteúdo "<span lang="en">refresh</span>" ou a presença das funções <span lang="en">javascript</span>: <span lang="en">setTimeOut</span> e <span lang="en">setInterval</span> com a função para carregar a mesma página.</td>
				    		</tr>
				    				
				    						    		
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 2.4 - Não utilizar o redirecionamento automático de páginas</h3>
				    <p class="criterios">Não devem ser utilizadas marcações para redirecionar a uma nova página, porque tira do usuário a autonomia em relação à escolha (semelhante a abertura de novas instâncias em navegadores) e podem confundir e desorientar os usuários, especialmente usuários que utilizam leitores de tela.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 2.4</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_24" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_24" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_24" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_241">
				    		    <td headers="numero_24" class="celulaCriterios">2.4.1</td>
				    			<td headers="criterio_24" class="celulaCriterios">Há redirecionamento automático</td>		
				    			<td headers="como_avaliar_24" class="celulaCriterios">Verificar a presença do elemento &lt;<span lang="en">meta</span>&gt; e atributo "http-equiv" com conteúdo "<span lang="en">refresh</span>" e atributo "<span lang="en">content</span>" ou a presença do elemento &lt;<span lang="en">script</span>&gt; com a função "<span lang="en">window.location</span>".</td>
				    		</tr>
				    				
				    						    		
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 2.6 - Não incluir situações com intermitência de tela</h3>
				    <p class="criterios">Não devem ser utilizados efeitos visuais piscantes, intermitentes ou cintilantes. Em pessoas com epilepsia fotosensitiva, o cintilar ou piscar podem desencadear um ataque epilético. A exigência dessa diretriz aplica-se também para a propaganda de terceiros inserida na página.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 2.6</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_26" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_26" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_26" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_261">
				    		    <td headers="numero_26" class="celulaCriterios">2.6.1</td>
				    			<td headers="criterio_26" class="celulaCriterios">Presença do elemento <span lang="en">BLINK</span></td>		
				    			<td headers="como_avaliar_26" class="celulaCriterios">Presença do elemento &lt;<span lang="en">blink</span>&gt; na página HTML.</td>
				    		</tr>
				    		
				    		<tr id="criterio_262">
				    		    <td headers="numero_26" class="celulaCriterios">2.6.2</td>
				    			<td headers="criterio_26" class="celulaCriterios">Presença do elemento <span lang="en">MARQUEE</span></td>		
				    			<td headers="como_avaliar_26" class="celulaCriterios">Presença do elemento &lt;<span lang="en">marquee</span>&gt; na página HTML.</td>
				    		</tr>
				    		
				    		<tr id="criterio_263">
				    		    <td headers="numero_26" class="celulaCriterios">2.6.3</td>
				    			<td headers="criterio_26" class="celulaCriterios">Presença do elemento IMG com arquivo GIF com intermitência de tela</td>		
				    			<td headers="como_avaliar_26" class="celulaCriterios">Presença do elemento &lt;img&gt; e atributo "src" contendo arquivo com extensão "gif" e o arquivo apresenta movimentação.</td>
				    		</tr>
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 3.1 - Identificar o idioma principal da página</h3>
				    <p class="criterios">Deve-se identificar o principal idioma utilizado nos documentos e páginas HTML.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 3.1</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_31" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_31" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_31" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_311">
				    		    <td headers="numero_31" class="celulaCriterios">3.1.1</td>
				    			<td headers="criterio_31" class="celulaCriterios">Não há identificação do idioma principal da página</td>		
				    			<td headers="como_avaliar_31" class="celulaCriterios">Verificar a ausência do atributo "lang" no elemento &lt;html&gt;, quando o elemento &lt;<span lang="en">doctype</span>&gt; for do tipo <span lang="en">Strict</span> (<a
						href="http://www.w3.org/TR/html4/strict.dtd">http://www.w3.org/TR/html4/strict.dtd</a>), <span lang="en">Transitional</span> (<a
						href="http://www.w3.org/TR/html4/loose.dtd">http://www.w3.org/TR/html4/loose.dtd</a>), <span lang="en">Frameset</span> (<a
						href="http://www.w3.org/TR/html4/frameset.dtd">http://www.w3.org/TR/html4/frameset.dtd</a>), linguagem HTML 5, ou verificar a não presença do atributo "xml:lang", quando o elemento &lt;<span lang="en">doctype</span>&gt; for do tipo <span lang="en">Strict</span> (<a
						href="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd</a>), <span lang="en">frameset</span> (<a
						href="http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd</a>), XHTML 1.1 (<a
						href="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd</a>), <span lang="en">transitional</span> (<a
						href="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd</a>).</td>
				    		</tr>
				    		
				    		<tr id="criterio_313">
				    		    <td headers="numero_31" class="celulaCriterios">3.1.3</td>
				    			<td headers="criterio_31" class="celulaCriterios">Presença do elemento HTML, atributo XMLNS, atributo XML;LANG e a ausência do atributo <span lang="en">LANG</span></td>		
				    			<td headers="como_avaliar_31" class="celulaCriterios">Verificar a presença dos atributos "xmlns" e "xml-lang" e a ausência do atributo "<span lang="en">lang</span>".</td>
				    		</tr>
				    		
				    		
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 3.2 - Informar a mudança de idioma no conteúdo</h3>
				    <p class="criterios">Se algum elemento de uma página possuir conteúdo em um idioma diferente do principal, este deverá estar identificado.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 3.2</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_32" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_32" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_32" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_321">
				    		    <td headers="numero_32" class="celulaCriterios">3.2.1</td>
				    			<td headers="criterio_32" class="celulaCriterios">Presença de atributo <span lang="en">LANG</span> nos elementos da página, além da tag HTML</td>		
				    			<td headers="como_avaliar_32" class="celulaCriterios">Verificar a presença do atributo "<span lang="en">lang</span>" nos elementos da página HTML, não considerando o elemento &lt;html&gt;.</td>				    		</tr>
				    		
				    					    		
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 3.3 - Oferecer um título descritivo e informativo à página</h3>
				    <p class="criterios">O título da página deve ser descritivo e informativo, devendo representar o conteúdo principal da página, já que essa informação será a primeira a ser lida pelo leitor de tela, quando o usuário acessar a página.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 3.3</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_33" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_33" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_33" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_331">
				    		    <td headers="numero_33" class="celulaCriterios">3.3.1</td>
				    			<td headers="criterio_33" class="celulaCriterios">Não há título para a página, ou está em branco</td>		
				    			<td headers="como_avaliar_33" class="celulaCriterios">Verificar a ausência da tag &lt;<span lang="en">title</span>&gt; na página HTML, ou verificar a presença do tag &lt;<span lang="en">title</span>&gt; sem conteúdo de texto para a identificação da página.</td>				    		
				    		</tr>
				    	   		
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 3.5 - Descrever links clara e sucintamente</h3>
				    <p class="criterios">Deve-se identificar claramente o destino da cada <span lang="en">link</span>, informando, inclusive, se o <span lang="en">link</span> remete a outro sítio. Além disso, é preciso que o texto do <span lang="en">link</span> faça sentido mesmo quando isolado do contexto da página.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 3.5</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_35" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_35" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_35" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_351">
				    		    <td headers="numero_35" class="celulaCriterios">3.5.1</td>
				    			<td headers="criterio_35" class="celulaCriterios"><span lang="en">Link</span> com descrição no formato de URL</td>		
				    			<td headers="como_avaliar_35" class="celulaCriterios"> Presença do elemento &lt;a&gt; e descrição do texto em formato de endereço da internet. Lembrar que não importará se o <span lang="en">link</span> do texto será igual ou não no atributo "href".</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_353">
				    		    <td headers="numero_35" class="celulaCriterios">3.5.3</td>
				    			<td headers="criterio_35" class="celulaCriterios">Links vazios</td>		
				    			<td headers="como_avaliar_35" class="celulaCriterios">Presença do elemento &lt;a&gt; e ausência de texto descritivo.</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_354">
				    		    <td headers="numero_35" class="celulaCriterios">3.5.4</td>
				    			<td headers="criterio_35" class="celulaCriterios"><span lang="en">Link</span> com descrição somente do <span lang="en">TITLE</span></td>		
				    			<td headers="como_avaliar_35" class="celulaCriterios">Presença do elemento &lt;a&gt;, atributo "<span lang="en">title</span>" com texto descritivo e ausência de texto descritivo na estrutura principal do <span lang="en">link</span>.</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_355">
				    		    <td headers="numero_35" class="celulaCriterios">3.5.5</td>
				    			<td headers="criterio_35" class="celulaCriterios">Links que são imagens sem descrição</td>		
				    			<td headers="como_avaliar_35" class="celulaCriterios">Presença do elemento &lt;a&gt; e dentro o elemento &lt;img&gt; sem conteúdo descritivo no atributo "<span lang="en">alt</span>".</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_356">
				    		    <td headers="numero_35" class="celulaCriterios">3.5.6</td>
				    			<td headers="criterio_35" class="celulaCriterios">Links do tipo "clique aqui", "leia mais", "veja mais", "veja aqui", "clique", "acesse aqui", "clique para acessar", "aqui", entre outros</td>		
				    			<td headers="como_avaliar_35" class="celulaCriterios">Presença do elemento &lt;a&gt; e de texto descritivo com as palavras exatas ou palavras começando no texto do inicio do <span lang="en">link</span>: "clique aqui", "leia mais", "veja aqui", "veja mais", "veja aqui", "clique", "acesse aqui", "clique para acessar", "aqui".</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_3510">
				    		    <td headers="numero_35" class="celulaCriterios">3.5.10</td>
				    			<td headers="criterio_35" class="celulaCriterios">Links com descrições diferentes que remetem ao mesmo local</td>		
				    			<td headers="como_avaliar_35" class="celulaCriterios">Presença de elementos &lt;a&gt; com textos descritivos diferentes, porém os conteúdos dos href's remetem para o mesmo <span lang="en">link</span>.</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_3511">
				    		    <td headers="numero_35" class="celulaCriterios">3.5.11</td>
				    			<td headers="criterio_35" class="celulaCriterios">Links com a mesma descrição que remetem a locais diferentes</td>		
				    			<td headers="como_avaliar_35" class="celulaCriterios">Presença de elementos &lt;a&gt; com textos descritivos iguais, porém os conteúdos dos href's remetem para links diferentes.</td>				    		
				    		</tr>
				    	   		
				    	   	<tr id="criterio_3512">
				    		    <td headers="numero_35" class="celulaCriterios">3.5.12</td>
				    			<td headers="criterio_35" class="celulaCriterios">Links que são lidos duas ou mais vezes</td>		
				    			<td headers="como_avaliar_35" class="celulaCriterios">Presença do elemento &lt;a&gt; com o mesmo conteúdo no atributo <span lang="en">title</span> e no texto descritivo.</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_3513">
				    		    <td headers="numero_35" class="celulaCriterios">3.5.13</td>
				    			<td headers="criterio_35" class="celulaCriterios">Links com descrição muito longa</td>		
				    			<td headers="como_avaliar_35" class="celulaCriterios">Presença do elemento &lt;a&gt; com conteúdo do texto descrito com quantidade de caracteres acima de 2000.</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_3514">
				    		    <td headers="numero_35" class="celulaCriterios">3.5.14</td>
				    			<td headers="criterio_35" class="celulaCriterios">Links que remetem a páginas indisponiveis/inexistentes (links quebrados)</td>		
				    			<td headers="como_avaliar_35" class="celulaCriterios">Presença do elemento &lt;a&gt; e o conteúdo do atributo "href" direciona para páginas de erros: 404, 405, 503 e outros.</td>				    		
				    		</tr>
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 3.6 - Fornecer alternativa em texto para as imagens do sítio</h3>
				    <p class="criterios">Deve ser fornecida uma descrição para as imagens da página.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 3.6</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_36" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_36" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_36" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_361">
				    		    <td headers="numero_36" class="celulaCriterios">3.6.1</td>
				    			<td headers="criterio_36" class="celulaCriterios">Imagens sem a declaração do atributo <span lang="en">ALT</span></td>		
				    			<td headers="como_avaliar_36" class="celulaCriterios">Presença de elementos &lt;img&gt; e ausência do atributo "<span lang="en">alt</span>".</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_362">
				    		    <td headers="numero_36" class="celulaCriterios">3.6.2</td>
				    			<td headers="criterio_36" class="celulaCriterios">Imagens com conteúdo sem descrição</td>		
				    			<td headers="como_avaliar_36" class="celulaCriterios">Presença de elementos &lt;img&gt; e ausência de conteúdo descritivo do atributo "<span lang="en">alt</span>".</td>				    		
				    		</tr>
				    	   		
				    	   	<tr id="criterio_363">
				    		    <td headers="numero_36" class="celulaCriterios">3.6.3</td>
				    			<td headers="criterio_36" class="celulaCriterios">Imagens com descrição igual ao nome do arquivo</td>		
				    			<td headers="como_avaliar_36" class="celulaCriterios">Presença de elementos &lt;img&gt; e atributo "<span lang="en">alt</span>" com conteúdo descrito com o nome do arquivo de referência da imagem.</td>				    		
				    		</tr>	
				    		
				    		<tr id="criterio_364">
				    		    <td headers="numero_36" class="celulaCriterios">3.6.4</td>
				    			<td headers="criterio_36" class="celulaCriterios">Imagens com descrições comuns</td>		
				    			<td headers="como_avaliar_36" class="celulaCriterios">Presença de elementos &lt;img&gt; e atributo "<span lang="en">alt</span>" com conteúdo descrito contendo expressões: "figura", "imagem", "<span lang="en">alt</span>", conteúdo em branco e outros.</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_367">
				    		    <td headers="numero_36" class="celulaCriterios">3.6.7</td>
				    			<td headers="criterio_36" class="celulaCriterios">Imagens diferentes com a mesma descrição</td>		
				    			<td headers="como_avaliar_36" class="celulaCriterios">Presença de elementos &lt;img&gt; com o mesmo atributo "src", no entanto, o conteúdo do atributo "<span lang="en">alt</span>" não é o mesmo de cada imagem.</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_368">
				    		    <td headers="numero_36" class="celulaCriterios">3.6.8</td>
				    			<td headers="criterio_36" class="celulaCriterios">Imagens com dupla descrição, pois utiliza atributo <span lang="en">TITLE</span> com o mesmo valor da descrição</td>		
				    			<td headers="como_avaliar_36" class="celulaCriterios">Presença de elementos &lt;img&gt; com o mesmo conteúdo descrito no atributo "<span lang="en">title</span>" e no atributo "<span lang="en">alt</span>".</td>				    		
				    		</tr>
				   		</tbody>
				    </table>
				   				    		
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 3.7 - Ulilizar mapas de imagem de forma acessível</h3>
				    <p class="criterios">Um mapa de imagens é uma imagem dividida em áreas selecionáveis. Cada área é um <span lang="en">link</span> para outra página <span lang="en">Web</span> ou outra seção da página atual.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 3.7</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_37" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_37" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_37" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_371">
				    		    <td headers="numero_37" class="celulaCriterios">3.7.1</td>
				    			<td headers="criterio_37" class="celulaCriterios">Mapa de imagem sem descrição ou alternativa em texto</td>		
				    			<td headers="como_avaliar_37" class="celulaCriterios"> Presença do elemento &lt;img&gt; com atributo "<span lang="en">usemap</span>" e ausência de conteúdo descritivo no atributo "<span lang="en">alt</span>", ou presença do elemento &lt;area&gt; e ausência de conteúdo descritivo no atributo "<span lang="en">alt</span>".</td>				    		
				    		</tr>
				    		
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 3.9 - Em tabelas, utilizar títulos e resumos de forma apropriada</h3>
				    <p class="criterios">O título da tabela deve ser definido e localizado no primeiro elemento da tabela. Em casos de tabelas extensas, deve ser fornecido um resumo dos dados.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 3.9</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_39" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_39" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_39" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_391">
				    		    <td headers="numero_39" class="celulaCriterios">3.9.1</td>
				    			<td headers="criterio_39" class="celulaCriterios">Tabelas sem título e resumo</td>		
				    			<td headers="como_avaliar_39" class="celulaCriterios">Presença do elemento &lt;<span lang="en">table</span>&gt; e ausência do atributo "<span lang="en">summary</span>" ou ausência do elemento &lt;<span lang="en">caption</span>&gt;.</td>				    		
				    		</tr>
				    		
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 3.10 - Associar células de dados às células de cabeçalho</h3>
				    <p class="criterios">Em tabelas de dados simples, o uso apropriado dos cabeçalhos e das colunas para as células de dados.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 3.10</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_3100" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_3100" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_3100" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_3101">
				    		    <td headers="numero_3100" class="celulaCriterios">3.10.1</td>
				    			<td headers="criterio_3100" class="celulaCriterios">Tabelas sem células associadas</td>		
				    			<td headers="como_avaliar_3100" class="celulaCriterios">Presença do elemento &lt;<span lang="en">table</span>&gt; e ausência dos elementos: &lt;thead&gt;, &lt;tbody&gt;, ou a presença do elemento &lt;<span lang="en">table</span>&gt; e ausência dos atributos: <span lang="en">"id", "headers", "scope", "axis"</span> nos elementos &lt;td&gt; e &lt;th&gt;.</td>				    		
				    		</tr>
				    		
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 3.11 - Garantir a leitura e compreensão das informações</h3>
				    <p class="criterios">O texto de um sítio deve ser de fácil leitura e compreensão, não exigindo do usuário um nível de instrução avançado. Quando o texto exigir uma capacidade de leitura mais avançada, devem ser disponibilizadas informações suplementares que expliquem ou ilustrem o conteúdo principal.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 3.11</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_3110" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_3110" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_3110" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    		
				    		<tr id="criterio_3112">
				    		    <td headers="numero_3110" class="celulaCriterios">3.11.2</td>
				    			<td headers="criterio_3110" class="celulaCriterios">Presença de parágrafos justificados</td>		
				    			<td headers="como_avaliar_3110" class="celulaCriterios">Presença de elementos &lt;p&gt; com conteúdo "<span lang="en">justify</span>" no atributo "<span lang="en">align</span>".</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_3113">
				    		    <td headers="numero_3110" class="celulaCriterios">3.11.3</td>
				    			<td headers="criterio_3110" class="celulaCriterios">Presença de textos justificados através de folhas de estilo</td>		
				    			<td headers="como_avaliar_3110" class="celulaCriterios">Presença de elementos &lt;p&gt; e propriedade CSS <span lang="en">text-align</span> com conteúdo "<span lang="en">justify</span>". Deverá ser avaliado o CSS externo (com arquivo CSS referenciado pelo elemento &lt;<span lang="en">link</span>&gt;), interno (propriedade dentro do elemento &lt;<span lang="en">style</span>&gt;) e <span lang="en">in-line</span> (propriedade dentro do atributo "<span lang="en">style</span>" no elemento &lt;p&gt;).</td>				    		
				    		</tr>
				    		
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 3.12 - Disponibilizar uma explicação para siglas, abreviaturas e palavras incomuns</h3>
				    <p class="criterios">Recomenda-se que na primeira ocorrência de siglas, abreviaturas ou palavras incomuns (ambíguas, desconhecidas ou utilizadas de forma muito específica), deve ser disponibilizada sua explicação ou forma completa.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 3.12</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_3120" class="topoCriterios  indice0">Número</th>
				    				<th id="criterio_3120" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_3120" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_3121">
				    		    <td headers="numero_3120" class="celulaCriterios">3.12.1</td>
				    			<td headers="criterio_3120" class="celulaCriterios">Siglas marcadas e sem explicação</td>		
				    			<td headers="como_avaliar_3120" class="celulaCriterios">Presença dos elementos &lt;abbr&gt; ou &lt;<span lang="en">acronym</span>&gt; e ausência do atributo "<span lang="en">title</span>" para descrever a sigla.</td>				    		
				    		</tr>
				    						    						    		
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 4.4 - Possibilitar que o elemento com foco seja visualmente evidente</h3>
				    <p class="criterios">A área que recebe o foco pelo teclado deve ser claramente marcada, devendo a área de seleção ser passível de ser clicada.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 4.4</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_44" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_44" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_44" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_441">
				    		    <td headers="numero_44" class="celulaCriterios">4.4.1</td>
				    			<td headers="criterio_44" class="celulaCriterios">Presença de destaque do foco do elemento ativo.</td>		
				    			<td headers="como_avaliar_44" class="celulaCriterios">Verificar a ausência de destaque nos elementos HTML. Para verificação, analisar a ausência de utilização da propriedade "<span lang="en">border</span>" dentro dos seletores CSS.</td>				    		
				    		</tr>
				    						    						    		
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 5.1 - Fornecer alternativa para video</h3>
				    <p class="criterios">Deve haver uma alternativa sonora ou textual para vídeos que não incluem faixas de áudio.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 5.1</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_51" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_51" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_51" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_511">
				    		    <td headers="numero_51" class="celulaCriterios">5.1.1</td>
				    			<td headers="criterio_51" class="celulaCriterios">Presença de vídeo na página</td>		
				    			<td headers="como_avaliar_51" class="celulaCriterios">Presença do elemento &lt;<span lang="en">embed</span>&gt; ou &lt;video&gt; com atributos "src" direcionados para arquivo de vídeo ou local de execução de vídeo.</td>				    		
				    		</tr>
				    						    						    		
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 5.2 - Fornecer alternativa para áudio</h3>
				    <p class="criterios">Áudio gravado deve possuir uma transcrição descritiva. Além de essencial para pessoas com deficiência auditiva, a alternativa em texto também é importante para úsuarios que não possuem equipamento de som, que desejam apenas realizar a leitura do material ou não dispôem de tempo para ouvir um arquivo multimídia. Neste caso, também é desejavel a alternativa em Libras.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 5.2</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_52" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_52" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_52" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_521">
				    		    <td headers="numero_52" class="celulaCriterios">5.2.1</td>
				    			<td headers="criterio_52" class="celulaCriterios">Presença de áudio na página</td>		
				    			<td headers="como_avaliar_52" class="celulaCriterios">Presença do elemento &lt;<span lang="en">embed</span>&gt; ou &lt;audio&gt; com atributos "src" direcionados para arquivo de audio ou local de execução de áudio.</td>				    		
				    		</tr>
				    						    						    		
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 5.3 - Oferecer audiodescrição para vídeo pré-gravado</h3>
				    <p class="criterios">Videos que transmitem conteúdo visual que não está disponível na faixa de áudio devem possuir uma audiodescrição. A audiodescrição consiste na descrição clara e objetiva de todas as informações apresentadas de forma visual e que não fazem parte dos diálogos. Essas descrições são apresentadas nos espaços entre os diálogos e nas pausas entre as informações sonoras.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 5.3</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_53" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_53" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_53" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_531">
				    		    <td headers="numero_53" class="celulaCriterios">5.3.1</td>
				    			<td headers="criterio_53" class="celulaCriterios">Presença de vídeo na página</td>		
				    			<td headers="como_avaliar_53" class="celulaCriterios">Presença do elemento &lt;<span lang="en">embed</span>&gt; ou &lt;video&gt; com atributos "src" direcioanados para arquivo de vídeo ou local de execução de vídeo.</td>				    		
				    		</tr>
				    						    						    		
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 5.4 - Fornecer controle de áudio para som</h3>
				    <p class="criterios">Deve ser fornecido um mecanismo para parar, pausar, silenciar ou ajustar o volume de qualquer som que se reproduza na página.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 5.4</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_54" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_54" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_54" class="topoCriterios  indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_541">
				    		    <td headers="numero_54" class="celulaCriterios">5.4.1</td>
				    			<td headers="criterio_54" class="celulaCriterios">Presença de áudio na página</td>		
				    			<td headers="como_avaliar_54" class="celulaCriterios">Presença do elemento &lt;<span lang="en">embed</span>&gt; ou &lt;audio&gt; com atributos "src" direcionados para arquivo de áudio ou local de execução de áudio.</td>				    		
				    		</tr>
				    						    						    		
				    	</tbody>
				    </table>
                   	    
                   	<hr class="hr_linhaDupla">	    
				    <h3 class="subtitulo">Recomendação 6.1 - Fornecer alternativa em texto para os botões de imagem de formulários</h3>
				    <p class="criterios">Ao serem utilizados botões do tipo imagem, que servem para o mesmo propósito do botão "<span lang="en">submit</span>", deve ser fornecida uma descrição textual para o botão. Para outros tipos de botões é necessario substituir o botão pela imagem que se deseja utilizar através do CSS e aplicar o texto descrito no atributo "value".</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 6.1</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_61" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_61" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_61" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_611">
				    		    <td headers="numero_61" class="celulaCriterios">6.1.1</td>
				    			<td headers="criterio_61" class="celulaCriterios">Botão sem descrição</td>		
				    			<td headers="como_avaliar_61" class="celulaCriterios">Presença do elemento &lt;<span lang="en">input</span>&gt; com o conteúdo do atributo "<span lang="en">type</span>" igual a "<span lang="en">image</span>" e ausência de conteúdo no atributo "<span lang="en">alt</span>" ou ausência do "<span lang="en">alt</span>". Presença do elemento &lt;input&gt; com os conteúdos: "<span lang="en">button</span>", "<span lang="en">reset</span>", ou "<span lang="en">submit</span>" e ausência de conteúdo no atributo "value" ou ausência do atributo "value".</td>				    		
				    		</tr>
				    						    						    		
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 6.2 - Associar etiquetas aos seus campos</h3>
				    <p class="criterios">As etiquetas de texto devem estar associadas aos seus campos correspondentes no formulário.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 6.2</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_62" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_62" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_62" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_621">
				    		    <td headers="numero_62" class="celulaCriterios">6.2.1</td>
				    			<td headers="criterio_62" class="celulaCriterios">Campo sem <span lang="en">label</span> associado</td>		
				    			<td headers="como_avaliar_62" class="celulaCriterios">Presença do elemento &lt;<span lang="en">input</span>&gt; e ausência de elemento &lt;<span lang="en">label</span>&gt; com atributo "<span lang="en">for</span>" referenciado ao atributo "id" do &lt;<span lang="en">input</span>&gt;, ou presença de elemento &lt;<span lang="en">input</span>&gt; sem estar dentro de elemento &lt;<span lang="en">label</span>&gt;.</td>				    		
				    		</tr>
				    						    						    		
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 6.3 - Estabelecer uma lógica de navegação</h3>
				    <p class="criterios">Os elementos do formulário devem ser distribuídos corretamente através do códgio HTML, criando, assim, uma sequência lógica de navegação.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 6.3</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_63" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_63" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_63" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_631">
				    		    <td headers="numero_63" class="celulaCriterios">6.3.1</td>
				    			<td headers="criterio_63" class="celulaCriterios">Presença do elemento <span lang="en">FORM</span> e atributo <span lang="en">TABINDEX</span></td>		
				    			<td headers="como_avaliar_63" class="celulaCriterios">Presença do elemento &lt;<span lang="en">form</span>&gt; e atributo "<span lang="en">tabindex</span>" nos elementos dentro do &lt;<span lang="en">form</span>&gt;.</td>				    		
				    		</tr>
				    						    						    		
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 6.4 - Não provocar automaticamente alteração no contexto</h3>
				    <p class="criterios">A área que recebe o foco pelo teclado deve ser claramente marcada, devendo a área de seleção ser passível de ser clicada.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 6.4</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_64" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_64" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_64" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_641">
				    		    <td headers="numero_64" class="celulaCriterios">6.4.1</td>
				    			<td headers="criterio_64" class="celulaCriterios">Presença do elemento <span lang="en">FORM</span> e nos seus elementos a existência do atributo<span lang="en"> ONCHANGE, ONBLUR, ONFOCUS, ONFORMCHANGE, ONFORMINPUT, ONINPUT, ONINVALID, ONRESET, ONSELECT, ONSUBMIT, ONKEYDOWN, ONKEYPRESS, ONKEYUP, ONCLICK</span> exceto elementos <span lang="en">INPUT</span> com <span lang="en">type BUTTON, SUBMIT, RESET</span></td>		
				    			<td headers="como_avaliar_64" class="celulaCriterios">Presença do elemento <span lang="en">&lt;form&gt;</span> e nos seus elementos internos, retirando os elementos <span lang="en">&lt;input&gt;</span> com os conteúdos no atributo <span lang="en">“type”: button, submit, reset</span>. Utilização dos eventos (atributos): <span lang="en">onchage, onblur, onfocus, onformchange, onforminput, oninput, oninvalid, onreset, onselect, onsubmit, onkeydown, onkeypress, onkeyup, onclick</span>.</td>				    		
				    		</tr>
				    				
				    		<tr id="criterio_642">
				    		    <td headers="numero_64" class="celulaCriterios">6.4.2</td>
				    			<td headers="criterio_64" class="celulaCriterios">Presença do elemento <span lang="en">FORM</span>  e nos seus elementos a existência do atributo<span lang="en"> ONDBLCLICK, ONDRAG, ONDRAGEND, ONDRAGENTER, ONDRAGLEAVE, ONDRAGOVER, ONDRAGSTART, ONDROP, ONMOUSEDOWN, ONMOUSEMOVE, ONMOUSEOUT, ONMOUSEOVER, ONMOUSEUP, ONMOUSEWHEEL, ONSCROLL</span></td>		
				    			<td headers="como_avaliar_64" class="celulaCriterios">Presença do elemento<span lang="en"> &lt;form&gt;</span> e nos seus elementos internos a utilização dos eventos (atributos):<span lang="en"> ondbclick, ondrag, ondragend, ondragcenter, omdragleave, ondragover, ondragstart, ondrop, onmousedown, onmousemove, onmouseout, onmouseover, onmouseup, onmousewheel, onscroll, </span>ou a presença de funções <span lang="en">javascript in-line</span> (código <span lang="en">javascritpt</span> em elementos html), interno (código <span lang="en">javascript</span> dentro do elemento <span lang="en">&lt;script&gt;</span>) e externo (código <span lang="en">javascript</span> referenciado pelo elemento <span lang="en">&lt;script&gt;</span> por meio do atributo src) que permitem comportamento na página sem apresentar aviso ao utilizador da página.</td>				    		
				    		</tr>				    						    		
				    	</tbody>
				    </table>
				    
				    <hr class="hr_linhaDupla">	
				    <h3 class="subtitulo">Recomendação 6.7 - Agrupar campos de formulário</h3>
				    <p class="criterios">É recomendado que os campos com informações relacionadas sejam agrupadas utilizando elementos com esta finalidade na própria linguagem HTML, principalmente em formulários longos. O agrupamento deverá ser feito de maneira lógica, explicitando claramente o propósito ou natureza dos agrupamentos.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption>Critérios de Avaliação e como avaliar Recomendação 6.7</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_67" class="topoCriterios indice0">Número</th>
				    				<th id="criterio_67" class="topoCriterios indice1">Critério</th>
				    				<th id="como_avaliar_67" class="topoCriterios indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_671">
				    		    <td headers="numero_67" class="celulaCriterios">6.7.1</td>
				    			<td headers="criterio_67" class="celulaCriterios">Existência de formulário e inexistência de agrupamento de campos</td>		
				    			<td headers="como_avaliar_67" class="celulaCriterios">Verificar a presença do elemento &lt;<span lang="en">form</span>&gt; e dentro desse os elementos:<span lang="en"> &lt;input&gt;, &lt;textarea&gt;, &lt;button&gt;, &lt;select&gt;, &lt;option&gt;, &lt;label&gt;</span> e ausência do elemento<span lang="en"> &lt;fieldset&gt;</span>.</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_672">
				    		    <td headers="numero_67" class="celulaCriterios">6.7.2</td>
				    			<td headers="criterio_67" class="celulaCriterios">Uso de campo de seleção sem agrupamento</td>		
				    			<td headers="como_avaliar_67" class="celulaCriterios">Verificar a presença do elemento &lt;<span lang="en">form</span>&gt; e dentro desse o elemento <span lang="en">&lt;select&gt;</span> e ausência do elemento <span lang="en">&lt;optgroup&gt;</span> para conteúdos do <span lang="en">&lt;select&gt;</span> que precisam de agrupamento.</td>				    		
				    		</tr>
				    						    						    		
				    	</tbody>
				    </table>
				    				
	</jsp:body>
</t:baseLayout>


