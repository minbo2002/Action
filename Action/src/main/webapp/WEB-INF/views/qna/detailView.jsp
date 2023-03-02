<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>     
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
	
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	
	<script>
	$(function() {

		listReply("1");  // 기존의 댓글을 나오게하기
		
		$("#btnUpdate").click(function(no) {

			location.href = "${path}/qna/updateForm?qnaNo=${qnaDetail.qnaNo}";

		});
		
		$("#btnList").click(function(no) {

			location.href = "${path}/qna/list";

		});
		
		$("#btnDelete").click(function() {
			
			location.href = "${path}/qna/delete";
		});
		
		$("#btnAnswer").click(function() {
			
			location.href = "${path}/qna/sendEmail";
			
		});

		$("#btnReply").click(function() {
			reply();
		});

	});
	
	function reply() {
		var replyContent = $("#replyContent").val();  // 댓글내용
		var articleno = "${articleDetail.articleNo}";					// 원글 번호
		var param = {"replyContent" : replyContent, "articleno" : articleno};  // 파라미터 형식
		$.ajax({
			type: "post",
			url: "${path}/reply/insert",
			data: param,
			success: function() {
				alert("댓글이 등록되었습니다");
				listReply("1");  // 댓글 페이지 나누기
			}
		});
	}
	
	function listReply(num) {
		$.ajax({
			type: "post",
			url: "${path}/reply/list?articleno=${articleDetail.articleNo}&curPage="+num,
			success: function(result) {
				console.log(result);
				$("#listReply").html(result);
			}
		});
	}
	</script>
	
</head>
<body>

	<h3>detailView.jsp</h3>
	
	qnaDetail : ${qnaDetail} <br/>
	qnaNo: ${qnaDetail.qnaNo}  <br/>
	title: ${qnaDetail.title}   <br/>
	content: ${qnaDetail.content}   <br/>
	writerId: ${qnaDetail.writerId} <br/>
	regDate: ${qnaDetail.regDate}   <br/>
	answerStatus: ${qnaDetail.answerStatus} <br/>
	memNo: ${qnaDetail.memNo}   <br/><br/>
	사진들 map: ${map.fileList}  <br/><br/>

	AUTHUSER: ${AUTHUSER}  <br/>
	AUTHMAIL: ${AUTHMAIL}  <br/>	  
	<hr/><br/>

	<c:forEach var="imageFileName" items="${map.fileList}">
		일반이미지 <img src="${path}/article/download1?imageFileName=${imageFileName.modiFileName}" class="imgSize" />
	</c:forEach>
	<br/><br/>
	
	<c:forEach var="imageFileName" items="${map.fileList}">
		썸네일 <img src="${path}/article/download2?imageFileName=${imageFileName.modiFileName}" />
	</c:forEach>
	<br/><br/>	

	<hr/>

	<table border="1" style="width: 300px;">
		<tr>
			<th>글번호</th>
			<td>${qnaDetail.qnaNo}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${qnaDetail.title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${qnaDetail.content}</td>  
		</tr>
		<tr>
			<th>작성자</th>
			<td>${qnaDetail.writerId}</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${qnaDetail.regDate}</td>
		</tr>
		<tr id="i1">
     		<td colspan="2" style="text-align:center;">
     			<input type="button" value="글 수정화면 이동" id="btnUpdate">
				<input type="button" value="목록" id="btnList">
				<c:if test="${sessionScope.AUTHUSER eq 'adminid'}">
					<input type="button" value="답변하기" id="btnAnswer">
				</c:if>
     			<form action="${path}/qna/delete" method="post">
					<input type="hidden" name="qnaNo" value="${qnaDetail.qnaNo}">
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