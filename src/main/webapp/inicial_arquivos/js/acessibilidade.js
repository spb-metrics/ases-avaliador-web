

//Contraste
function configContrastePadrao(){
		
	if(!$.cookie("contraste"))
	{
		$.cookie("contraste", "", { path: '/' });
	}

	if($.cookie("contraste") && $.cookie("contraste") != "")
	{
		$("body").addClass($.cookie("contraste"));
	}
}

function selecionaContraste(){   
	
	if ($.cookie("contraste") == "")
	{	
		$("body").addClass("contraste");
		
		$.cookie("contraste", "contraste", { path: '/' });
	}
	else
	{
		$('body').removeClass("contraste")
		
		$.cookie("contraste", "", { path: '/' });
	}
}

$(document).ready(function() {
	configContrastePadrao();

	$("#ancoraConteudo").click(function(){ gotoConteudo(); return false;});
	$("#ancoraMenu").click(function(){ gotoMenu(); return false;});
	$("#altoContraste").click(function(){selecionaContraste(); return false;});
	
	$(document).bind("keydown", "Alt+Shift+1", function(){ gotoConteudo(); return false;});
	$(document).bind("keydown", "Alt+1", function(){ gotoConteudo(); return false;});	
		
	$(document).bind("keydown", "Alt+Shift+2", function(){ gotoMenu(); return false;});
	$(document).bind("keydown", "Alt+2", function(){ gotoMenu(); return false;});

	$(document).bind("keydown", "Alt+Shift+4", function(){ selecionaContraste(); return false;});
	$(document).bind("keydown", "Alt+4", function(){ selecionaContraste(); return false;});

	$(document).bind("keydown", "Alt+Shift+5", function(){ gotoAcessibilidade(); return false;});
	$(document).bind("keydown", "Alt+5", function(){ gotoAcessibilidade(); return false;});

	$(document).bind("keydown", "Alt+Shift+6", function(){ gotoAnterior(); return false;});
	$(document).bind("keydown", "Alt+6", function(){ gotoAnterior(); return false;});

	$(document).bind("keydown", "Alt+Shift+7", function(){ gotoSeguinte(); return false;});
	$(document).bind("keydown", "Alt+7", function(){ gotoSeguinte(); return false;});
});

