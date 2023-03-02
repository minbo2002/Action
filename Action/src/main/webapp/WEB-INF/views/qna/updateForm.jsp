<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	</style>

	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	
	<script>
	$(function() {
		$("#btnlist").click(function(no) {

			location.href = "${path}/article/list";

		});
	});
	</script>

</head>
<body>

	<h3>updateForm.jsp</h3>
	
	articleDetail : ${articleDetail} <br/>
	articleNo: ${articleDetail.articleNo}  <br/>
	title: ${articleDetail.title}   <br/>
	content: ${articleDetail.content}   <br/>
	writeDate: ${articleDetail.writeDate}   <br/>
	memberId: ${articleDetail.memberId}   <br/>
	사진들 map: ${map.fileList}  <br/>
	
	AUTHUSER: ${AUTHUSER}	
	<hr/><br/>

	<form action="${path}/article/update" method="post">

		<input type="hidden" name="memberId" value="${sessionScope.AUTHUSER}" >
		<input type="hidden" name="articleNo" value="${articleDetail.articleNo}" >
		
		<table border="1" style="width: 300px;">
			<tr>
				<th>글번호</th>
				<td>${articleDetail.articleNo}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${articleDetail.title}" required="required"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" name="content" value="${articleDetail.content}" required="required"></td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${articleDetail.writeDate}</td>
			</tr>
			<tr id="i1">
	     		<td colspan="2" style="text-align:center;">
	     			<input type="reset" value="취소">
	     			<input type="submit" value="수정하기" />
	     			<input type="button" value="목록" id="btnlist">
	     		</td>
	    	</tr>
		</table>
		
		<c:forEach var="imageFileName" items="${map.fileList}">
			일반이미지 <img src="${path}/article/download1?imageFileName=${imageFileName.modiFileName}" class="imgSize" />
		</c:forEach>
		<br/><br/>
		
		<c:forEach var="imageFileName" items="${map.fileList}">
			썸네일 <img src="${path}/article/download2?imageFileName=${imageFileName.modiFileName}" />
		</c:forEach>
		<br/><br/>
	</form>
	
</body>
</html>