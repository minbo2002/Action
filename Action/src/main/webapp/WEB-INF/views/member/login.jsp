<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <style type="text/css">
   th{
      width: 50px;
   }
   <style>
   body {
     color: #666;
     font: 14px/24px "Open Sans", "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", Sans-Serif;
   }
   table {
     border-collapse: separate;
     border-spacing: 0;
     width: 1000px;
     margin: auto;
   }
   th,   td {
     padding: 6px 15px;
	color:blue
   }
   th {
     background: #42444e;
     color: #fff;
     text-align: center;
   }
   tr:first-child th:first-child {
     border-top-left-radius: 6px;
   }
   tr:first-child th:last-child {
     border-top-right-radius: 6px;
   }
   td {
     border-right: 1px solid #c6c9cc;
     border-bottom: 1px solid #c6c9cc;
   }
   td:first-child {
     border-left: 1px solid #c6c9cc;
   }
   tr:nth-child(even) td {
     background:   #C0C0C0;
   }
   tr:last-child td:first-child {
     border-bottom-left-radius: 6px;
   }
   tr:last-child td:last-child {
     border-bottom-right-radius: 6px;
   }
   #searchDiv, #tableDiv {
      text-align: center;
   }
   .writeSpan1 {
      position: relative;
      left: 160px;
   }
   .writeSpan2 {
      position: relative;
      left: 1010px;
   }
   
   .button {
  background-color: blue;
  border: none;
  color: white;
  padding: 15px 30px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  
  </style>

<title>로그인</title>

	
	<script>
		$(function() {
			$("#btnLogin").click(function() {
				var userid=$("#memId").val();
				var passwd=$("#passwd").val();
				if(userid=="") {
					alert('아이디를 입력하세요.');
					$("#memId").focus();
					return;
				}
				if(passwd=="") {
					alert('비밀번호를 입력하세요.');
					$("#passwd").focus();
					return;
				}
				document.form1.action="${path}/member/login_check.do";
				document.form1.submit();
			});
		});
	</script>

</head>
<body>
<section class="bg" >


	<h2>로그인</h2>

	<form name="form1" method="post">
	<table border="1" >
		<tr>
			<td>아이디</td>
			<td><input id="memId" name="memId"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" id="passwd" name="passwd"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			
			<button type="button" class="button" id="btnLogin">로그인</button>
			<input type="button" class="button" value="회원가입" onclick="location.href='/member/write.do'">
			<input type="button" class="button" value="아이디찾기" onclick="location.href='/member/findId.do'">
			<input type="button" class="button" value="비밀번호찾기 " onclick="location.href='/member/findPW.do'">
 			
			<c:if test="${param.message == 'nologin' }">
				<div style="color: red;">
				먼저 로그인 하세요.
				</div>
			</c:if>
			<c:if test="${message == 'error' }">
				<div style="color: red;">
				아이디 또는 비밀번호가 일치하지 않습니다.
				</div>
			</c:if>
			<c:if test="${message == 'logout' }">
				<div style="color: red;">
				로그아웃 되었습니다.
				</div>
			</c:if>
			</td>
		</tr>
	</table>
	</form>
</section>
</body>
</html>