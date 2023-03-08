<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="contextPath1" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/movie_rank.css">
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/movie_query.css">
<meta charset="UTF-8">

<title>공지사항 수정하기</title>
</head>
<style >

	td{
		text-align: center;
	}
	.searchmove{
				position: relative;
	            margin-left:18.5%;
	            margin-top:2%;
	            margin-bottom:2%;
	            }
	
	#tablediv{	
			
	}
   th{
      width: 50px;
   }
   body {
     color: #666;
   }
   table {
     border-spacing: 0;
     width: 100%;
     margin: auto;
     background-color: #cacaca;
     
   }
   th,   td {
     padding: 6px 15px;
   }
   th {
     background: #42444e;
     color: #fff;
     text-align: center;
   }
   td {
     border-right: 1px solid #c6c9cc;
     border-bottom: 1px solid #c6c9cc;
   }
   td:first-child {
     border-left: 1px solid #c6c9cc;
   }
   tr:nth-child(even) td {
     background: #c1c1c1;
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
	button{
	background-color:#fefefe;
	}
	input{
	background-color:#dadada;
	height: 33px;
	}
</style>
<body>
<section id="bg">

  <form id="updateForm" 
        action="${contextPath}/notice/updateForm" method="post">
 	<input type="hidden" name="noticeNo" value="${notice.noticeNo}"/>
   	<table border="1" style="width: 800px; margin-top:50px;" >
 	  <tbody>
 		<tr>
 		 <th style="    width: 15%;">글번호</th>
 		 <td>${notice.noticeNo}</td>
 		</tr>
 		<tr>
 		 <th>작성자</th>
 		 <td>${notice.memberId}</td>
 		</tr>
 		<tr>
 		<th>극장</th>
 		  <td>
 		 	<select name="theater" id="theater" value="${notice.theater}">
				<option value="${notice.theater}">${notice.theater}</option>
				<option value="강남대로(씨티)">강남대로(씨티)</option>
	            <option value="강동">강동</option>
	            <option value="군자">군자</option>
	            <option value="더 부티크 목동현대백화점">더 부티크 목동현대백화점</option>
	            <option value="동대문">동대문</option>
	            <option value="마곡">마곡</option>
	            <option value="목동">목동</option>
	            <option value="상봉">상봉</option>
	            <option value="상암월드컵경기장">상암월드컵경기장</option>
	            <option value="성수">성수</option>
	            <option value="센트럴">센트럴</option>
	            <option value="송파파크하비오">송파파크하비오</option>
	            <option value="신촌">신촌</option>
	            <option value="이수">이수</option>
	            <option value="창동">창동</option>
	            <option value="코엑스">코엑스</option>
	            <option value="홍대">홍대</option>
	            <option value="화곡">화곡</option>
	            <option value="ARTNINE">ARTNINE</option>
			</select>
 		  </td>	
 		<tr>
 		
 		<th>구분</th>
 		 <td>
			<select name="category" id="category" value="${notice.category}">
			    <option value="${notice.category}">${notice.category}</option>
			    <option value="전체">전체</option>
			    <option value="공지">공지</option>
			    <option value="이벤트">이벤트</option>
			    <option value="라이프뷰잉">라이프뷰잉</option>
			    <option value="클래식중계">클래식중계</option>
			</select>
 		 </td>	
 		<tr>
 		 <th>제목</th>
 		 <td><input type="text" name="title" id="title" required="required" value="${notice.title}"/></td>	
 		</tr>
 		<tr>
 		 <th>내용</th>
 		 <td><textarea name="content" id="content" cols="60" rows="5" required="required">${notice.content}</textarea></td>	
 		</tr>
 		<tr>
 		 <td colspan="2" style="text-align:center;">
 		 <input type="submit" id="btnSubmit" value="수정(완료)"/>
 		 <input type="reset" id="btnReset" value="취소"/>	
 		 <input type="button" id="btn1"
 		     value="목록보기"
		onclick="location.href='${contextPath}/notice/list?ano=${notice.noticeNo}'"/>
</td>	
 		</tr>
 	  </tbody>
  	</table>
  </form>
</section>
</body>
</html>










