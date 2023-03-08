<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
</head>
<body>

	<div>
	      <div>
  			<h2>입력하신 email로 가입된 아이디는 ${member.memId}입니다.</h2><br/>
  			<h2>안전을 위해 비밀번호를 변경해주세요.</h2>
  				

  <button type="button"  onclick="location.href='/member/login.do'">로그인페이지</button>
  <button type="button"  onclick="location.href='/'">메인페이지</button>
  <button type="button"  onclick="location.href='/member/chpasswd'">비밀번호변경</button>
  
  </div>
</div>
</body>
</html>