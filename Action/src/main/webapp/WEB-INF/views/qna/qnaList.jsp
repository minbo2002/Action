<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>       
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">	
	<title></title>
	
	
<style >
   
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
	.ak {
	color:black;
	}
</style>
	
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
	<section class="bg">

	<!--  
	memNo: ${memNo} <br/>
	memId: ${memId} <br/>
	email: ${email} <br/>
	memGrade: ${memGrade} <br/><br/>

	map.list: ${map.list}  <br/>
	map.search_option: ${map.search_option}  <br/>
	map.pager.curPage: ${map.pager.curPage}  <br/>
	-->
	<br><br>
	<div id="searchDiv" style="    margin-left: -31%;">
	<form name="form1" method="post" action="${path}/qna/list">
		<select name="search_option" style="color: black;">
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
		
		<input name="keyword" value="${map.keyword}" style="color: black;" />
		<input type="submit" value="조회" style="color: black;background-color: #ffffff;width: 150px;height: 33px;"/>
	</form>
	</div>
	<br>
	
	<span class="writeSpan1" style="    margin-left: 10%;"> 
		총 ${map.count}개의 문의글이 있습니다.   
	</span>
	<span class="writeSpan2"> 
		<c:if test="${!empty memId}">
         <input type="button" value="글작성" id="btnWrite"  style="color: black;background-color: #ffffff;border: none;height: 50px;width: 200px;border-radius: 10px; margin-left: -5.5%;">
      </c:if>
	</span>
	<br/><br/>
	
	
	<div id="tableDiv">
	<table border="1" style="width: 1200px;">
		<tr>  
			<th style="    width: 8%;">글번호</th>  
			<th style="    width: 65%;">제목</th>  
			<th>작성자ID</th>  
			<th style="    width: 12%;">작성일</th>
			<th>답변</th>
		</tr>   
		<c:forEach var="row" items="${map.list}">  
			<tr>
				<td>${row.qnaNo}</td>
				<c:if test="${row.secret eq 'Y'}">
					<c:choose>
						<c:when test="${memGrade eq '999' || row.writerId eq memId}">
							<td><a class="ak" href="${path}/qna/detail?qnaNo=${row.qnaNo}
											&curPage=${map.pager.curPage}
											&search_option=${map.search_option}
											&keyword=${map.keyword}" style="color:black;">${row.title}</a></td>
						</c:when>
						<c:otherwise> 
							<td>비밀글은 작성자와 관리자만 볼 수 있습니다.</td>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${row.secret eq 'N'}">
						<td><a class="ak" href="${path}/qna/detail?qnaNo=${row.qnaNo}&curPage=${map.pager.curPage}"> ${row.title} </a></td>
				</c:if>
				
				<td>${row.writerId}</td>  
				<td><fmt:formatDate value="${row.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td style="    width: 5%;">${row.answerStatus}</td> 
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
					<a class="ak" href="javascript:list('${map.pager.nextPage}')">[다음]</a>
				</c:if>
				<c:if test="${map.pager.curPage <= map.pager.totPage}">
					<a class="ak" href="javascript:list('${map.pager.totPage}')">[끝]</a>
				</c:if>
			</td>
		</tr>
	</table>
	</div>
	
	</section>	
</body>
</html>