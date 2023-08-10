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


var frmView = function(val){
	
	var frm = $("#frm2")[0];
	frm.action = "/app/history/history_fail_view.do";
	frm.no.value = val;
	frm.submit();
}
