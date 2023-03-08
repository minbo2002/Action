<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/movie_rank.css">
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/movie_query.css">
	<meta charset="UTF-8">
	<title>공지사항 상세보기</title>
<style >

td{
	/* text-align: center; */
	margin:20px;
}
input{
	margin:5px;
}

td{
	text-align: center;
}
.searchmove{
			position: relative;
            left: 880px;
            margin:20px;
            }

#tablediv{	
		
}


<style type="text/css">
   th{
      width: 50px;
   }
  
   body {
     color: #666;
   }
   table {
     border-collapse: separate;
     border-spacing: 0;
     width: 100%;
     margin: auto;
     background-color: white;
     
   }
   th,   td {
     padding: 6px 0px;
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
     background: white;
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
	display:inline;
	
}
</style>
	
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<script>
		$(document).ready(function() {
			
			$("#btnList").click(function() {
				location.href="${path}/notice/list";
			});
			
			$("#btnUpdate").click(function() {
				location.href="${path}/notice/updateForm?noticeNo=${detail.noticeNo}";
			});
			
		});		
	</script>	
	
</head>
<body>
<section id="bg">

	

	<table border="1" style="width: 800px; margin-top:50px;">
		<tr>
			<th>글번호</th>
			<td>${detail.noticeNo}</td>
		</tr>
		<tr>
			<th>극장</th>
			<td>${detail.theater}</td>
		</tr>
		<tr>
			<th>구분</th>
			<td>${detail.category}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${detail.title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${detail.content}</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td><fmt:formatDate value="${detail.writeDate}" pattern="yyyy-MM-dd"/></td>
		</tr>
		<tr id="i1">
     		<td colspan="2" style="text-align:center;">
				<input type="button" value="목록" id="btnList">
     			<input type="button" value="글 수정하기" id="btnUpdate">
     			<form action="${path}/notice/delete" method="post" style="display:inline;">
					<input type="hidden" name="noticeNo" value="${detail.noticeNo}">
					<input type="submit" value="삭제">
				</form>
     		</td>
	    </tr>	
	</table>

</section>
</body>
</html>