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
   tr:last-child td:first-child {
     border-bottom-left-radius: 6px;
   }
   tr:last-child td:last-child {
     border-bottom-right-radius: 6px;
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
	background-color:#fefefe
	}
	input{
	background-color:#dadada;
	height: 33px;
	}
</style>
</head>
<body>
<section id="bg">
  
  <form id="noticeAddForm" 
  		method="post" enctype="multipart/form-data" action="/notice/list">
   	<table border="1" style="width:800px; ">
 	  <tbody>
 		<tr>
 		 <th style="    width: 14%;">작성자</th>
 		 <td>
 		 <div style="margin:5px;">${sessionScope.memId}</div> 
 		 <input type="hidden" name="memberId" value="${sessionScope.memId}"/>
 		 </td>
 		</tr>
 		<tr>
 		 <th>극장</th>
 		  <td>
 		 	<select name="theater" id="theater" required="required">
				<option value="극장선택">--극장선택--</option>
				<option value="강남대로(씨티)">강남대로(씨티)</option>
	            <option value="강동">강동</option>
	            <option value="군자">군자</option>
	            <option value="더 부티크 목동현대백화점">더 부티크 목동현대백화점</option>
	            <option value="동대문">동대문</option>
	            <option value="마곡">마곡</option>
	            <option value="목동">목동</option>
	            <option value="상봉">상봉</option>
	            <option value="상암월드컵경기장">상암월드컵경기장</option>
	            <option value="성수">성수</option>
	            <option value="센트럴">센트럴</option>
	            <option value="송파파크하비오">송파파크하비오</option>
	            <option value="신촌">신촌</option>
	            <option value="이수">이수</option>
	            <option value="창동">창동</option>
	            <option value="코엑스">코엑스</option>
	            <option value="홍대">홍대</option>
	            <option value="화곡">화곡</option>
	            <option value="ARTNINE">ARTNINE</option>
			</select>
 		  </td>	
 		</tr>
 		<tr>
 		 <th>구분</th>
 		 <td>
			<select name="category" id="category" required="required">
			    <option value="없음">--없음--</option>
			    <option value="전체">전체</option>
			    <option value="공지">공지</option>
			    <option value="라이프뷰잉">라이프뷰잉</option>
			    <option value="클래식중계">클래식중계</option>
			</select>
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
 		 <td colspan="2" style="text-align:center;">
 		 	<input type="button" id="btnBack" value="뒤로가기" onclick="location.href='list'" /> 		 
 		 	<input type="submit" value="글 등록하기" />
 		 	<input type="reset" id="btnReset" value="취소"/>
 		 </td>	
 		</tr>
 	  </tbody>
  	</table>
  </form>
</section>
</body>
</html>










