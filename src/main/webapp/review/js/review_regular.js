function regReview() {	
 	var regAuthor = /^[가-힣]*$/;
	var form = document.review;
		
	if(form.r_title.value==""){
		alert("제목을 입력하세요");
		form.r_title.value="";
		form.r_title.focus();
		return false; 
	}
	
	if(form.r_author.value==""){
		alert("작성자 이름을 입력하세요");
		form.r_author.value="";
		form.r_author.focus();
		return false; 
	}
	
	if(!regAuthor.test(form.r_author.value)){
		alert("작성자 이름은 한글만 입력 가능합니다.");
		form.r_author.value="";
		form.r_author.focus();
		return false; 
	}
	
	if(form.r_starPoint.value==""){
		alert("별점을 선택하세요.");
		form.r_starPoint.value="";
		form.r_starPoint.focus();
		return false; 
	}
	
	if(form.r_content.value==""){
		alert("내용을 입력하세요");
		form.r_content.value="";
		form.r_content.focus();
		return false; 
	}
	
	if(form.r_content.value.length>300){
		alert("내용은 300자 이하로 입력 가능합니다.");
		form.r_content.value="";
		form.r_content.focus();
		return false; 
	}
	
	form.submit();	
}
