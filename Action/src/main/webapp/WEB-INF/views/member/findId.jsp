<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Id찾기 결과</title>
</head>
<body>

	<div>
	      <div>
  			<h2>${session}님의 아이디는 : </h2><br/>
  				
  		  	
  		 		 	<li>${member.memId} </li><br/>
  		
  			<h2>입니다</h2>
  <button type="button"  onclick="location.href='/member/login.do'">로그인페이지</button>
  <button type="button"  onclick="location.href='/'">메인페이지</button>
  
  </div>
</div>
</body>
</html>