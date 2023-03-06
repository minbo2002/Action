<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상세보기</title>
	
	<style type="text/css">
	.imgSize {
		width: 200px;
		height: 200px;
		background-size: cover;
	}
	</style>
	
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<script>
		$(document).ready(function() {
			
			$("#btnList").click(function() {
				location.href="${path}/event/list";
			});
			
			$("#btnUpdate").click(function() {
				location.href="${path}/event/updateForm?eventNo=${detail.eventNo}";
			});
			
		});		
	</script>	
	
</head>
<body>
	
	<h3>이벤트 상세보기</h3>

	<table border="1" style="width: 300px;">
		<tr>
			<th>글번호</th>
			<td>${detail.eventNo}</td>
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
     			<input type="button" value="글 수정하기" id="btnUpdate">
				<input type="button" value="목록" id="btnList">
     			<form action="${path}/event/delete" method="post" style="display:inline;">
					<input type="hidden" name="eventNo" value="${detail.eventNo}">
					<input type="submit" value="삭제">
				</form>
     		</td>
	    </tr>	
	</table>
	<br/>
	
	
	<!--댓글 쓰기 -->
	<div style="width: 700px; text-align: center;">
		<c:if test="${sessionScope.AUTHUSER != null}">
			<textarea rows="5" cols="80" id="replyContent" placeholder="댓글을 작성하세요"></textarea> <br>
			<button type="button" id="btnReply">댓글쓰기</button>
		</c:if>
	</div>
	<!--댓글 목록  -->
	<div id="listReply"></div>

</body>
</html>