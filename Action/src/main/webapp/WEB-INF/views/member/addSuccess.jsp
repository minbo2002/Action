<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<%@ include file="include/header.jsp" %>
<meta charset="UTF-8">
<title>회원가입 성공</title>
</head>
<body>
<form>
<%@ include file="./include/menu.jsp" %>
	가입해주셔서 감사합니다! 
	잠시 후 메인페이지로 이동됩니다!
<script type='text/javascript'>
setTimeout("location.href='/'",4000);
</script> 
	 
</form>	
</body>
</html>