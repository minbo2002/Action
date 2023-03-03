<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

		$("#btnUpdate").click(function() {
			location.href = "${path}/qna/updateForm?qnaNo=${qnaDetail.qnaNo}";
		});
		
		$("#btnList").click(function() {
			location.href = "${path}/qna/list?curPage=${curPage}";
		});
		
		$("#btnDelete").click(function() {
			let d = confirm('삭제하시겠습니까?');
			if(d){
				$("#deleteFrm").submit();
			}else{
				return false;
			}
		});
		
		$("#btnAnswer").click(function() {
			let a = confirm('답변하시겠습니까?');
			if(a){
				$("#answerFrm").submit();
			}else{
				return false;
			}
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
	
	qnaDetail : ${qnaDetail} <br/><br/>
	
	MEM_NO: ${MEM_NO} <br/>
	MEM_ID: ${MEM_ID} <br/>
	MEM_GRADE: ${MEM_GRADE} <br/>
	EMAIL:  ${EMAIL} <br/><br/>
	pager.curPage: ${map.pager.curPage} <br/><br/>
	
	사진들 map: ${map.fileList}  <br/><br/>
	  
	<hr/><br/>

	<c:forEach var="imageFileName" items="${map.fileList}">
		<img src="${path}/qna/download?imageFileName=${imageFileName.fileName}" class="imgSize" />
	</c:forEach>
	<br/><br/>

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
			<td>${qnaDetail.title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${qnaDetail.content}</td>  
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
     			<c:choose>
     				<c:when test="${qnaDetail.answerStatus eq 'N' && MEM_GRADE eq '999'}">
     					<form action="${path}/qna/sendEmail" method="get" id="answerFrm">
							<input type="hidden" name="writerEmail" value="${qnaDetail.writerEmail}">
							<input type="hidden" name="qnaNo" value="${qnaDetail.qnaNo}">
							<input type="button" id="btnAnswer" value="답변하기">
						</form> 
     				</c:when>
     				<c:when test="${qnaDetail.answerStatus eq 'Y'}">
     					<input type="button" value="답변완료" readonly="readonly" style="color: red;" />
     				</c:when>
     			</c:choose>
     			
				<c:if test="${qnaDetail.answerStatus eq 'N' && qnaDetail.writerId eq MEM_ID}">
					<input type="button" value="글 수정화면 이동" id="btnUpdate">
				</c:if>
				
					<input type="button" value="목록으로 이동" id="btnList">
     			
     			<c:if test="${qnaDetail.writerId eq MEM_ID}">
	     			<form action="${path}/qna/delete" method="post" id="deleteFrm">
						<input type="hidden" name="qnaNo" value="${qnaDetail.qnaNo}">
						<input type="button" id="btnDelete" value="삭제">
					</form>
     			</c:if>
     		</td>
	    </tr>	
	</table>
	<br/>
	
</body>
</html>