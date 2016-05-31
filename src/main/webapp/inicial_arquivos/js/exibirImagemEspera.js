$(document).ready(function() {
	
	$("#linkImagemLoadingUrl").attr("href", "#Validacao_pela_URI");
	$("#linkImagemLoadingUp_file").attr("href", "#validacaoPeloArquivo");
	$("#linkImagemLoadingHtml").attr("href", "#validacaoCodigoFonte");
	
	
	$("#input_tab_1").click(function() {
		$("#imagemLoadingUrl" ).removeClass("oculto")
		$("#validacaoPeloArquivo").addClass("tranparente");
		$("#validacaoCodigoFonte").addClass("tranparente");
		$("#linkImagemLoadingUrl").focus();
		$("#tab-2").prop('disabled', true);//desabilita o radio quando acionado uma pesquisa
		$("#tab-3").prop('disabled', true);//desabilita o radio	quando acionado uma pesquisa	
		
	});
	
	$("#input_tab_2").click(function() {
		$( "#imagemLoadingUp_file" ).removeClass("oculto");
		$("#Validacao_pela_URI").addClass("tranparente");
		$("#validacaoCodigoFonte").addClass("tranparente");
		$("#linkImagemLoadingUp_file").focus();
		$("#tab-1").prop('disabled', true);//desabilita o radio quando acionado uma pesquisa
		$("#tab-3").prop('disabled', true);//desabilita o radio quando acionado uma pesquisa	
		
	});
	
	$("#input_tab_3").click(function() {
		$( "#imagemLoadingHtml" ).removeClass("oculto")
		$("#Validacao_pela_URI").addClass("tranparente");
		$("#validacaoPeloArquivo").addClass("tranparente");
		$("#linkImagemLoadingHtml").focus();
		$("#tab-1").prop('disabled', true);//desabilita o radio quando acionado uma pesquisa
		$("#tab-2").prop('disabled', true);//desabilita o radio quando acionado uma pesquisa	
	});
	
	
	// Retoma para o inicio da tab se for clicado no link (acidentalmente)
	$("#linkImagemLoadingUrl").click(function() {		
		$("#url").val('http://');
		$("#imagemLoadingUrl").addClass("oculto");
		$( "#validacaoPeloArquivo" ).removeClass("tranparente");
		$( "#validacaoCodigoFonte" ).removeClass("tranparente");
		$("#tab-2").prop('disabled', false);//habilita o radio
		$("#tab-3").prop('disabled', false);//habilita o radio				
	});
	
	$("#linkImagemLoadingUp_file").click(function() {	
		$("#up_file").val('');
		$( "#Validacao_pela_URI" ).removeClass("tranparente");
		$( "#validacaoCodigoFonte" ).removeClass("tranparente");
		$("#imagemLoadingUp_file").addClass("oculto");				
		$("#tab-1").prop('disabled', false);//habilita o radio
		$("#tab-3").prop('disabled', false);//habilita o radio				
	});
	
	$("#linkImagemLoadingHtml").click(function() {				
		$("#imagemLoadingHtml").addClass("oculto");			
		$( "#Validacao_pela_URI" ).removeClass("tranparente");
		$( "#validacaoPeloArquivo" ).removeClass("tranparente");
		$("#tab-1").prop('disabled', false);//habilita o radio
		$("#tab-2").prop('disabled', false);//habilita o radio		
	});
});