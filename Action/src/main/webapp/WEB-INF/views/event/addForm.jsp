<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="contextPath1" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/movie_rank.css">
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/movie_query.css">
<meta charset="UTF-8">
<title>입력</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
 let count=1; 
 $(document).ready(function(){
 //<input type="button" value="파일삭제" id="btnDelFile"/>
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
   
 //<input type="button" value="파일추가" id="btnAddFile"/>
   $("#btnAddFile").click(function(){ 
    count++;
    
    if(count==4){ //허용된 첨부파일수(3개)보다 크다면
    	alert("첨부파일은 최대 3개까지 가능합니다.");
    	count=3;
    	return; //함수종료
    }
    
    let tr = "<tr><th>첨부파일</th><td>";
     	tr+="<input type='file' name='file"+count+"' id='files"+count+"'/></td></tr>";
    
    //id가 "i1"요소의 바로 앞에 위치한 형제(자매)붙인다
    //$(기준요소).before(추가할요소);	
    $("#i1").before(tr);	
   });
  
 });
</script>
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
      width: 50px;
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
</head>
<body>
<section id="bg">
 
  <form id="eventAddForm" 
  		method="post" enctype="multipart/form-data" action="/event/save">
   	<table border="1" style=" width:800px; ">
 	  <tbody>
 		<tr>
 		 <th>작성자</th>
 		 <td>${sessionScope.memId}
 		 <input type="hidden" name="memberId" value="${sessionScope.memId}"/>
 		 </td>
 		</tr>
 		<tr>
 		 <th>제목</th>
 		 <td><input type="text" name="title" id="title" required="required"/></td>	
 		</tr>
 		<tr>
 		 <th>내용</th>
 		 <td><textarea name="content" id="content" cols="60" rows="5" required="required"></textarea></td>	
 		</tr>
 		<tr id="i1">
 		 <td colspan="2" 
 		 	style="text-align: center;">
 		 	<input type="button" id="btnBack" value="뒤로가기" onclick="location.href='list'" /> 
 		 	<input type="submit" value="글 등록하기"/>
 		 	<input type="reset" id="btnReset" value="취소"/>
 		 </td>	
 		</tr>
 	  </tbody>
  	</table>
  </form>
</section>
</body>
</html>










