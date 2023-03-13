<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
	</style>
<script type="text/javascript">setTimeout("location.href='/'",4000);</script>
<title>아이디 찾기 결과</title>
</head>
<body>
<section class="bg">
			<table align="center">
  			<tr><td>입력하신 email로 가입된 아이디는 </td></tr>
  			<tr><td>'${member.memId}'입니다</td></tr>
  			<tr><td>잠시 후 로그인페이지로 이동됩니다.</td></tr>
  			</table>	
</section>

  
</body>
</html>