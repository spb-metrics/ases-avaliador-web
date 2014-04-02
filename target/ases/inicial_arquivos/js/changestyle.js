/**
* Script que troca o estilo do site.
*/

/* Define qual será o estilo ativo */
function setActiveStyleSheet(title) {
    var i, a, main;

    for (i=0; (a = document.getElementsByTagName("link")[i]); i++) {
        if (a.getAttribute("rel") && a.getAttribute("rel").indexOf("style") != -1 && a.getAttribute("title")) {
            a.disabled = true;
            if (a.getAttribute("title") == title) {
                a.disabled = false;
				set_cookie("style", title);
            }
        }
    }
}

/* Define recupera o estilo ativo */
function getActiveStyleSheet() {
    var i, a;

    for (i=0; (a = document.getElementsByTagName("link")[i]); i++) {
        if (a.getAttribute("rel").indexOf("style") != -1 && a.getAttribute("title") && !a.disabled) {
			return a.getAttribute("title");
		}
     }

  return null;
}

/* Recupera o estilo default */
function getPreferredStyleSheet() {
    var i, a;
    for (i=0; (a = document.getElementsByTagName("link")[i]); i++) {
        if (a.getAttribute("rel").indexOf("style") != -1
            && a.getAttribute("rel").indexOf("alt") == -1
            && a.getAttribute("title")) {

		    return a.getAttribute("title");
	    }
    }

    return null;
}

var cookie = get_cookie("style");
var title = (cookie != "") ? cookie : getPreferredStyleSheet();
setActiveStyleSheet(title);
