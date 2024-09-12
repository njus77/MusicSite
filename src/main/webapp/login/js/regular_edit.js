function regEdit() {	
 	var regExpPasswd = /^[a-zA-Z0-9_]*$/;
 	var regExpName = /^[가-힣]*$/;
 	var regExpTel = /^[0-9]*$/;
 	var regExpEmail = /^[a-zA-Z0-9]*$/;
	
	if(document.member.mPasswd.value==""){
		alert("비밀번호를 입력하세요");
		document.member.mPasswd.value="";
		document.member.mPasswd.focus();
		return false; 
	}
	
	if(document.member.mPasswd.value != document.member.cPasswd.value){
		alert("비밀번호가 불일치합니다");
		document.member.mPasswd.value="";
		document.member.cPasswd.value="";
		document.member.mPasswd.focus();
		return false;
	}
	
	if (document.member.mPasswd.value.length<8 || document.member.mPasswd.value.length>12) {
		alert("비밀번호는 8자리 이상 12자리 이하로 숫자만 입력해주세요!");
		document.member.mPasswd.value="";
		document.member.cPasswd.value="";
		document.member.mPasswd.focus();
		return false;
	}
	
	if (!regExpPasswd.test(document.member.mPasswd.value)) {
		alert("비밀번호는 영문대소문자 및 숫자, _만 입력 가능합니다");
		document.member.mPasswd.value="";
		document.member.cPasswd.value="";
		document.member.mPasswd.focus();
		return false;
	}		
	
	if(document.member.mName.value==""){
		alert("이름을 입력하세요");
		document.member.mName.focus();
		return false; 
	}
	
	if(!regExpName.test(document.member.mName.value)){
		alert("이름은 한글만 입력 가능합니다.");
		document.member.mName.value="";
		document.member.mName.focus();
		return false; 
	}
	
	if(document.member.mTel1.value==""){
		alert("전화번호를 선택하세요");
		return false; 
	}	
	
	if(document.member.mTel2.value==""){
		alert("전화번호를 입력하세요.");
		document.member.mTel2.focus();
		return false; 
	}
	
	if(!regExpTel.test(document.member.mTel2.value)){
		alert("전화번호는 숫자만 입력 가능합니다.");
		document.member.mTel2.value="";
		document.member.mTel2.focus();
		return false; 
	}
	
	if(document.member.mTel3.value==""){
		alert("전화번호를 입력하세요.");
		document.member.mTel3.focus();
		return false; 
	}
	
	if(!regExpTel.test(document.member.mTel3.value)){
		alert("전화번호는 숫자만 입력 가능합니다.");
		document.member.mTel3.value="";
		document.member.mTel3.focus();
		return false; 
	}
	
	if(document.member.mEmail1.value==""){
		alert("이메일 아이디를 입력하세요");
		document.member.mEmail1.focus();
		return false; 
	}	
	
	if (!regExpEmail.test(document.member.mEmail1.value)) {
		alert("이메일 아이디는 영문대소문자 및 숫자만 입력 가능합니다");
		document.member.mEmail1.value="";
		document.member.mEmail1.focus();
		return false;
	}	
	
	if(document.member.mEmail2.value==""){
		alert("이메일 도메인을 선택하세요");
		return false; 
	}
		
	document.member.submit();	
}

function goPopup(){
		var pop = window.open("jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
	
function jusoCallBack(roadAddrPart1,addrDetail,zipNo){
		document.member.roadAddPart1.value = roadAddrPart1;
		document.member.addrDetail.value = addrDetail;
		document.member.zipNo.value = zipNo;
}
