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

	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

	<style>
	.imgSize {
		width: 300px;
		height: 300px;
		background-size: cover;
	}
	.imgSpan {
		margin: 0px auto;
	}
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
		text-align: center;
		color: black;
	}
	.answerDiv {
		position: relative;
		left: 1300px;
	}
	</style>

	<script>
	$(function() {
		$("#btnlist").click(function() {

			location.href = "${path}/qna/list?curPage=${curPage}";

		});
		
		$("#btnUpdate").click(function() {
			let u = confirm('수정 하시겠습니까?');
			if(u) {
				$("#updateBoard").submit();
			}else {
				return false;
			}
		});
	});
	</script>

</head>
<body>

	<section class="bg">

	<!--
	qnaDetail : ${qnaDetail} <br/><br/>
	
	MEM_NO: ${MEM_NO} <br/>
	MEM_ID: ${MEM_ID} <br/>
	MEM_GRADE: ${MEM_GRADE} <br/>
	EMAIL:  ${EMAIL} <br/><br/>
	
	사진들 map: ${map.fileList}  <br/><br/>
	-->  
	<br/>
	
	<c:forEach var="imageFileName" items="${map.fileList}">
		<img src="${path}/qna/imageFile?imageFileName=${imageFileName.fileName}" class="imgSize" />
	</c:forEach>
	<br/><br/>
	
	<form action="${path}/qna/update" method="post" id="updateBoard">

		<input type="hidden" name="memId" value="${MEM_ID}" >
		<input type="hidden" name="qnaNo" value="${qnaDetail.qnaNo}" >
		
		<table border="1" style="width: 1200px;">
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
				<td><input type="text" name="title" value="${qnaDetail.title}" 
						style="width: 950px; color: black;" required="required">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea cols="90" rows="10" name="content" style="color: black;" required="required">${qnaDetail.content}</textarea></td>
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
	     			<input type="reset" value="취소" style="color: black;">
	     			<button type="button" id="btnUpdate" style="color: black;">등록</button>
	     			<input type="button" value="목록" id="btnlist" style="color: black;" />
	     		</td>
	    	</tr>
		</table>
	</form>
	
	</section>
</body>
</html>