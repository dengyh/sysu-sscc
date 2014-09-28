$(function() {
	$('.floatright').click(function(){
		if ($(this).parent().attr("class") == "showteam")
		    $(this).parent().addClass("showteamOK");
		else
			$(this).parent().removeClass("showteamOK");
	});
});