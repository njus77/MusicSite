function regBoard() {	
 	var regAuthor = /^[가-힣]*$/;
 	var regPasswd = /^[0-9]*$/;
	var form = document.board;
		
	if(form.b_evaluation.value==""){
		alert("문의 내용을 선택하세요");
		form.b_evaluation.value="";
		form.b_evaluation.focus();
		return false; 
	}
	
	if(form.b_title.value==""){
		alert("제목을 입력하세요");
		form.b_title.value="";
		form.b_title.focus();
		return false; 
	}
	
	if(form.b_author.value==""){
		alert("작성자 이름을 입력하세요");
		form.b_name.value="";
		form.b_name.focus();
		return false; 
	}
	
	if(!regAuthor.test(form.b_author.value)){
		alert("작성자 이름은 한글만 입력 가능합니다.");
		form.b_author.value="";
		form.b_author.focus();
		return false; 
	}
	
	if(form.b_phone.value==""){
		alert("휴대폰번호를 입력하세요");
		form.b_phone.value="";
		form.b_phone.focus();
		return false; 
	}
	if(form.b_passwd.value==""){
		alert("비밀번호를 입력하세요");
		form.b_passwd.value="";
		form.b_passwd.focus();
		return false; 
	}
	
	if(!regPasswd.test(form.b_passwd.value)){
		alert("비밀번호는 숫자만 입력 가능합니다.");
		form.b_passwd.value="";
		form.b_passwd.focus();
		return false; 
	}
	
	if(form.b_content.value==""){
		alert("내용을 입력하세요");
		form.b_content.value="";
		form.b_content.focus();
		return false; 
	}
	
	if(form.b_content.value.length>300){
		alert("내용은 300자 이하로 입력 가능합니다.");
		form.b_content.value="";
		form.b_content.focus();
		return false; 
	}
	
	form.submit();	
}
