/**
* Script que gerencia cookies.
*/

/** Funcao que recupera valores no cookie */
function get_cookie(Name) { 
   var search = Name + "=";
   var returnvalue = "";

   if (document.cookie.length > 0) {
       offset = document.cookie.indexOf(search);
       if (offset != -1) {
           offset += search.length
           end = document.cookie.indexOf(";", offset);
           if (end == -1) {
			   end = document.cookie.length;
		   }
           returnvalue = unescape(document.cookie.substring(offset, end));
      }
   }

   return returnvalue;
}

/** Funcao que armazena valores no cookie */
function set_cookie(nome, valor) {
  	var date = new Date();
  	date.setTime(date.getTime() + 172800);
  	document.cookie = nome + "=" + valor + ";expires=" + date.toGMTString();
}
