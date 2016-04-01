
//Caso alguma tabela não apresente "linhas de erro", ocultará a tabela.

$(document).ready(function() {

	//mark_error
    	$('.mark_error').each(function(index){
    		
  		    if($(this).find('tbody tr').length == 0){
    		  	$(this).before( "<p>A seção não apresentou erros!</p>" );
    		  	$(this).hide();
    		}
  		 });
		  
    	
    	//mark_warning
		 $('.mark_warning').each(function(index){
	  	    if($(this).find('tbody tr').length == 0){
	    	  $(this).before( "<p>A seção não apresentou avisos!</p>" );
	    	  $(this).hide();
	    	}
	  	 });
		 
		 
		 //behavior_error
		 $('.behavior_error').each(function(index){
    		
  		    if($(this).find('tbody tr').length == 0){
    		  	$(this).before( "<p>A seção não apresentou erros!</p>" );
    		  	$(this).hide();
    		}
  		 });
		  
		 
		 //behavior_warning
		 $('.behavior_warning').each(function(index){
	  	    if($(this).find('tbody tr').length == 0){
	    	  $(this).before( "<p>A seção não apresentou avisos!</p>" );
	    	  $(this).hide();
	    	}
	  	 });
		 
		 
		 //information_error
		 $('.information_error').each(function(index){
    		
  		    if($(this).find('tbody tr').length == 0){
    		  	$(this).before( "<p>A seção não apresentou erros!</p>" );
    		  	$(this).hide();
    		}
  		 });
		  
		 
		 //information_warning
		 $('.information_warning').each(function(index){
	  	    if($(this).find('tbody tr').length == 0){
	    	  $(this).before( "<p>A seção não apresentou avisos!</p>" );
	    	  $(this).hide();
	    	}
	  	 });
		 
		 //presentation_error
		 $('.presentation_error').each(function(index){
    		 
  		    if($(this).find('tbody tr').length == 0){
    		  	$(this).before( "<p>A seção não apresentou erros!</p>" );
    		  	$(this).hide();
    		}
  		 });
		  
		 
		 //presentation_warning
		 $('.presentation_warning').each(function(index){
	  	    if($(this).find('tbody tr').length == 0){
	    	  $(this).before( "<p>A seção não apresentou avisos!</p>" );
	    	  $(this).hide();
	    	}
	  	 });
		 
		 
		 
		 //multimedia_error
		 $('.multimedia_error').each(function(index){
    		
  		    if($(this).find('tbody tr').length == 0){
    		  	$(this).before( "<p>A seção não apresentou erros!</p>" );
    		  	$(this).hide();
    		}
  		 });
		  
		 
		 //multimedia_warning
		 $('.multimedia_warning').each(function(index){
	  	    if($(this).find('tbody tr').length == 0){
	    	  $(this).before( "<p>A seção não apresentou avisos!</p>" );
	    	  $(this).hide();
	    	}
	  	 });
		 
		 
		 //form_error
		 $('.form_error').each(function(index){
    		 
  		    if($(this).find('tbody tr').length == 0){
    		  	$(this).before( "<p>A seção não apresentou erros!</p>" );
    		  	$(this).hide();
    		}
  		 });
		  
		 //form_warning
		 $('.form_warning').each(function(index){
	  	    if($(this).find('tbody tr').length == 0){
	    	  $(this).before( "<p>A seção não apresentou avisos!</p>" );
	    	  $(this).hide();
	    	}
	  	 });
 });

