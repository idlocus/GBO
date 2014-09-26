	$(function() {
	
		var offsetTopFooter = $("#innerFooter").offset().top;

	
		var offsetTopMenu = $("#banner").offset().top;
		if ((offsetTopFooter - offsetTopMenu) <= 800)
			$("#innerFooter").css({
			 	'position' : "absolute", 
				'top' : 800
			});

		//   
		/*  $("#footer").css({position: "absolute",'top':700}); */
	});
