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
								<a href="${pageContext.request.contextPath}">Página Inicial</a>
							</li>
							<li>|</li>
               				<li>Critérios de Sucesso</li>
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
				    <h3 class="subtitulo">Recomendação 1.1 - Respeitar os padrões Web</h3>
				    
				    <p class="criterios">
				    Os padrões Web são recomendações do W3C (World Wide Web Consortium), as quais
				    são destinadas a orientar os desenvolvedores para o uso de boas práticas que tornam a
				    web acessivel para todos, permitindo assim que os desenvolvedores criem experiências
				    ricas, alimentadas por um vasto armazenamento de dados, os quais estão disponiveis
				    para qualquer dispositivo e compatíveis com atuais e futuros agentes de usuário (ex: navegadores).</p>
				    
				    
				    <table class="tabelaCriterioSucesso">
				    	<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 1.1</caption>
				    	<thead>
				    		<tr>
				    			<th id="numero_11" class="topo indice0">Número</th>
				    			<th id="criterio_11" class="topo indice1">Critério</th>
				    			<th id="como_avaliar_11" class="topo indice2">Como avaliar</th>
				    		</tr>
				    	</thead>
				    	<tbody>
				    					    		
				    		<tr id="criterio_111">
				    			<td headers="numero_11" class="celula">1.1.1</td>
				    			<td headers="criterio_11" class="celula">Não foram respeitados os Padrões Web CSS</td>
				    			<td headers="como_avaliar_11" class="celula">Verificar relatório no anexo do documento de avaliação de erros e avisos apresentados pela ferramenta de avaliação de HTML do W3C: <a
						href="https://validator.w3.org/nu/">https://validator.w3.org/nu/ (link para um novo sitio)</a>.</td>
				    		</tr>
				    		<tr id="criterio_112">
				    			<td headers="numero_11" class="celula">1.1.2</td>
				    			<td headers="criterio_11" class="celula">Não foram respeitados os Padrões Web CSS</td>
				    			<td headers="como_avaliar_11" class="celula">Verificar relatório no anexo do documento de avaliação de erros e avisos apresentados pela ferramenta da avaliação de HTML do W3C: <a
						href="https://jigsaw.w3.org/css-validator/">https://jigsaw.w3.org/css-validator/ (link para um novo sitio)</a>.</td>
				    		</tr>
				    		<tr id="criterio_113">
				    			<td headers="numero_11" class="celula">1.1.3</td>
				    			<td headers="criterio_11" class="celula">Presença de CSS(s) in-line</td>
				    			<td headers="como_avaliar_11" class="celula">Verificar a presença do atributo "style" no código das páginas HTML.</td>
				    		</tr>
				    		<tr id="criterio_114">
				    			<td headers="numero_11" class="celula">1.1.4</td>
				    			<td headers="criterio_11" class="celula">Presença de CSS(s) interno</td>
				    			<td headers="como_avaliar_11" class="celula">Verificar a presença da tag HTML &lt;style&gt; no código das páginas HTML.</td>
				    		</tr>
				    		<tr id="criterio_115">
				    			<td headers="numero_11" class="celula">1.1.5</td>
				    			<td headers="criterio_11" class="celula">Presença de javascript(s) in-line</td>
				    			<td headers="como_avaliar_11" class="celula">Verificar a presença de código javascript dentro dos atributos de eventos no código HTML a serem avaliados: onload, onunload, onblur, onchange, onfocus, onsearch, onselect, onsubmit, onkeydown, onkeypress, onkeyup, onclick, ondblclick, onmousedown, onmousesemove, onmouseout, onmouseover, onmouseup, onmousewheel, oncopy, oncut, onpaste, onabort.</td>
				    		</tr>
				    		<tr id="criterio_116">
				    			<td headers="numero_11" class="celula">1.1.6</td>
				    			<td headers="criterio_11" class="celula">Presença de javascript(s) interno</td>
				    			<td headers="como_avaliar_11" class="celula">Verificar a presença de código javascript dentro da tag &lt;script&gt;.</td>
				    		</tr>
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 1.2 - Organizar o código HTML de forma lógica e semântica</h3>
				    <p class="criterios">O código HTML deve ser organizado de forma lógica e semântica, ou seja, apresentando os elementos em uma ordem compreensível e correspondendo ao conteúdo desejado. Cada elemento HTML deve ser utilizado para o fim que ele foi criado.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 1.2</caption>
				    		<thead>
				    			<tr>
				    			    <th id="numero_12" class="topo indice0">Número</th>				  
				    				<th id="criterio_12" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_12" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_121">
				    		    <td headers="numero_12" class="celula">1.2.1</td>
				    			<td headers="criterio_12" class="celula">Presença de tags HTML sem atributo e conteúdo de texto</td>
				    			<td headers="como_avaliar_12" class="celula">Verificar a presença de tags HTML que apresentem inicio e fechamento, mas sem conteúdo de texto. Possível exemplo seria &lt;a&gt;&lt;/a&gt; ou &lt;div&gt;&lt;/div&gt;.</td>
				    		</tr>
				    		<tr id="criterio_122">
				    		    <td headers="numero_12" class="celula">1.2.2</td>
				    			<td headers="criterio_12" class="celula">Elementos utilizados de forma não semântica</td>
				    			<td headers="como_avaliar_12" class="celula">Verificar a presença de tags HTML com uso distinto da finalidade. Exemplo: tag &lt;p&gt; parágrafo sendo utilizada para simular quebra de linha, sendo a utilização correta a delimitação de texto.</td>
				    		</tr>
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 1.3 - Utilizar corretamente os níveis de cabeçalho</h3>
				    <p class="criterios">Os níveis de cabeçalho (elementos HTML H1 a H6) devem ser utilizados de forma hierárquica, pois organizam a ordem de importância e subordinação dos conteúdos, facilitando a leitura e compreensão.</p>
		            
		            <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 1.3</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_13" class="topo  indice0">Número</th>
				    				<th id="criterio_13" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_13" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_131">
				    		    <td headers="numero_13" class="celula">1.3.1</td>
				    			<td headers="criterio_13" class="celula">Os niveis de título não foram utilizados</td>
				    			<td headers="como_avaliar_13" class="celula">Verificar a ausência dos níveis de cabeçalho (&lt;h1&gt;, &lt;h2&gt;, &lt;h3&gt;, &lt;h4&gt;, &lt;h5&gt;, &lt;h6&gt;) nas páginas HTML.</td>
				    		</tr>
				    		<tr id="criterio_132">
				    		    <td headers="numero_13" class="celula">1.3.2</td>
				    			<td headers="criterio_13" class="celula">A hierarquia dos níveis de título está incorreta</td>
				    			<td headers="como_avaliar_13" class="celula">Verificar a falta de ordem sequencial da presença de níveis de cabeçalho. Exemplo: a presença do nível &lt;h3&gt; depende do nível anterior &lt;h2&gt;.</td>
				    		</tr>
				    		<tr id="criterio_133">
				    		    <td headers="numero_13" class="celula">1.3.3</td>
				    			<td headers="criterio_13" class="celula">Foi utilizado somente o nível &lt;h1&gt;</td>
				    			<td headers="como_avaliar_13" class="celula">Verificar a presença do nível da cabeçalho &lt;h1&gt; sem categorizar outros assuntos da página em níveis de cabeçalho.</td>
				    		</tr>
				    		<tr id="criterio_134">
				    		    <td headers="numero_13" class="celula">1.3.4</td>
				    			<td headers="criterio_13" class="celula">Presença de mais de 1 cabeçalho</td>
				    			<td headers="como_avaliar_13" class="celula">Verificar a presença de níveis de cabeçalho &lt;h1&gt; sendo utilizados de forma repetida.</td>
				    		</tr>
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 1.4 - Ordenar de forma lógica e intuitiva a leitura e tabulação</h3>
				    <p class="criterios">Deve-se criar o código HTML com uma sequência lógica de leitura para percorrer links, controles de formulários e objetos. Essa sequência é determinada pela ordem em que se encontra no código HTML.</p>
		            
		            <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 1.4</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_14" class="topo indice0">Número</th>
				    				<th id="criterio_14" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_14" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_141">
				    		    <td headers="numero_14" class="celula">1.4.1</td>
				    			<td headers="criterio_14" class="celula">O bloco de conteúdo não esta antes do bloco de menu no HTML</td>
				    			<td headers="como_avaliar_14" class="celula">Verificar se a presença do código da página que representa o menu está posicionado depois do código que representa o conteúdo da página HTML.</td>
				    		</tr>
				    		<tr id="criterio_142">
				    		    <td headers="numero_14" class="celula">1.4.2</td>
				    			<td headers="criterio_14" class="celula">Presença do atributo "tabindex"</td>
				    			<td headers="como_avaliar_14" class="celula">Verificar a presença de utilização do tabindex nas páginas HTML.</td>
				    		</tr>
				    		<tr id="criterio_143">
				    		    <td headers="numero_14" class="celula">1.4.3</td>
				    			<td headers="criterio_14" class="celula">Uso incorreto do "tabindex"</td>
				    			<td headers="como_avaliar_14" class="celula">Verificar a presença do conteúdo -1 do atributo "tabindex" com o intuito de não influenciar a ordem do código da página, ou verificar se a presença de conteúdo do tabindex esta superior a 32767 e inferior a 0.</td>
				    		</tr>
				    		
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 1.5 - Fornecer âncoras para ir direto a um bloco de conteúdo </h3>
				    <p class="criterios">Devem ser fornecidas âncoras, disponíveis na barra de acessibilidade, que apontem para links relevantes presentes na mesma página. Assim, é possivel ir ao bloco do conteúdo desejado. Os links devem ser colocados em lugares estratégicos da página, como no início e fim do conteúdo e início e fim do menu. É importante ressaltar que o primeiro link da página deve ser o: "ir para o conteúdo".</p>
		            
		            <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 1.5</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_15" class="topo indice0">Número</th>
				    				<th id="criterio_15" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_15" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_151">
				    		    <td headers="numero_15" class="celula">1.5.1</td>
				    			<td headers="criterio_15" class="celula">Não foram encontradas âncoras que permitam saltar pelas diferentes seções da página</td>
				    			<td headers="como_avaliar_15" class="celula">Verificar a ausência de links com conteúdo do atributo "href" que comecem com "#".</td>
				    		</tr>
				    		<tr id="criterio_152">
				    		    <td headers="numero_15" class="celula">1.5.2</td>
				    			<td headers="criterio_15" class="celula">Foram encontradas âncoras que permitem saltar pelas diferentes seções da página, porém algumas não possuem um destino correspondente</td>
				    			<td headers="como_avaliar_15" class="celula">Verificar a presença de links com conteúdo do atributo "href" que comecem com "#", porém não há o destino da âncora na página HTML.</td>
				    		</tr>
				    		<tr id="criterio_153">
				    		    <td headers="numero_15" class="celula">1.5.3</td>
				    			<td headers="criterio_15" class="celula">Não existem atalhos</td>
				    			<td headers="como_avaliar_15" class="celula">Verificar a ausência de tags HTML com atributo "accesskey" na página.</td>
				    		</tr>
				    		<tr id="criterio_154">
				    		    <td headers="numero_15" class="celula">1.5.4</td>
				    			<td headers="criterio_15" class="celula">O primeiro link é uma âncora para o conteúdo da página</td>
				    			<td headers="como_avaliar_15" class="celula">Verificar a presença de link com conteúdo do atributo "href" que comece com "#", e o destino da âncora seja um conteúdo específico da página HTML.</td>
				    		</tr>
				    		<tr id="criterio_155">
				    		    <td headers="numero_15" class="celula">1.5.5</td>
				    			<td headers="criterio_15" class="celula">O primeiro link é uma âncora válida para o conteúdo principal da página</td>
				    			<td headers="como_avaliar_15" class="celula">Verificar a presença de link com conteúdo do atributo "href" que comece com "#", e o destino da âncora seja para o conteúdo principal da página HTML.</td>
				    		</tr>
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 1.6 - Não utilizar tabelas para diagramação</h3>
				    <p class="criterios">As tabelas devem ser utilizadas apenas para dados tabulares e não para efeitos de disposição dos elementos da página.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 1.6</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_16" class="topo indice0">Número</th>
				    				<th id="criterio_16" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_16" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_161">
				    		    <td headers="numero_16" class="celula">1.6.1</td>
				    			<td headers="criterio_16" class="celula">Foram utizadas tabelas</td>
				    			<td headers="como_avaliar_16" class="celula">Verificar a presença da tag &lt;table&gt; na página HTML.</td>
				    		</tr>
				    		
				    		<tr id="criterio_162">
				    		    <td headers="numero_16" class="celula">1.6.2</td>
				    			<td headers="criterio_16" class="celula">Há formulário construído dentro de tabela</td>
				    			<td headers="como_avaliar_16" class="celula">Verificar a presença da tag &lt;form&gt; entre a tag &lt;table&gt;.</td>
				    		</tr>
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 1.7 - Separar links adjacentes</h3>
				    <p class="criterios">Links adjacentes devem ser separados por mais do que simples espaços, para que não fiquem confusos, em especial para usuários que utilizam leitor de tela. Para isso, é recomendado o uso de listas, onde cada elemento dentro da lista é um link. As listas podem ser estilizadas visualmente com CSS para que os itens sejam mostrados da maneira desejada, como um ao lado do outro.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 1.7</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_17" class="topo indice0">Número</th>
				    				<th id="criterio_17" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_17" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_171">
				    		    <td headers="numero_17" class="celula">1.7.1</td>
				    			<td headers="criterio_17" class="celula">Há links adjacentes sem nenhum tipo de separação ou separação por espaços em branco</td>
				    			<td headers="como_avaliar_17" class="celula">Verificar a presença de links dispostos numa forma sequencial sem separação explicita (caracteres especiais) ou separação explicita por espaços em branco.</td>
				    		</tr>
				    		
				    		
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 1.8 - Dividir as áreas de informação</h3>
				    <p class="criterios">Áreas de informação devem ser divididas em grupos fáceis de gerenciar. As divisões mais comuns são: "topo", "conteúdo", "menu" e "rodapé". Nas páginas internas deve-se manter uma mesma divisão para que o usuário se familiarize mais rapidamente com a estrutura do sítio. É importante destacar, entretanto, que a página inicial pode ter uma divisão diferente das páginas internas, pois ela normalmente contém mais elementos.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 1.8</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_18" class="topo indice0">Número</th>
				    				<th id="criterio_18" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_18" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_181">
				    		    <td headers="numero_18" class="celula">1.8.1</td>
				    			<td headers="criterio_18" class="celula">Ausência de divisão de áreas quando do uso HTML 5</td>		
				    			<td headers="como_avaliar_18" class="celula">Verificar a ausência das tags: &lt;header&gt;, &lt;footer&gt;, &lt;section&gt;, &lt;aside&gt;, &lt;nav&gt; e &lt;article&gt;.</td>
				    		</tr>
				    		
				    		<tr id="criterio_182">
				    		    <td headers="numero_18" class="celula">1.8.2</td>
				    			<td headers="criterio_18" class="celula">Ausência de divisão de áreas quando do uso de LANDMARKS de HTML</td>		
				    		    <td headers="como_avaliar_18" class="celula">Verificar a ausência do atributo "role" nas tags HTML com os conteúdos: "banner", "complementary", "contentinfo", "main", "navigation" e "search".</td>
				    		</tr>
				    		
				    		
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 1.9 - Não abrir novas instâncias sem a solicitação do usuário</h3>
				    <p class="criterios">A decisão de utilizar-se de novas instâncias - por exemplo abas ou janelas - para acesso a páginas, serviços ou qualquer informação, deve ser de escolha do usuário.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 1.9</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_19" class="topo indice0">Número</th>
				    				<th id="criterio_19" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_19" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_191">
				    		    <td headers="numero_19" class="celula">1.9.1</td>
				    			<td headers="criterio_19" class="celula">Há link que abre nova página ou aba</td>		
				    			<td headers="como_avaliar_19" class="celula">Verificar a presença de links com atributo "target" preenchido com "_blank".</td>
				    		</tr>
				    					    		
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 2.1 - Disponibilizar todas as funções da página via teclado</h3>
				    <p class="criterios">Todas as funções da página que utilizam linguagens de script (javascript) devem ser programadas, primeiramente, para o uso com o teclado. O foco não deverá estar bloqueado ou fixado em um elemento da página, para que o usuário possa mover-se pelo teclado por todos os elementos. Isso inclui movimentação em janelas modais (abertura de janela de dialogo que bloqueia qualquer interação com a janela principal). </p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 2.1</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_21" class="topo indice0">Número</th>
				    				<th id="criterio_21" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_21" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_211">
				    		    <td headers="numero_21" class="celula">2.1.1</td>
				    			<td headers="criterio_21" class="celula">Há funcionalidade que só funciona pelo mouse usuário</td>		
				    			<td headers="como_avaliar_21" class="celula">Verificar a presença dos eventos nas tags HTML (onmousedown, onmouseup, onmouseover, onmouseout) e a ausência de evento para permitir a manipulação por teclado.</td>
				    		</tr>
				    				
				    		<tr id="criterio_212">
				    		    <td headers="numero_21" class="celula">2.1.2</td>
				    			<td headers="criterio_21" class="celula"> Presença de eventos associados a elementos não interativos</td>		
				    			<td headers="como_avaliar_21" class="celula">Verificar a presença de eventos HTML a elementos estáticos da página HTML. Um exemplo é a presença de mudança de contexto no nível de cabeçalho.</td>
				    		</tr>			    		
				    	</tbody>
				    </table>
				    
		            <h3 class="subtitulo">Recomendação 2.2 - Garantir que os objetos programáveis sejam acessíveis</h3>
				    <p class="criterios">Deve-se garantir que scripts, conteúdos dinâmicos e outros elementos programáveis sejam acessíveis e que seja possível sua execução via navegação.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 2.2</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_22" class="topo indice0">Número</th>
				    				<th id="criterio_22" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_22" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_221">
				    		    <td headers="numero_22" class="celula">2.2.1</td>
				    			<td headers="criterio_22" class="celula">Presença de elemento SCRIPT sem o elemento NOSCRIPT</td>		
				    			<td headers="como_avaliar_22" class="celula">Verificar a presença do elemento &lt;script&gt; sem o elemento &lt;noscript&gt; na página.</td>
				    		</tr>		
				    		<tr id="criterio_222">
				    		    <td headers="numero_22" class="celula">2.2.2</td>
				    			<td headers="criterio_22" class="celula">Presença de elemento OBJECT sem o conteúdo alternativo</td>		
				    			<td headers="como_avaliar_22" class="celula">Verificar a presença do elemento &lt;object&gt; sem texto entre os elementos. Exemplo: &lt;object&gt; Digite aqui o texto alternativo &lt;/object&gt;.</td>
				    		</tr>	
				    		
				    		<tr id="criterio_223">
				    		    <td headers="numero_22" class="celula">2.2.3</td>
				    			<td headers="criterio_22" class="celula">Presença de elemento EMBED na página HTML</td>		
				    			<td headers="como_avaliar_22" class="celula">Verificar a presença do elemento &lt;embed&gt; sem texto entre os elementos. Exemplo: &lt;embed&gt; Digite aqui o texto alternativo &lt;/embed&gt;.</td>
				    		</tr>
				    		
				    		<tr id="criterio_224">
				    		    <td headers="numero_22" class="celula">2.2.4</td>
				    			<td headers="criterio_22" class="celula">Presença de elemento APPLET na página HTML</td>		
				    			<td headers="como_avaliar_22" class="celula">Verificar a presença do elemento &lt;applet&gt; sem texto entre os elementos. Exemplo:&lt;applet&gt; Digite aqui o texto alternativo &lt;/applet&gt;.</td>
				    		</tr>				    		
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 2.3 - Não criar páginas com atualização automática periódica</h3>
				    <p class="criterios">A atualização automática periódica tira do usuário a autonomia em relação à escolha (semelhante a abertura de novas instâncias em navegadores) e podem confundir e desorientar os usuários, especialmente usuários que utilizam leitores de tela.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 2.3</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_23" class="topo indice0">Número</th>
				    				<th id="criterio_23" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_23" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_231">
				    		    <td headers="numero_23" class="celula">2.3.1</td>
				    			<td headers="criterio_23" class="celula">Página que se atualiza automaticamente</td>		
				    			<td headers="como_avaliar_23" class="celula">Verificar a presença do elemento &lt;meta&gt; e o atributo "HTTP-EQUIV" com o conteúdo "refresh" ou a presença das funções javascript: setTimeout() e setInterval() com a função para carregar a mesma página.</td>
				    		</tr>
				    				
				    						    		
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 2.4 - Não utilizar o redirecionamento automático de páginas</h3>
				    <p class="criterios">Não devem ser utilizadas marcações para redirecionar a uma nova página, porque tira do usuário a autonomia em relação à escolha (semelhante a abertura de novas instâncias em navegadores) e podem confundir e desorientar os usuários, especialmente usuários que utilizam leitores de tela.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 2.4</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_24" class="topo indice0">Número</th>
				    				<th id="criterio_24" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_24" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_241">
				    		    <td headers="numero_24" class="celula">2.4.1</td>
				    			<td headers="criterio_24" class="celula">Há redirecionamento automático</td>		
				    			<td headers="como_avaliar_24" class="celula">Verificar a presença do elemento &lt;meta&gt; e atributo "HTTP-EQUIV" com conteúdo "refresh" e atributo "content" ou a presença do elemento &lt;script&gt; com a função "window.location".</td>
				    		</tr>
				    				
				    						    		
				    	</tbody>
				    </table>
				    
				     <h3 class="subtitulo">Recomendação 2.6 - Não incluir situações com intermitência de tela</h3>
				    <p class="criterios">Não devem ser utilizados efeitos visuais piscantes, intermitentes ou cintilantes. Em pessoas com epilepsia fotosensitiva, o cintilar ou piscar podem desencadear um ataque epilético. A exigência dessa diretriz aplica-se também para a propaganda de terceiros inserida na página.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 2.6</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_26" class="topo indice0">Número</th>
				    				<th id="criterio_26" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_26" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_261">
				    		    <td headers="numero_26" class="celula">2.6.1</td>
				    			<td headers="criterio_26" class="celula">Presença do elemento BLINK</td>		
				    			<td headers="como_avaliar_26" class="celula">Presença do elemento &lt;blink&gt; na página HTML.</td>
				    		</tr>
				    		
				    		<tr id="criterio_262">
				    		    <td headers="numero_26" class="celula">2.6.2</td>
				    			<td headers="criterio_26" class="celula">Presença do elemento MARQUEE</td>		
				    			<td headers="como_avaliar_26" class="celula">Presença do elemento &lt;marquee&gt; na página HTML.</td>
				    		</tr>
				    		
				    		<tr id="criterio_263">
				    		    <td headers="numero_26" class="celula">2.6.3</td>
				    			<td headers="criterio_26" class="celula">Presença do elemento IMG com arquivo GIF com intermitência de tela</td>		
				    			<td headers="como_avaliar_26" class="celula">Presença do elemento &lt;img&gt; e atributo "src" contendo arquivo com extensão "gif" e o arquivo apresenta movimentação.</td>
				    		</tr>
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 3.1 - Identificar o idioma principal da página</h3>
				    <p class="criterios">Deve-se identificar o principal idioma utilizado nos documentos e páginas HTML.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 3.1</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_31" class="topo indice0">Número</th>
				    				<th id="criterio_31" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_31" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_311">
				    		    <td headers="numero_31" class="celula">3.1.1</td>
				    			<td headers="criterio_31" class="celula">Não há identificação do idioma principal da página</td>		
				    			<td headers="como_avaliar_31" class="celula">Verificar a ausência do atributo "lang" no elemento &lt;html&gt;, quando o elemento &lt;doctype&gt; for do tipo Strict (<a
						href="http://www.w3.org/TR/html4/strict.dtd">http://www.w3.org/TR/html4/strict.dtd</a>), Transitional (<a
						href="http://www.w3.org/TR/html4/loose.dtd">http://www.w3.org/TR/html4/loose.dtd</a>), Frameset (<a
						href="http://www.w3.org/TR/html4/frameset.dtd">http://www.w3.org/TR/html4/frameset.dtd</a>), linguagem HTML 5, ou verificar a não presença do atributo "xml:lang", quando o elemento &lt;doctype&gt; for do tipo Strict (<a
						href="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd</a>), frameset (<a
						href="http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd</a>), xhtml 1.1 (<a
						href="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd</a>), transitional (<a
						href="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd</a>).</td>
				    		</tr>
				    		
				    		<tr id="criterio_312">
				    		    <td headers="numero_31" class="celula">3.1.2</td>
				    			<td headers="criterio_31" class="celula">Presença do elemento HTML, atributo XMLNS, atributo XML;LANG e a ausência do atributo LANG</td>		
				    			<td headers="como_avaliar_31" class="celula">Verificar a presença dos atributos "xmlns" e "xml-lang" e a ausência do atributo "lang".</td>
				    		</tr>
				    		
				    		
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 3.2 - Informar a mudança de idioma no conteúdo</h3>
				    <p class="criterios">Se algum elemento de uma página possuir conteúdo em um idioma diferente do principal, este deverá estar identificado.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 3.2</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_32" class="topo indice0">Número</th>
				    				<th id="criterio_32" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_32" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_321">
				    		    <td headers="numero_32" class="celula">3.2.1</td>
				    			<td headers="criterio_32" class="celula">Presença de atributo LANG nos elementos da página, além da tag HTML</td>		
				    			<td headers="como_avaliar_32" class="celula">Verificar a presença do atributo "lang" nos elementos da página html, não considerando o elemento &lt;html&gt;.</td>				    		</tr>
				    		
				    					    		
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 3.3 - Oferecer um título descritivo e informativo à página</h3>
				    <p class="criterios">O título da página deve ser descritivo e informativo, devendo representar o conteúdo principal da página, já que essa informação será a primeira a ser lida pelo leitor de tela, quando o usuário acessar a página.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 3.3</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_33" class="topo indice0">Número</th>
				    				<th id="criterio_33" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_33" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_331">
				    		    <td headers="numero_33" class="celula">3.3.1</td>
				    			<td headers="criterio_33" class="celula">Não há título para a página, ou está em branco</td>		
				    			<td headers="como_avaliar_33" class="celula">Verificar a ausência da tag &lt;title&gt; na página HTML, ou verificar a presença do tag &lt;title&gt; sem conteúdo de texto para a identificação da página.</td>				    		
				    		</tr>
				    	   		
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 3.5 - Descrever links clara e sucintamente</h3>
				    <p class="criterios">Deve-se identificar claramente o destino da cada link, informando, inclusive, se o link remete a outro sítio. Além disso, é preciso que o texto do link faça sentido mesmo quando isolado do contexto da página.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 3.5</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_35" class="topo indice0">Número</th>
				    				<th id="criterio_35" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_35" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_351">
				    		    <td headers="numero_35" class="celula">3.5.1</td>
				    			<td headers="criterio_35" class="celula">Link com descrição no formato de URL</td>		
				    			<td headers="como_avaliar_35" class="celula"> Presença do elemento &lt;a&gt; e descrição do texto em formato de endereço texto da internet. Lembrar que não importará se o link do texto será igual ou não presente no atributo "href".</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_352">
				    		    <td headers="numero_35" class="celula">3.5.2</td>
				    			<td headers="criterio_35" class="celula">Links vazios</td>		
				    			<td headers="como_avaliar_35" class="celula">Presença do elemento &lt;a&gt; e ausência de texto descritivo.</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_353">
				    		    <td headers="numero_35" class="celula">3.5.3</td>
				    			<td headers="criterio_35" class="celula">Link com descrição somente do TITLE</td>		
				    			<td headers="como_avaliar_35" class="celula">Presença do elemento &lt;a&gt;, atributo "title" com texto descritivo e ausência de texto descritivo na estrutura principal do link.</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_354">
				    		    <td headers="numero_35" class="celula">3.5.4</td>
				    			<td headers="criterio_35" class="celula">Links que são imagens sem descrição</td>		
				    			<td headers="como_avaliar_35" class="celula">Presença do elemento &lt;a&gt; e dentro o elemento &lt;img&gt; sem conteúdo descritivo no atributo "alt".</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_355">
				    		    <td headers="numero_35" class="celula">3.5.5</td>
				    			<td headers="criterio_35" class="celula">Links do tipo "clique aqui", "leia mais", "veja mais", "veja aqui", "clique", "acesse aqui", "clique para acessar", "aqui", entre outros</td>		
				    			<td headers="como_avaliar_35" class="celula">Presença do elemento &lt;a&gt; e de texto descritivo com as palavras exatas ou palavras começando no texto do inicio do link: "clique aqui", "leia mais", "veja aqui", "veja mais", "veja aqui", "clique", "acesse aqui", "clique para acessar", "aqui".</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_356">
				    		    <td headers="numero_35" class="celula">3.5.6</td>
				    			<td headers="criterio_35" class="celula">Links com descrições diferentes que remetem ao mesmo local</td>		
				    			<td headers="como_avaliar_35" class="celula">Presença do elemento &lt;a&gt; com texto descritivo diferente, porém os conteúdos dos href's remetem para o mesmo link.</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_357">
				    		    <td headers="numero_35" class="celula">3.5.7</td>
				    			<td headers="criterio_35" class="celula">Links com a mesma descrição que remetem a locais diferentes</td>		
				    			<td headers="como_avaliar_35" class="celula">Presença do elemento &lt;a&gt; com texto descritivo igual, porém os conteúdos dos href's remetem para links diferentes.</td>				    		
				    		</tr>
				    	   		
				    	   	<tr id="criterio_358">
				    		    <td headers="numero_35" class="celula">3.5.8</td>
				    			<td headers="criterio_35" class="celula">Links que são lidos duas ou mais vezes</td>		
				    			<td headers="como_avaliar_35" class="celula">Presença do elemento &lt;a&gt; com o mesmo conteúdo descritivo em locais distintos da página HTML.</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_359">
				    		    <td headers="numero_35" class="celula">3.5.9</td>
				    			<td headers="criterio_35" class="celula">Links com descrição muito longa</td>		
				    			<td headers="como_avaliar_35" class="celula">Presença do elemento &lt;a&gt; com conteúdo do texto descrito com quantidade de caracteres acima de 2000.</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_3510">
				    		    <td headers="numero_35" class="celula">3.5.10</td>
				    			<td headers="criterio_35" class="celula">Links que remetem a páginas indisponiveis/inexistentes (links quebrados)</td>		
				    			<td headers="como_avaliar_35" class="celula">Presença do elemento &lt;a&gt; e o conteúdo do atributo "href" direciona para páginas de erros: 404, 405, 503 e outros.</td>				    		
				    		</tr>
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 3.6 - Fornecer alternativa em texto para as imagens do sítio</h3>
				    <p class="criterios">Deve ser fornecida uma descrição para as imagens da página.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 3.6</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_36" class="topo indice0">Número</th>
				    				<th id="criterio_36" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_36" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_361">
				    		    <td headers="numero_36" class="celula">3.6.1</td>
				    			<td headers="criterio_36" class="celula">Imagens sem a declaração do atributo ALT</td>		
				    			<td headers="como_avaliar_36" class="celula">Presença de elementos &lt;img&gt; e ausência do atributo "alt".</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_362">
				    		    <td headers="numero_36" class="celula">3.6.2</td>
				    			<td headers="criterio_36" class="celula">Imagens com conteúdo sem descrição</td>		
				    			<td headers="como_avaliar_36" class="celula">Presença de elementos &lt;img&gt; e ausência de conteúdo descritivo do atributo "alt".</td>				    		
				    		</tr>
				    	   		
				    	   	<tr id="criterio_363">
				    		    <td headers="numero_36" class="celula">3.6.3</td>
				    			<td headers="criterio_36" class="celula">Imagens com descrição igual ao nome do arquivo</td>		
				    			<td headers="como_avaliar_36" class="celula">Presença de elementos &lt;img&gt; e atributo "alt" com conteúdo descrito com o nome do arquivo de referência da imagem.</td>				    		
				    		</tr>	
				    		
				    		<tr id="criterio_364">
				    		    <td headers="numero_36" class="celula">3.6.4</td>
				    			<td headers="criterio_36" class="celula">Imagens com descrição comum</td>		
				    			<td headers="como_avaliar_36" class="celula">Presença de elementos &lt;img&gt; e atributo "alt" com conteúdo descrito com expressões: "figura"; "imagem"; "alt"; conteúdo em branco e outros.</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_365">
				    		    <td headers="numero_36" class="celula">3.6.5</td>
				    			<td headers="criterio_36" class="celula">Imagens diferentes com a mesma descrição</td>		
				    			<td headers="como_avaliar_36" class="celula">Presença de elementos &lt;img&gt; com o mesmo atributo "src", no entanto, o conteúdo do atributo "alt" não é o mesmo de cada imagem.</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_366">
				    		    <td headers="numero_36" class="celula">3.6.6</td>
				    			<td headers="criterio_36" class="celula">Imagens com dupla descrição, pois utiliza atributo TITLE com o mesmo valor da descrição</td>		
				    			<td headers="como_avaliar_36" class="celula">Presença de elementos &lt;img&gt; com o mesmo conteúdo descrito no atributo "title" e no atributo "alt".</td>				    		
				    		</tr>
				   		</tbody>
				    </table>
				    		
				    		
				    <h3 class="subtitulo">Recomendação 3.7 - Ulilizar mapas de imagem de forma acessível</h3>
				    <p class="criterios">Um mapa de imagens é uma imagem dividida em áreas selecionáveis. Cada área é um link para outra página Web ou outra seção da página atual.</p>
				    
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 3.7</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_37" class="topo indice0">Número</th>
				    				<th id="criterio_37" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_37" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_371">
				    		    <td headers="numero_37" class="celula">3.7.1</td>
				    			<td headers="criterio_37" class="celula">Mapa de imagem sem descrição ou alternativa em texto</td>		
				    			<td headers="como_avaliar_37" class="celula"> Presença do elemento &lt;img&gt; com atributo "usemap" e ausência de conteúdo descritivo no atributo "alt", ou presença do elemento &lt;area&gt; e ausência de conteúdo descritivo no atributo "alt".</td>				    		
				    		</tr>
				    		
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 3.9 - Em tabelas, utilizar títulos e resumos de forma apropriada</h3>
				    <p class="criterios">O título da tabela deve ser definido e localizado no primeiro elemento da tabela. Em casos de tabelas extensas, deve ser fornecido um resumo dos dados.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 3.9</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_39" class="topo indice0">Número</th>
				    				<th id="criterio_39" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_39" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_391">
				    		    <td headers="numero_39" class="celula">3.9.1</td>
				    			<td headers="criterio_39" class="celula">Tabelas sem título e resumo</td>		
				    			<td headers="como_avaliar_39" class="celula">Presença do elemento &lt;table&gt; e ausência do atributo "summary" ou ausência do elemento &lt;caption&gt;.</td>				    		
				    		</tr>
				    		
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 3.10 - Associar células de dados às células de cabeçalho</h3>
				    <p class="criterios">Em tabelas de dados simples, o uso apropriado dos cabeçalhos e das colunas para as células de dados.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 3.10</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_3100" class="topo indice0">Número</th>
				    				<th id="criterio_3100" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_3100" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_3101">
				    		    <td headers="numero_3100" class="celula">3.10.1</td>
				    			<td headers="criterio_3100" class="celula">Tabelas sem células associadas</td>		
				    			<td headers="como_avaliar_3100" class="celula">Presença do elemento &lt;table&gt; e ausência dos elementos: &lt;thead&gt;, &lt;tbody&gt; ou a presença do elemento &lt;table&gt; e ausência dos atributos: "id", "headers", "scope", "axis" nos elementos &lt;td&gt; e &lt;th&gt;.</td>				    		
				    		</tr>
				    		
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 3.11 - Garantir a leitura e compreensão das informações</h3>
				    <p class="criterios">O texto de um sítio deve ser de fácil leitura e compreensão, não exigindo do usuário um nível de instrução avançado. Quando o texto exigir uma capacidade de leitura mais avançada, devem ser disponibilizadas informações suplementares que expliquem ou ilustrem o conteúdo principal.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 3.11</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_3110" class="topo indice0">Número</th>
				    				<th id="criterio_3110" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_3110" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_3111">
				    		    <td headers="numero_3110" class="celula">3.11.1</td>
				    			<td headers="criterio_3110" class="celula">Presença de parágrafos justificados</td>		
				    			<td headers="como_avaliar_3110" class="celula">Presença de elementos &lt;p&gt; com conteúdo "justify" no atributo "align".</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_3112">
				    		    <td headers="numero_3110" class="celula">3.11.2</td>
				    			<td headers="criterio_3110" class="celula">Presença de textos justificados através de folhas de estilo</td>		
				    			<td headers="como_avaliar_3110" class="celula">Presença de elementos &lt;p&gt; e propriedade CSS text-align com conteúdo "justify". Deverá ser avaliado o CSS externo (com arquivo CSS referenciado pelo elemento &lt;link&gt;), interno (propriedade dentro do elemento &lt;style&gt;) e in-line (propriedade dentro do atributo "style" no elemento &lt;p&gt;).</td>				    		
				    		</tr>
				    		
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 3.12 - Disponibilizar uma explicação para siglas, abreviaturas e palavras incomuns</h3>
				    <p class="criterios">Recomenda-se que na primeira ocorrência de siglas, abreviaturas ou palavras incomuns (ambíguas, desconhecidas ou utilizadas de forma muito específica), deve ser disponibilizada sua explicação ou forma completa.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 3.12</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_3120" class="topo  indice0">Número</th>
				    				<th id="criterio_3120" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_3120" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_3121">
				    		    <td headers="numero_3120" class="celula">3.12.1</td>
				    			<td headers="criterio_3120" class="celula">Siglas marcadas e sem explicação</td>		
				    			<td headers="como_avaliar_3120" class="celula">Presença dos elementos &lt;abbr&gt; ou &lt;acronym&gt; e ausência do atributo "title" para descrever a sigla.</td>				    		
				    		</tr>
				    						    						    		
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 4.4 - Possibilitar que o elemento com foco seja visualmente evidente</h3>
				    <p class="criterios">A área que recebe o foco pelo teclado deve ser claramente marcada, devendo a área de seleção ser passível de ser clicada.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 4.4</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_44" class="topo indice0">Número</th>
				    				<th id="criterio_44" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_44" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_441">
				    		    <td headers="numero_44" class="celula">4.4.1</td>
				    			<td headers="criterio_44" class="celula">Ausência de destaque de foco do elemento ativo</td>		
				    			<td headers="como_avaliar_44" class="celula">Verificar a ausência de destaque nos elementos HTML. Para verificação, analisar a ausência de utilização da propriedade "border" dentro dos seletores CSS.</td>				    		
				    		</tr>
				    						    						    		
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 5.1 - Fornecer alternativa para video</h3>
				    <p class="criterios">Deve haver uma alternativa sonora ou textual para vídeos que não incluem faixas de áudio.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 5.1</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_51" class="topo indice0">Número</th>
				    				<th id="criterio_51" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_51" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_511">
				    		    <td headers="numero_51" class="celula">5.1.1</td>
				    			<td headers="criterio_51" class="celula">Presença de vídeo na página</td>		
				    			<td headers="como_avaliar_51" class="celula">Presença do elemento &lt;embed&gt; ou &lt;video&gt; com atributos "src" direcionados para arquivo de vídeo ou local de execução de vídeo.</td>				    		
				    		</tr>
				    						    						    		
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 5.2 - Fornecer alternativa para áudio</h3>
				    <p class="criterios">Áudio gravado deve possuir uma transcrição descritiva. Além de essencial para pessoas com deficiência auditiva, a alternativa em texto também é importante para úsuarios que não possuem equipamento de som, que desejam apenas realizar a leitura do material ou não dispôem de tempo para ouvir um arquivo multimídia. Neste caso, também é desejavel a alternativa em Libras.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 5.2</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_52" class="topo indice0">Número</th>
				    				<th id="criterio_52" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_52" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_521">
				    		    <td headers="numero_52" class="celula">5.2.1</td>
				    			<td headers="criterio_52" class="celula">Presença de áudio na página</td>		
				    			<td headers="como_avaliar_52" class="celula">Presença do elemento &lt;embed&gt; ou &lt;audio&gt; com atributos "src" direcionados para arquivo de audio ou local de execução de áudio.</td>				    		
				    		</tr>
				    						    						    		
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 5.3 - Oferecer audiodescrição para vídeo pré-gravado</h3>
				    <p class="criterios">A página deve continuar legível e funcional mesmo quando redimensionada para até 200%. Assim, é preciso garantir que, quando a página for redimensionada, não ocorram sobreposições nem o aparecimento de uma barra horizontal.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 5.3</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_53" class="topo indice0">Número</th>
				    				<th id="criterio_53" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_53" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_531">
				    		    <td headers="numero_53" class="celula">5.3.1</td>
				    			<td headers="criterio_53" class="celula">Presença de vídeo na página</td>		
				    			<td headers="como_avaliar_53" class="celula">Presença do elemento &lt;embed&gt; ou &lt;vídeo&gt; com atributos "src" direcionados para arquivo de vídeo ou local de execução de vídeo.</td>				    		
				    		</tr>
				    						    						    		
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 5.4 - Fornecer controle de áudio para som</h3>
				    <p class="criterios">Deve ser fornecido um mecanismo para parar, pausar, silenciar ou ajustar o volume de qualquer som que se reproduza na página.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 5.4</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_54" class="topo indice0">Número</th>
				    				<th id="criterio_54" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_54" class="topo  indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_541">
				    		    <td headers="numero_54" class="celula">5.4.1</td>
				    			<td headers="criterio_54" class="celula">Presença de áudio na página</td>		
				    			<td headers="como_avaliar_54" class="celula">Presença do elemento &lt;embed&gt; ou &lt;audio&gt; com atributos "src" direcionados para arquivo de áudio ou local de execução de áudio.</td>				    		
				    		</tr>
				    						    						    		
				    	</tbody>
				    </table>
                   	    
				    <h3 class="subtitulo">Recomendação 6.1 - Fornecer alternativa em texto para os botões de imagem de formulários</h3>
				    <p class="criterios">Ao serem utilizados botões do tipo imagem, que servem para o mesmo propósito do botão "submit", deve ser fornecida uma descrição textual para o botão. Para outros tipos de botões é necessario o botão pela imagem que se deseja utilizar através do CSS e aplicar o texto descrito no atributo do valor.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 6.1</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_61" class="topo indice0">Número</th>
				    				<th id="criterio_61" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_61" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_611">
				    		    <td headers="numero_61" class="celula">6.1.1</td>
				    			<td headers="criterio_61" class="celula">Botão sem descrição</td>		
				    			<td headers="como_avaliar_61" class="celula">Presença do elemento &lt;input&gt; com o conteúdo do atributo "type", "image" e ausência de conteúdo no atributo "alt" ou ausência do "alt"; presença do elemento &lt;input&gt; com os conteúdos: "button", "reset", ou "submit" e ausência de conteúdo no atributo "value" ou ausência do atributo "value".</td>				    		
				    		</tr>
				    						    						    		
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 6.2 - Associar etiquetas aos seus campos</h3>
				    <p class="criterios">As etiquetas de texto devem estar associadas aos seus campos correspondentes no formulário.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 6.2</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_62" class="topo indice0">Número</th>
				    				<th id="criterio_62" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_62" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_621">
				    		    <td headers="numero_62" class="celula">6.2.1</td>
				    			<td headers="criterio_62" class="celula">Campo sem label associado</td>		
				    			<td headers="como_avaliar_62" class="celula">Presença do elemento &lt;input&gt; e ausência de elemento &lt;label&gt; com atributo "for" referenciado ao atributo "id" do &lt;input&gt;, ou presença de elemento &lt;input&gt; sem estar dentro de elemento &lt;label&gt;.</td>				    		
				    		</tr>
				    						    						    		
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 6.3 - Estabelecer uma lógica de navegação</h3>
				    <p class="criterios">Os elementos do formulário devem ser distribuídos corretamente através do códgio HTML, criando, assim, uma sequência lógica de navegação.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 6.3</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_63" class="topo indice0">Número</th>
				    				<th id="criterio_63" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_63" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_631">
				    		    <td headers="numero_63" class="celula">6.3.1</td>
				    			<td headers="criterio_63" class="celula">Presença do elemento FORM e atributo TABINDEX</td>		
				    			<td headers="como_avaliar_63" class="celula">Presença do elemento &lt;form&gt; e atributo "tabindex" nos elementos dentro do &lt;form&gt;.</td>				    		
				    		</tr>
				    						    						    		
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 6.4 - Não provocar automaticamente alteração no contexto</h3>
				    <p class="criterios">A área que recebe o foco pelo teclado deve ser claramente marcada, devendo a área de seleção ser passível de ser clicada.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 6.4</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_64" class="topo indice0">Número</th>
				    				<th id="criterio_64" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_64" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_641">
				    		    <td headers="numero_64" class="celula">6.4.1</td>
				    			<td headers="criterio_64" class="celula">Presença de alteração automática de contexto sem que o usuário tenha conhecimento</td>		
				    			<td headers="como_avaliar_64" class="celula">Presença do elemento &lt;form&gt; e nos seus elementos internos, retirando os elementos &lt;input&gt; com os conteúdos no atributo "type": button, submit, reset; utilização dos eventos (atributos): onchange, onblur, onfocus, onformchange, onforminput, oninput, oninvalid, onreset, onselect, onsubmit, onkeydown, onkeypress, onkeyup, onclick; ou a presença do elemento &lt;form&gt; e nos seus elementos internos a utilização dos eventos (atributos): ondbclick, ondrag, ondragend, ondragcenter, ondragleave, ondragover, ondragstart, ondrop, onmousedown, onmousemove, onmouseout, onmouseover, onmouseup, onmousewheel, onscroll, ou a presença de funções javascript in-line (código javascript em elementos html), interno (código javascript dentro do elemento &lt;script&gt;) e externo (código javascript referenciado pelo elemento &lt;script&gt; por meio do atributo "src") que permitem comportamento na página sem apresentar aviso para o utilizador da página.</td>				    		
				    		</tr>
				    						    						    		
				    	</tbody>
				    </table>
				    
				    <h3 class="subtitulo">Recomendação 6.7 - Agrupar campos de formulário</h3>
				    <p class="criterios">É recomendado que os campos com informações relacionadas sejam agrupadas utilizando elementos com esta finalidade na própria linguagem HTML, principalmente em formulários longos. O agrupamento deverá ser feito de maneira lógica, explicitando claramente o propósito ou natureza dos agrupamentos.</p>
				    				     
				    <table class="tabelaCriterioSucesso">
				    		<caption class="capitulo">Critérios de Avaliação e como avaliar Recomendação 6.7</caption>
				    		<thead>
				    			<tr>				  
				    			    <th id="numero_67" class="topo indice0">Número</th>
				    				<th id="criterio_67" class="topo indice1">Critério</th>
				    				<th id="como_avaliar_67" class="topo indice2">Como avaliar</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    						    		
				    		<tr id="criterio_671">
				    		    <td headers="numero_67" class="celula">6.7.1</td>
				    			<td headers="criterio_67" class="celula">Existência de formulário e inexistência de agrupamento de campos</td>		
				    			<td headers="como_avaliar_67" class="celula">Verificar a presença do elemento &lt;form&gt; e dentro desse os elementos: &lt;input&gt;, &lt;textarea&gt;, &lt;button&gt;, &lt;select&gt;, &lt;option&gt;, &lt;label&gt; e ausência do elemento &lt;fieldset&gt;.</td>				    		
				    		</tr>
				    		
				    		<tr id="criterio_672">
				    		    <td headers="numero_67" class="celula">6.7.2</td>
				    			<td headers="criterio_67" class="celula">Uso de campo de seleção sem agrupamento.</td>		
				    			<td headers="como_avaliar_67" class="celula">Verificar a presença do elemento &lt;form&gt; e dentro desse o elemento &lt;select&gt; e ausência do elemento &lt;optgroup&gt; para conteúdos do &lt;select&gt; que precisem de agrupamento.</td>				    		
				    		</tr>
				    						    						    		
				    	</tbody>
				    </table>
				    				
	</jsp:body>
</t:baseLayout>


