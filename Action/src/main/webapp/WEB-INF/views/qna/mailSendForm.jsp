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
	
	<script>
	$(function() {

		$("#sendEmail").click(function() {
			let s = confirm('답변 하시겠습니까?');
			if(s) {
				$("#sendEmailFrm").submit();
			}else {
				return false;
			}
		});

	});
	</script>	
	
</head>
<body>
	qnaNo:   ${qnaNo}  <br/>
	writerEmail:  ${writerEmail} <br/>
	<hr/>

	<form action="${path}/sendMail" method="post" id="sendEmailFrm">
		<input type="hidden" name="qnaNo" value="${qnaNo}" >
	
		<input type="text" name="to" value="${writerEmail}" >  <br/>
		<input type="text" name="title" placeholder="제목을 입력하세요">   <br/>
		<input type="text" name="content" placeholder="내용을 입력하세요"> <br/>
		
		<button type="button" id="sendEmail">메일 전송하기</button>
	</form>

</body>
</html>