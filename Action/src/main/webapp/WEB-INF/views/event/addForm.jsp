<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="contextPath1" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
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
</head>
<body>
  <h3>이벤트 글등록</h3>
  <form id="eventAddForm" 
  		method="post" enctype="multipart/form-data" action="/action/event/save">
   	<table border="1">
 	  <tbody>
 		<tr>
 		 <th>작성자</th>
 		 <td>${sessionScope.AUTHUSER_ID}
 		 <input type="hidden" name="memberId" value="${sessionScope.AUTHUSER_ID}"/>
 		 </td>
 		</tr>
 		<tr>
 		 <th>제목</th>
 		 <td><input type="text" name="title" id="title" required="required"/></td>	
 		</tr>
 		<tr>
 		 <th>내용</th>
 		 <td><textarea name="content" id="content" cols="30" rows="5" required="required"></textarea></td>	
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
	     	<input type="file" name="file1" id="files1"/>
	     </td>
	    </tr>
 		<tr id="i1">
 		 <td colspan="2" style="text-align:center;">
 		 <input type="submit" value="첨부파일upload하기"/>
 		 <input type="reset" id="btnReset" value="취소"/>
 		 	 <input type="button" id="btnBack" value="뒤로가기" onclick="location.href='list'" /> 
 		 </td>	
 		</tr>
 	  </tbody>
  	</table>
  </form>
</body>
</html>










