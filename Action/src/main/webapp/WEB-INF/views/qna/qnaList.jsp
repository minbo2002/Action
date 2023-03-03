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
			location.href="${path}/qna/list?curPage="+page
													 +"&search_option=${map.search_option}"
													 +"&keyword=${map.keyword}";
		}
	</script>
	
</head>
<body>

	MEM_NO: ${MEM_NO} <br/>
	MEM_ID: ${MEM_ID} <br/>
	MEM_GRADE: ${MEM_GRADE} <br/>
	EMAIL:  ${EMAIL} <br/><br/>

	map.list: ${map.list}  <br/>
	map.search_option: ${map.search_option}  <br/>
	
	<form name="form1" method="post" action="${path}/qna/list">
		<select name="search_option">
			<c:choose>
				<c:when test="${map.search_option == ''}">
					<option value="" selected> 선택없음 </option>
					<option value="all"> 작성자Id+내용+제목 </option>
					<option value="writer_id"> 작성자Id </option>
					<option value="title"> 제목 </option>
					<option value="content"> 내용 </option>
				</c:when>
				<c:when test="${map.search_option == 'all'}">
					<option value=""> 선택없음 </option>
					<option value="all" selected> 작성자Id+내용+제목 </option>
					<option value="writer_id"> 작성자Id </option>
					<option value="title"> 제목 </option>
					<option value="content"> 내용 </option>
				</c:when>
				<c:when test="${map.search_option == 'writer_id'}">
					<option value=""> 선택없음 </option>
					<option value="all"> 작성자Id+내용+제목 </option>
					<option value="writer_id" selected> 작성자Id </option>
					<option value="title"> 제목 </option>
					<option value="content"> 내용 </option>
				</c:when>
				<c:when test="${map.search_option == 'title'}">
					<option value=""> 선택없음 </option>
					<option value="all"> 작성자Id+내용+제목 </option>
					<option value="writer_id"> 작성자Id </option>
					<option value="title" selected> 제목 </option>
					<option value="content"> 내용 </option>
				</c:when>
				<c:when test="${map.search_option == 'content'}">
					<option value="all"> 작성자Id+내용+제목 </option>
					<option value="writer_id"> 작성자Id </option>
					<option value="title"> 제목 </option>
					<option value="content" selected> 내용 </option>
				</c:when>
			</c:choose>
		</select>
		
		<input name="keyword" value="${map.keyword}">
		<input type="submit" value="조회">
	</form>
	</br></br>
	
	현재  ${map.count}개의 문의글이 있습니다.
	<input type="button" value="글쓰기" id="btnWrite">  

	<table border="1" style="width: 600px;">    
		<tr>  
			<td>게시판번호</td>  
			<td>제목</td>  
			<td>작성자ID</td>  
			<td>작성일</td>
			<td>답변여부</td>
		</tr>   
		<c:forEach var="row" items="${map.list}">  
			<tr>
				<td>${row.qnaNo}</td>
				
				<c:if test="${row.secret eq 'Y'}">
					<c:choose>
						<c:when test="${MEM_GRADE eq '999' || row.writerId eq MEM_ID}">
							<td><a href="${path}/qna/detail?qnaNo=${row.qnaNo}
											&curPage=${map.pager.curPage}
											&search_option=${map.search_option}
											&keyword=${map.keyword}">${row.title}</a></td>
						</c:when>
						<c:otherwise> 
							<td>비밀글은 작성자와 관리자만 볼 수 있습니다.</td>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${row.secret eq 'N'}">
						<td><a href="${path}/qna/detail?qnaNo=${row.qnaNo}&curPage=${map.pager.curPage}"> ${row.title} </a></td>
				</c:if>
				
				<td>${row.writerId}</td>  
				<td><fmt:formatDate value="${row.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>${row.answerStatus}</td> 
			</tr>  
		</c:forEach>
		  
		<!--페이지 네비게이션  -->
		<tr>
			<td colspan="5" align="center">
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

</body>
</html>