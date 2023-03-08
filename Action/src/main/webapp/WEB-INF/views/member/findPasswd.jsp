<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과</title>
</head>
<body>

	<div>
	      <div>
  			<h2>입력하신 정보로 가입된 아이디의 비밀번호는 ${member.passwd}입니다.</h2><br/>
  			
  				

  <button type="button"  onclick="location.href='/member/login.do'">로그인페이지</button>
  <button type="button"  onclick="location.href='/'">메인페이지</button>
  
  </div>
</div>
</body>
</html>