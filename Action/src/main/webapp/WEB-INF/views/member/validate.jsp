<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%--id중복, 비밀번호 확인 유효성 검사 처리 --%>
<script>
var path = "${pageContext.request.contextPath }";
 
$(document).ready(function() {
	var msg = "${msg}";
	if(msg != ""){
	alert(msg);    
	}
});
 
 
function fnSubmit() {

	
	<%-- email 형식 지정 --%> 
	var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

	<%-- 전화번호 형식 지정 --%>
	var tel_rule = /^\d{2,3}-\d{3,4}-\d{4}$/;
 
	<%-- 이름 공백 확인 --%>
	if ($("#me_name").val() == null || $("#me_name").val() == "") {
		alert("이름을 입력해주세요.");
		$("#me_name").focus();
	 
		return false;
	}
	
	<%-- 아이디 공백 확인 --%>
	if ($("#me_id").val() == null || $("#me_id").val() == "") {
		alert("아이디를 입력해주세요.");
		$("#me_id").focus();
	 
		return false;
	}
	
	<%-- 전화번호 공백 확인 --%> 
	if ($("#me_tel").val() == null || $("#me_tel").val() == "") {
		alert("전화번호를 입력해주세요.");
		$("#me_tel").focus();
	 
		return false;
	}
	
	<%-- 전화번호 형식 확인 --%> 
	if(!tel_rule.test($("#me_tel").val())){
		alert("전화번호 형식에 맞게 입력해주세요.");
		
		return false;
	}
	
	<%-- 이메일 공백 확인 --%> 
	if ($("#me_email").val() == null || $("#me_email").val() == "") {
		alert("이메일을 입력해주세요.");
		$("#me_email").focus();
	 
		return false;
	}
	
	<%-- 이메일 형식 확인 --%>
	if(!email_rule.test($("#me_email").val())){
		alert("이메일을 형식에 맞게 입력해주세요.");

		return false;
	}
	
	<%-- 비밀번호2  입력 확인 --%> 
	if ($("#me_pwd").val() != "" && $("#me_pwd2").val() == "") {
		alert("비밀번호 확인을 입력해주세요.");
		$("#me_pwd").focus();
	 
		return false;
	}
	
	<%-- 비밀번호  입력 확인 --%>
	if ($("#me_pwd").val() == "" && $("#me_pwd2").val() != "") {
		alert("비밀번호를 입력해주세요.");
		$("#me_pwd2").focus();
	 
		return false;
	}
	
	<%-- 비밀번호 1,2  일치 확인 --%> 
	if ($("#me_pwd").val() != $("#me_pwd2").val()) {
		alert("비밀번호가 일치하지 않습니다.");
		$("#me_pwd2").focus();
	 
		return false;
	}
	 
	if (confirm("수정하시겠습니까??")) {
	 
	$("#createForm").submit();
	 
	return false;
	}
}
 
</script>


</head>
<body>

</body>
</html>