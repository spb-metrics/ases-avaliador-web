function buildCssLines() {
	var text = $('#htmlCode').html();
	var html = "";
    var lines = text.split(/\n/);
   
    for (var i = 0 ; i < lines.length ; i++) {
        html += "<li class=\"L"+i+"\"><code>"+ lines[i]+"</code></li>";
    }
    
    $('#htmlCode').html(html);
}