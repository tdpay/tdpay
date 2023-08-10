$(function() {
	
 
	$("#gnb12000").addClass('on');
    $("#12000_sub").addClass('on');
    $("#12006").addClass('on');
    

});



var frmMod = function(val){
	alert("val::"+val);
	var frm = $("#frm3")[0];
	frm.action = "/setup/setup_pg_fee_Mod.do";
	frm.pgname.value = val;
	//frm.view_type.value = "V";
	frm.submit();
}


