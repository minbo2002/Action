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
	
<style >
	.imgSize {
      width: 300px;
      height: 300px;
      background-size: cover;
   }
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
      width: 200px;
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
	
	memNo: ${memNo} <br/>
	memId: ${memId} <br/>
	memGrade: ${memGrade} <br/>
	email:  ${email} <br/><br/>
	curPage: ${curPage} <br/><br/>
	
	사진들 map: ${map.fileList}  <br/><br/>
	-->
	
	<br/>

	
	<br/><br/>

	<span class="answerDiv">
	<c:choose>
	   <c:when test="${qnaDetail.answerStatus eq 'N' && memGrade eq '999' && qnaDetail.writerId ne memId}">
		   <form action="${path}/qna/sendMailForm" method="get" id="answerFrm">
			   <input type="hidden" name="writerEmail" value="${qnaDetail.writerEmail}">
			   <input type="hidden" name="qnaNo" value="${qnaDetail.qnaNo}">
			   <input type="hidden" name="curPage" value="${curPage}">
			   <input type="button" id="btnAnswer" value="답변하기"  style="color: black;background-color: #ffffff;border: none;height: 50px;width: 200px;border-radius: 10px;margin-left: 18.5%;">
		   </form> 
	   </c:when>
	   <c:when test="${qnaDetail.answerStatus eq 'Y'}">
		   <input type="button" value="답변완료" readonly="readonly"  style="color: black;background-color: #ffffff;border: none;height: 50px;width: 200px;border-radius: 10px; margin-left: 18.5%;" />
	   </c:when>
    </c:choose>
	</span>
<br><br>
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
						readonly="readonly">${qnaDetail.content}</textarea>
					<c:forEach var="imageFileName" items="${map.fileList}">
						<span class="imgSpan">
						<img src="${path}/qna/imageFile?imageFileName=${imageFileName.fileName}" class="imgSize" />
						</span>
					</c:forEach>
				
			</td> 
				 		  
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
     			<span id="btns" style="display: inline-flex;"> 			
				<c:if test="${qnaDetail.answerStatus eq 'N' && qnaDetail.writerId eq memId}">
					<input type="button" value="수정" id="btnUpdate" style="margin:10px; width:150px; height:50px; border: none;">
				</c:if>
					<input type="button" value="목록" id="btnList" style="margin:10px; width:150px; height:50px; border: none;">
				<c:if test="${qnaDetail.writerId eq memId}">
					<form action="${path}/qna/delete" method="post" id="deleteFrm">
					   <input type="hidden" name="qnaNo" value="${qnaDetail.qnaNo}">
					   <input type="button" id="btnDelete" value="삭제" style="background:#B22222; color:#ffffff; margin:10px; width:100px; height:50px ; border: none;">
				    </form>
				</c:if>
				</span>
			</td>
		</tr>
	</table>

	</section>
</body>
</html>