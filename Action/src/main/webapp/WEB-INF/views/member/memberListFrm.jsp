<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  <!-- 날짜 출력 format 지정 -->
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>    
<!DOCTYPE html>
<html>
<head>
<%-- style --%>
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

<meta charset="UTF-8">
<title>회원목록</title>
	
		<script>
		$( document ).ready( function() {
			$("p:contains('0')").html("일반회원");
			$("p:contains('999')").html("관리자"); 
			$("span:contains('0')").html("남자");
			$("span:contains('1')").html("여자");
		} );
		</script>
</head>
<body>
<section class ="bg">
	<h2>회원목록</h2>
		


	<table border="1" style="width: 700px;">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>성별</td>
			<td>이메일</td>
			<td>가입일자</td>
			<td>주소</td>
			<td>등급</td>
		</tr>
	<c:forEach var="row" items="${list}">
		<tr>
			<td>${row.memId}</td>
			<td><a href="/member/view.do?memId=${row.memId}">${row.memName}</a></td>
			<td><span>${row.gender}</span></td>
			<td>${row.email}</td>
			<td><fmt:formatDate value="${row.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td>${row.address}</td>
			<td><p>${row.grade}</p></td>
		</tr>
	</c:forEach>	
	</table>
</section>	
</body>
</html>