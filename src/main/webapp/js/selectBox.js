
function getOption(target, command, option, defaultValue){
	
	var param = 'command='+command;
	var resultUrl = '/common/selectList.do';
	
	var nlen = arguments.length;
	
	var i = 4;
	for(i; i < nlen; i++){
		if(arguments[i]!='')param += "&"+arguments[i];
	}
	
	if(''==option)$(target).html('<option value="">전체</option>');
	if('N'==option)$(target).html('<option value="">선택</option>');
	if('E'==option)$(target).html('<option value="">직접입력</option>');
	
	$.post(resultUrl, param, function(data) {
		
		var array = data;
		var option;
		
		$.each(array,function(index,appObj) {
			
			option = $('<option value="'+appObj.cd+'">'+appObj.nm+'</option>');
			
			$(target).append(option);
			
			if(defaultValue!=null && defaultValue!=''){
				$(target).val(defaultValue);
			}
			
		});
		
	});
}

function getOption2(target, command, command2, option, defaultValue){
	
	var param = 'command='+command+'&cd='+command2;
	var resultUrl = '/common/selectList.do';
	
	var nlen = arguments.length;
	
	var i = 4;
	for(i; i < nlen; i++){
		if(arguments[i]!='')param += "&"+arguments[i];
	}
	
	if(''==option)$(target).html('<option value="">전체</option>');
	if('N'==option)$(target).html('<option value="">선택</option>');
	if('E'==option)$(target).html('<option value="">직접입력</option>');
	
	$.post(resultUrl, param, function(data) {
		
		var array = data;
		var option;
		
		$.each(array,function(index,appObj) {
			
			option = $('<option value="'+appObj.cd+'">'+appObj.nm+'</option>');
			
			$(target).append(option);
			
			if(defaultValue!=null && defaultValue!=''){
				$(target).val(defaultValue);
			}
			
		});
		
	});
}














