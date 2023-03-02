<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set> 
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>글등록</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	
	<script>
	let count=1; 
	$(document).ready(function(){
	
    	$("#btnDelFile").click(function(){ 
		  	if(count==1){ //유지해야하는 파일수보다 적다면
		  		alert("반드시 한개는 있어야 합니다.");
		  		return;
		  	}
	  		let tr = $("#files"+count).parents("tr");
	  		//id가 "i1"요소의 바로 앞에 위치한 형제(자매)를 삭제되는 것처럼 보인다
	   		//$(기준요소).remove();
		    $(tr).remove();
		  	count--; 
		});

		$("#btnAddFile").click(function(){ 
			count++;
			if(count==4){ //허용된 첨부파일수(3개)보다 크다면
				alert("첨부파일은 최대 3개까지 가능합니다.");
				count=3;
				return; //함수종료
			}
   			let tr = "<tr><th>첨부파일</th><td>";
    			tr+= "<input type='file' name='file"+count+"' id='files"+count+"'/></td></tr>";
   
			//id가 "i1"요소의 바로 앞에 위치한 형제(자매)붙인다
			//$(기준요소).before(추가할요소);	
			$("#i1").before(tr);	
		});
		
		$("#btnList").click(function(no) {
			location.href = "${path}/qna/list";
		});
	});
	</script>

</head>
<body>

	MEM_NO: ${MEM_NO} <br/>
	MEM_ID: ${MEM_ID} <br/>
	EMAIL:  ${EMAIL} <br/><br/>

	<h3>addForm.jsp</h3>
	<hr/>
	
	<form action="${path}/qna/addForm" id="addForm" method="post" enctype="multipart/form-data">

		<input type="hidden" name="memNo" value="${sessionScope.MEM_NO}" >
		<input type="hidden" name="writerId" value="${sessionScope.MEM_ID}" >
		<input type="hidden" name="writerEmail" value="${sessionScope.EMAIL}" >
		
		<table border="1">
			<tr>
				<th>작성자 아이디</th>
				<td>${sessionScope.MEM_ID}</td>
				</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" required="required"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" name="content" required="required"></td>
			</tr>
			<tr>
				<th>파일첨부</th>
			    <td>
			        <input type="button" value="파일추가" id="btnAddFile"/>
			    	<input type="button" value="파일삭제" id="btnDelFile"/>
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
	     			<input type="file" name="file1" id="files1" alt="이미지없음" />
	     		</td>
			</tr>	
			<tr id="i1">
	     		<td colspan="2" style="text-align:center;">
	     			<input type="submit" value="글등록" />
	     			<input type="button" value="목록" id="btnList">
	     		</td>
	    	</tr>	
		</table>
		<a>*주의사항 : 파일은 반드시 순서대로 등록해야합니다</a>
		
		<!-- 업로드용 파일찾기 버튼이 동적으로 생성추가되는 영역 -->
	    <div id="fileArea">
	    </div>
	</form>
</body>
</html>