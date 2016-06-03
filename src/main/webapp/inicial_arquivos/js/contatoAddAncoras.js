$(document).ready(function() {
	
	$("#listaErros").attr("href", "#");
	//mark_error
    	$('.addAncora').each(function(index){
    		var conteudo = $(this).text();
    	    //alert(conteudo);
    		
    		if(conteudo == 'Favor preencher o campo NOME!'){
        		 $(this).attr("href", "#nome");     		
        		}    		
    		if(conteudo == 'O campo NOME aceita até 200 caracteres.'){
      			//$("#nome").val(''); 
      			$(this).attr("href", "#nome");     		
         		}
    		 if(conteudo == 'E-MAIL considerado inválido!'){
          		 $(this).attr("href", "#email");     		
          		}
    		 if(conteudo == 'Favor preencher o campo E-MAIL!'){
         		 $(this).attr("href", "#email");     		
         		}      		    

    		 if(conteudo == 'O campo MENSAGEM aceita até 500 caracteres.'){
    	  			 
    	  			$(this).attr("href", "#mensagem");     		
    	    		}
    		 if(conteudo == 'Favor preencher o campo MENSAGEM!'){
 	  			 
 	  			$(this).attr("href", "#mensagem");     		
 	    		}
    		 
  		    if(conteudo == 'Favor escolher uma das opções no campo ASSUNTO!'){
    		 $(this).attr("href", "#assunto");     		
    		}
  		    		
  		 });    	
    	
    	$("#listaErros").focus();
  });