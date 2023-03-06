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
		left: 1270px;
	}
	</style>
	
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	
	<script>
	$(function() {

		$("#btnUpdate").click(function() {
			location.href = "${path}/qna/updateForm?qnaNo=${qnaDetail.qnaNo}&curPage=${curPage}";
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
	curPage: ${curPage} <br/><br/>
	
	사진들 map: ${map.fileList}  <br/><br/>
	-->
	
	<br/>

	<c:forEach var="imageFileName" items="${map.fileList}">
			<span class="imgSpan">
			<img src="${path}/qna/imageFile?imageFileName=${imageFileName.fileName}" class="imgSize" />
			</span>
	</c:forEach>
	<br/><br/>

	<span class="answerDiv">
	<c:choose>
	   <c:when test="${qnaDetail.answerStatus eq 'N' && MEM_GRADE eq '999'}">
		   <form action="${path}/qna/sendMailForm" method="get" id="answerFrm">
			   <input type="hidden" name="writerEmail" value="${qnaDetail.writerEmail}">
			   <input type="hidden" name="qnaNo" value="${qnaDetail.qnaNo}">
			   <input type="hidden" name="curPage" value="${curPage}">
			   <input type="button" id="btnAnswer" value="답변하기" style="background-color:#8B4513; color:black;">
		   </form> 
	   </c:when>
	   <c:when test="${qnaDetail.answerStatus eq 'Y'}">
		   <input type="button" value="답변완료" readonly="readonly" style="background-color:#8B4513; color: red;" />
	   </c:when>
    </c:choose>
	</span>

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
			<td style="width: 950px;">${qnaDetail.title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea cols="90" rows="10" name="content" style="background-color:black; color:white;" 
				readonly="readonly">${qnaDetail.content}</textarea></td>  		  
		</tr>
		<tr>
			<th>등록일</th>
			<td><fmt:formatDate value="${qnaDetail.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
		</tr>
		<tr>
			<th>답변상태</th>
			<td>${qnaDetail.answerStatus}</td>
		</tr>
		<tr>
     		<td colspan="2" style="text-align:center;">
     			<span id="btns"> 			
				<c:if test="${qnaDetail.answerStatus eq 'N' && qnaDetail.writerId eq MEM_ID}">
					<input type="button" value="수정" id="btnUpdate">
				</c:if>
					<input type="button" value="목록" id="btnList">
				</span>
				<c:if test="${qnaDetail.writerId eq MEM_ID}">
					<form action="${path}/qna/delete" method="post" id="deleteFrm">
					   <input type="hidden" name="qnaNo" value="${qnaDetail.qnaNo}">
					   <input type="button" id="btnDelete" value="삭제" style="background:#B22222; color:#FF4500;">
				    </form>
				</c:if>
			</td>
		</tr>
	</table>

	</section>
</body>
</html>