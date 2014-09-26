gaf.theme={
	panelColor : '#dfeffc',
	borderColor : '#a6c9e2'
};

jQuery(function($){
	//config theme for jquery.contextmenu.r2.min.js
	if($.contextMenu)
		$.contextMenu.defaults({
			itemHoverStyle: {
		      border: gaf.theme.panelColor,
		      backgroundColor: gaf.theme.borderColor
		    }
		});
});