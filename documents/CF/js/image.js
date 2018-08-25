$("#all-select").click(function(){
	if ($(this).attr("data-select") == "true") {
		$(this).attr("data-select", "false");
		$(this).text("全部取消");
		$(".caption .icheckbox_square-red").each(function(){
			$(this).addClass("checked");
			$(this).find("input").attr("checked", "checked");
		});
	} else {
		$(this).attr("data-select", "true");
		$(this).text("全选");
		$(".caption .icheckbox_square-red").each(function(){
			$(this).removeClass("checked");
			$(this).find("input").removeAttr("checked");
		});
		
	}
});

$("#delete-select, #cancel-select").click(function(){
	$(".switch-display").toggle();
});