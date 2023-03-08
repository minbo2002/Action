<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/movie_rank.css">
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/movie_query.css">
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
	background-color:#dadada;
	}
	input{
	background-color:#dadada;
	}
</style>
<meta charset="UTF-8">
<title>공지사항 목록</title>
</head>
<body>

<section id="bg" style="height:800px;"> 

 
<div class="searchmove">
	<form action="${contextPath}/notice/list" style="display:inline;">  
		<input type="text" placeholder="검색어를 입력해 주세요." name="keyword" value="${keyword}" style="width:340px; height:50px;"/>  
		<input type="submit" value="검색" style="height: 50px;width:100px"/>  
	</form>  
  <c:if test="${sessionScope.memId == 'adminid'}">
  	<button type="button" onclick="location.href='${contextPath}/notice/addForm'" style="height: 50px;width:100px; margin-left: 41.8%;">글쓰기</button>
  </c:if>
</div>
  
<div id="tablediv">

<table border=1 style="width:1200px;">
    <thead>
        <tr>
            <th style="width:5%">번호</th>
            <th style="width:11%">극장</th>
            <th style="width:8%">구분</th>
            <th style="width:30%">제목</th>
            <th style="width:10%">작성자</th>
            <th style="width:10%">등록일</th>
        </tr>
    </thead>
    <tbody>
         <c:forEach var="data" items="${list}">
            <tr style="height: 55px;">
                <td>${data.noticeNo}</td>
                <td>${data.theater}</td>
                <td>${data.category}</td>
                <td style="width:404px;"><a href="${contextPath}/notice/detailForm?noticeNo=${data.noticeNo}" style="color: black;">${data.title}</a></td>
                <td>${data.memberId}</td>
                <td><fmt:formatDate value="${data.writeDate}" pattern="yyyy-MM-dd "/></td>
            </tr>
      </c:forEach>
    </tbody>
</table>
  
</div>
</section>
</body>
</html>





