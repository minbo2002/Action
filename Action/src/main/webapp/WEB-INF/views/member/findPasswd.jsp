<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과</title>
<style>
	table {
	  border-collapse: separate;
	  border-spacing: 0;
	  width: 1200px;
	  margin: auto;
	}
	th,	td {
	  padding: 6px 15px;
	 
	}
	th {
	  background: #42444e;
	  color: #fff;
	  text-align: center;
	}
	#waringSpan {
		position: relative;
		left:250px;
		color: red;
	}
	#btns {
		text-color: black;
		text-align: center;
	}
	
	#memId ,#memName, #email,#passwd1 ,#passwd2,#postcode,#address,#extraaddress {
		color:black;
	}
	
	
	
	td {
		width: 30%;
		font-size: 40px;
	}
	
	h2 { text-align: center; }
	.btn11 {
	
		border-radius: 7px;
		background-color:white ;
		color:black;
		font-size:20px;
	}
	.ak{
	color: white
	text-decoration: none;
	margin: 15px 0;
	}
	</style>
	<script type="text/javascript">setTimeout("location.href='/'",4000);</script>
</head>

<body>
<section class="bg">
	<div>
	      <div>
  			
  			<table align="center">
  			<tr><td>입력하신 정보로 가입된 아이디의 비밀번호는 </td></tr>
  			<tr><td>'${member.passwd}'입니다</td></tr>
  			<tr><td>잠시 후 로그인페이지로 이동됩니다.</td></tr>
  			</table>
  			
  				
<!-- 
  <button type="button"  onclick="location.href='/member/login.do'">로그인페이지</button>
  <button type="button"  onclick="location.href='/'">메인페이지</button>
 -->  
  </div>
</div>
</section>
</body>
</html>