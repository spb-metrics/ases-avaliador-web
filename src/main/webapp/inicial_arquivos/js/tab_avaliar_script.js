
$(document).ready(function()

	{
	
	//abre a aba de resultados de acordo com o link clicado
	$("#tabelaErros a").click(function(){			
		$($(this).attr('id')).prop("checked", true);
	});
	
	//abre a aba de resultados de acordo com o link clicado
	$("#tabelaErrossem_nota a").click(function(){		
		$($(this).attr('id')).prop("checked", true);
	});
	
	
	
	$("#altoContraste a").attr("href", "#");
	$("#fim_mark").attr("href", "#");					
	$("#inicio_behavior").attr("href", "#");	
	$("#fim_behavior").attr("href", "#");						
	$("#inicio_information").attr("href", "#");
	$("#fim_information").attr("href", "#");					
	$("#inicio_presentation").attr("href", "#");
	$("#fim_presentation").attr("href", "#");					
	$("#inicio_multimedia").attr("href", "#");	
	$("#fim_multimedia").attr("href", "#");
	$("#inicio_form").attr("href", "#");
	
	
	var teclaPressionada;
	var shiftPressionado;
	

	
	$(document).keydown(function(e) 
			{
		
		if(e.which != 13 )
		{			
			
			shiftPressionado = e.shiftKey;
			teclaPressionada = e.which;
			
		
			//Tab 1
			$("#fim_mark").blur(function() {				
				if (shiftPressionado == false && teclaPressionada == 9) {
								
					$("#tab-2").prop("checked", true);
				}
			});
			
									
			//fim Tab 1
	
			//Tab 2
			
			$("#inicio_behavior").blur(function() {
				
				if (shiftPressionado == true) 
				{						
					$("#tab-1").prop("checked", true);
				}
				
			});
			

			$("#fim_behavior").blur(function() {
				
				if (shiftPressionado == false && teclaPressionada == 9) 
				{					
					
					$("#tab-3").prop("checked", true);
				}
				
			});
			//fim Tab 2
			
			//Tab 3
			
			$("#inicio_information").blur(function() {
				
				if (shiftPressionado == true) 
				{					
					$("#tab-2").prop("checked", true);
				}
				
			});
			

			$("#fim_information").blur(function() {
				
				if (shiftPressionado == false && teclaPressionada == 9) 
				{					
					
					$("#tab-4").prop("checked", true);
				}
				
			});
			
			//Fim Tab 3
			
			//Tab 4
			
			$("#inicio_presentation").blur(function() {
				
				if (shiftPressionado == true) 
				{				
					$("#tab-3").prop("checked", true);
				}
				
			});
			

			$("#fim_presentation").blur(function() {
				
				if (shiftPressionado == false && teclaPressionada == 9) 
				{					
					$("#tab-5").prop("checked", true);
				}
				
			});
			
			//Fim Tab 4
			
			//Tab 5
			
			$("#inicio_multimedia").blur(function() {
				
				if (shiftPressionado == true) 
				{					
					$("#tab-4").prop("checked", true);
				}
				
			});
			

			$("#fim_multimedia").blur(function() {
				
				if (shiftPressionado == false && teclaPressionada == 9) 
				{									
					$("#tab-6").prop("checked", true);
				}
				
			});
			
			//Fim Tab 5
			
			//Tab 6
			$("#inicio_form").blur(function() {
				
				if (shiftPressionado == true) 
				{					
					$("#tab-5").prop("checked", true);
				}
				
			});
			
			//Fim tab6
			
			
		}
			});
			

	
	});