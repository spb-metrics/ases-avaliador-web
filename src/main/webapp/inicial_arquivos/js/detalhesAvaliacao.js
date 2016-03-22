
$(document).ready(function()

	{
	
	//voltar Detalhar
	$("li #voltar").click(function(){		
		parent.history.back();
		return false;
	});
	
	//fim voltar Detalhar
	
	
	//Alterar a cor de fundo da linha selecionada "Código Fonte" na página de detalhes avaliar
	$("#tabelaErros2 a").click(function(){	
		
		$("a").removeClass("selecionado");
		var id = $(this).attr('href');
		$(id).addClass("selecionado");	
	
	});
	});