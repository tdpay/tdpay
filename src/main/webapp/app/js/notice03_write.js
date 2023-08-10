$(function() {

	$('#content').summernote({
		  height: 300,
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: false,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",				// 한글 설정
		  toolbar: [
				['style', ['style']],
				['fontsize', ['fontsize']],
				['font', ['bold', 'italic', 'underline', 'clear']],
				['fontname', ['fontname']],
				['color', ['color']],
				['para', ['ul', 'ol', 'paragraph']],
				['height', ['height']],
				['table', ['table']],
				['insert', ['link', 'picture', 'hr']],
				['view', ['codeview']],
				['help', ['help']]
		  ],			  
	   	  callbacks: {
			onImageUpload: function(files, editor, welEditable) {
	            for (var i = files.length - 1; i >= 0; i--) {
	            	sendFile(files[i], this);
	            }
	        }
		  }		
        
	});
	$('#reply').summernote({
		height: 300,
		minHeight: null,             // 최소 높이
		maxHeight: null,             // 최대 높이
		focus: false,                  // 에디터 로딩후 포커스를 맞출지 여부
	    lang: "ko-KR",				// 한글 설정
	    toolbar: [
			['style', ['style']],
			['fontsize', ['fontsize']],
			['font', ['bold', 'italic', 'underline', 'clear']],
			['fontname', ['fontname']],
			['color', ['color']],
			['para', ['ul', 'ol', 'paragraph']],
			['height', ['height']],
			['table', ['table']],
			['insert', ['link', 'picture', 'hr']],
			['view', ['codeview']],
			['help', ['help']]
	    ],		    
   	    callbacks: {
		  onImageUpload: function(files, editor, welEditable) {
            for (var i = files.length - 1; i >= 0; i--) {
            	sendFile(files[i], this);
            }
          }
	    }	
			
	});
	
	$( "#file_add" ).change(function() {
		var file_add = $( "#file_add" ).val();
		$("#file_nm").val(file_add);
	});
});

var sendFile = function(file, el) {
	var form_data = new FormData();
  	form_data.append('file2', file);
  	form_data.append('uploadFile', 'no3');
  	$.ajax({
    	data: form_data,
    	type: "POST",
    	url: '/common/upload.do',
    	cache: false,
    	contentType: false,
    	enctype: 'multipart/form-data',
    	processData: false,
    	success: function(img_name) {
      		$(el).summernote('editor.insertImage', img_name);
    	}
  	});
}

var frmAdd = function(){
	
	var frm = $("#frm")[0];
	frm.action = "/app/notice/notice03Add.do";
	frm.submit();
}
var frmMod = function(val){
	
    var arrChk = "";
    var i = 0 ; 
    
    $("input[name=chk]").each(function(){
    	if($(this).is(":checked")){
        		if(i == 0) {
        			arrChk 	= $(this).attr("key");
        		}else{
        			arrChk 	+= "," + $(this).attr("key");
        		}
        		i++;
        	}
    });
    
    $("#arrChk").val(arrChk);	
    
	var frm = $("#frm")[0];
	frm.action = "/app/notice/notice03Mod.do";
	frm.submit();
}
