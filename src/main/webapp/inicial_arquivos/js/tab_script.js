$(document).ready(function()

	{
		var teclaPressionada;
		var shiftPressionado;

		$(document).keydown(function(e) {
			if(e.which != 13 )
				{
			shiftPressionado = e.shiftKey;
			teclaPressionada = e.which;

			$("#input").blur(function() {
				if (shiftPressionado == true) {
					$("#tab-2").prop("checked", true);
				}
			});
			$("#up_file").blur(function() {
				if (shiftPressionado == true) {
					$("#tab-1").prop("checked", true);
				}

			});

			$("#input_tab_1").blur(function() {
				if (shiftPressionado == false && teclaPressionada == 9) {
					$("#tab-2").prop("checked", true);
				}

			});
			$("#input_tab_2").blur(function() {
				if (shiftPressionado == false && teclaPressionada == 9) {
					$("#tab-3").prop("checked", true);
				}

			});
				}
		});

	});