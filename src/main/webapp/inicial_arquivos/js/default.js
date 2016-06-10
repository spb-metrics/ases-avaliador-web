$(document).ready(function()

{

	// funcionalidade para exibir a 'tab' correspondente ao link da mensagem de
	// erro do campo vazio
	// e focar no campo obrigatório da página 'index.jsp'

	var focarMensagemErro = true;

	$("#mensagemErroCampoVazio_url").click(function() {
		focarMensagemErro = false;
		$("#tab-1").prop("checked", true);
		$("#url").focus();
		

	});

	$("#mensagemErroCampoVazio_up_file").click(function() {
		
		focarMensagemErro = false;
		$("#tab-2").prop("checked", true);
		$("#up_file").focus();
		
	});

	$("#mensagemErroCampoVazio_input").click(function() {
		focarMensagemErro = false;
		$("#tab-3").prop("checked", true);
		$("#input").focus();
		
	});
if(focarMensagemErro)
	{
	if ($("#mensagemErroCampoVazio_url").length) {
		$("#mensagemErroCampoVazio_url").focus();			
	}

	if ($("#mensagemErroCampoVazio_up_file").length) {
		$("#mensagemErroCampoVazio_up_file").focus();
		focarMensagemErro = false;
	}

	if ($("#mensagemErroCampoVazio_input").length) {
		$("#mensagemErroCampoVazio_input").focus();
		focarMensagemErro = false;
	}
	}
});

