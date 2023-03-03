<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style type="text/css">
	.imgSize {
		width: 200px;
		height: 200px;
		background-size: cover;
	}
	tr, td, th {
		align-items: center;
	}
	</style>

	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	
	<script>
	$(function() {
		$("#btnlist").click(function(no) {

			location.href = "${path}/qna/list?curPage=${curPage}";

		});
	});
	</script>

</head>
<body>

	<h3>updateForm.jsp</h3>
	
	qnaDetail : ${qnaDetail} <br/><br/>
	
	MEM_NO: ${MEM_NO} <br/>
	MEM_ID: ${MEM_ID} <br/>
	MEM_GRADE: ${MEM_GRADE} <br/>
	EMAIL:  ${EMAIL} <br/><br/>
	
	사진들 map: ${map.fileList}  <br/><br/>
	  
	<hr/><br/>
	
	<c:forEach var="imageFileName" items="${map.fileList}">
		<img src="${path}/qna/download?imageFileName=${imageFileName.fileName}" class="imgSize" />
	</c:forEach>
	<br/><br/>

	<form action="${path}/qna/update" method="post">

		<input type="hidden" name="memId" value="${MEM_ID}" >
		<input type="hidden" name="qnaNo" value="${qnaDetail.qnaNo}" >
		
		<table border="1" style="width: 600px;">
			<tr>
				<th>글번호</th>
				<td>${qnaDetail.qnaNo}</td>
			</tr>
			<tr>
				<th>작성자 아이디</th>
				<td>${qnaDetail.writerId}</td>
			</tr>
			<tr>
				<th>작성자 이메일</th>
				<td>${qnaDetail.writerEmail}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${qnaDetail.title}" required="required"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" name="content" value="${qnaDetail.content}" required="required"></td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><fmt:formatDate value="${qnaDetail.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
			<tr>
				<th>답변상태</th>
				<td>${qnaDetail.answerStatus}</td>
			</tr>
			<tr id="i1">
	     		<td colspan="2" style="text-align:center;">
	     			<input type="reset" value="취소">
	     			<input type="submit" value="수정하기" />
	     			<input type="button" value="목록으로 이동" id="btnlist">
	     		</td>
	    	</tr>
		</table>
		
	</form>
	
</body>
</html>