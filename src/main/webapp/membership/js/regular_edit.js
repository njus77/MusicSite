function regCust() {	
 	var regPasswd = /^[a-zA-Z0-9]{8,12}$/;
 	var regName = /^[가-힣]*$/;
 	var regPhone = /^[0-9]*$/;
 	var regEmail = /^[a-zA-Z0-9]*$/;
 	
 	var form = document.editCust;	
	
	if(form.c_Name.value==""){
		alert("이름을 입력하세요");
		form.c_Name.focus();
		return false; 
	}
	
	if(!regName.test(form.c_Name.value)){
		alert("이름은 한글만 입력 가능합니다.");
		form.c_Name.value="";
		form.c_Name.focus();
		return false; 
	}
	
	if(form.c_Phone1.value==""){
		alert("전화번호를 선택하세요");
		return false; 
	}	
	
	if(form.c_Phone2.value==""){
		alert("전화번호를 입력하세요.");
		form.c_Phone2.focus();
		return false; 
	}
	
	if(!regPhone.test(form.c_Phone2.value)){
		alert("전화번호는 숫자만 입력 가능합니다.");
		form.c_Phone2.value="";
		form.c_Phone2.focus();
		return false; 
	}
	
	if(form.c_Email1.value==""){
		alert("이메일 아이디를 입력하세요");
		form.c_Email1.focus();
		return false; 
	}	
	
	if (!regEmail.test(form.c_Email1.value)) {
		alert("이메일 아이디는 영문대소문자 및 숫자만 입력 가능합니다");
		form.c_Email1.value="";
		form.c_Email1.focus();
		return false;
	}	
	
	if(form.c_Email2.value==""){
		alert("이메일 도메인을 선택하세요");
		return false; 
	}
		
	form.submit();
}

function goPopup(){
		var pop = window.open("jusoPopup.jsp","pop","width=570, height=420, scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadAddrPart1,addrDetail,zipNo){
			document.editCust.roadAddrPart1.value = roadAddrPart1;
			document.editCust.addrDetail.value = addrDetail;
			document.editCust.zipNo.value = zipNo;
}
