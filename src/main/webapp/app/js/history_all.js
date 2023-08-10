var nCount=1;

/*
$(document).ready(function() {
	
	$(window).scroll(function () {
		if($(window).scrollTop() >= $(document).height() - $(window).height()){
 	 		onAdd();
 	 	}	
  	});
	
	onAdd();
});
*/


var frmView = function(val, val2, val3){
	
	var frm = $("#frm2")[0];
	frm.action = "/app/history/history_all_view.do";
	frm.no.value = val;
	frm.daoutrx.value = val2;
	frm.cpid.value = val3;
	frm.submit();
}
