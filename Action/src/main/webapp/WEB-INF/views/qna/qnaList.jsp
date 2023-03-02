<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>       
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">	
	<title>Insert title here</title>
	
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<script>
		$(document).ready(function() {
			
			$("#btnWrite").click(function() {
				location.href="${path}/qna/addForm";
			});
		});	
		
		function list(page) {  // 요청한 page 번호
			location.href="${path}/qna/list?curPage="+page;
		}
	</script>
	
</head>
<body>

	MEM_NO: ${MEM_NO} <br/>
	MEM_ID: ${MEM_ID} <br/>
	EMAIL:  ${EMAIL} <br/><br/>

	map.list: ${map.list}  <br/>

	<table border="1">    
		<tr>  
			<td>게시판번호</td>  
			<td>제목</td>  
			<td>내용</td>
			<td>작성자</td>  
			<td>작성일</td>
			<td>답변여부</td>
		</tr>   
		<c:forEach var="row" items="${map.list}">  
			<tr>
				<td>${row.qnaNo}</td>
				<td><a href="${path}/qna/detail?qnaNo=${row.qnaNo}&curPage=${map.pager.curPage}"> ${row.title} </a></td>
				<td>${row.content}</td>
				<td>${row.writerId}</td>  
				<td><fmt:formatDate value="${row.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>${row.answerStatus}</td> 
			</tr>  
		</c:forEach>
		  
		<!--페이지 네비게이션  -->
		<tr>
			<td colspan="6" align="center">
				<c:if test="${map.pager.curBlock > 1}">
					<a href="javascript:list('1')">[처음]</a>
				</c:if>
				<c:if test="${map.pager.curBlock > 1}">
					<a href="javascript:list('${map.pager.prevPage}')">[이전]</a>
				</c:if>
				
				<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
					<c:choose>
						<c:when test="${num == map.pager.curPage}">
							<!--현재 페이지 -->
							<span style="color: red;">${num}</span>&nbsp;
						</c:when>
						<c:otherwise>
							<a href="javascript:list('${num}')">${num}</a>&nbsp;	<!-- 페이지 번호 num을 클릭하면 list 함수 호출  -->	
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:if test="${map.pager.curBlock <= map.pager.totBlock}">
					<a href="javascript:list('${map.pager.nextPage}')">[다음]</a>
				</c:if>
				<c:if test="${map.pager.curPage <= map.pager.totPage}">
					<a href="javascript:list('${map.pager.totPage}')">[끝]</a>
				</c:if>
			</td>
		</tr>
	</table>
	<input type="button" value="글쓰기" id="btnWrite">  

</body>
</html>