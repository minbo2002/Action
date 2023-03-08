<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>     
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

	<style>
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
	</style>
	
	<script>
	$(document).ready(function(){
	
		$("#content").attr('required', 'required');	
		
		if($("#title").text=="") {
			alert('제목을 입력하세요');
			$("#title").focus();
			return;
		}
		
		if($("#content").val().length=0) {
			alert('내용을 입력하세요');
			$("#content").focus();
			return;
		}
		
		$("#sendEmail").click(function() {
			let s = confirm('답변 하시겠습니까?');
			if(s) {
				$("#sendEmailFrm").submit();
			}else {
				return false;
			}
		});
		
		$("#btnlist").click(function() {
			location.href = "${path}/qna/list?curPage=${curPage}";
		});

	});
	</script>	
	
</head>
<body>

	<section class="bg">

	<!--
	qnaNo:   ${qnaNo}  <br/>
	writerEmail:  ${writerEmail} <br/>
	curPage:  ${curPage} <br/>
	<hr/>
	-->
	<br>
	
	<form action="${path}/qna/sendMail" method="post" id="sendEmailFrm">
		
		<input type="hidden" name="qnaNo" value="${qnaNo}" >
			
		<table border="1" style="width: 1200px;">
			<tr>
				<th>작성자 이메일</th> 
				<td><input type="text" name="to" value="${writerEmail}" 
					       style="color: black; width: 950px;" />
				</td>	
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" id="title" style="color: black;" required /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea cols="90" rows="10" name="content" id="content" style="color: black;" required ></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<input type="reset" value="취소" style="color: black;" /> 
					<input type="button" value="목록" id="btnlist" style="color: black;" /> 
					<button type="button" id="sendEmail" style="color: black; background-color:	#8B4513;">메일 답변</button>
				</td>
			</tr>
		</table>
	</form>

	</section>
</body>
</html>