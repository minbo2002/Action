<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>

	
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
	button{
	color: black;
	background-color: #ffffff;
	border: none;height: 50px;
	width: 200px;
	border-radius: 10px;
		}




.filebox input[type="file"] {
  position: absolute;
  width: 0;
  height: 0;
  padding: 0;
  overflow: hidden;
  border: 0;
}

.filebox label {
  display: inline-block;
  padding: 10px 20px;
  color: #999;
  vertical-align: middle;
  background-color: #fdfdfd;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-radius: 5px;
}

/* named upload */
.filebox .upload-name {
  display: inline-block;
  height: 35px;
  font-size:18px; 
  padding: 0 10px;
  vertical-align: middle;
  background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-radius: 5px;

}
</style>

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
   			let tr = "<tr><th>첨부파일"+count+"</th><td>";
   				tr+= "<div class='filebox'>";
   				tr+= "<label for='files"+count+"'>업로드</label>";
   				tr+= "<input type='file' name='file"+count+"'id='files"+count+"'/></div></td></tr>";
   
   				
   				
   				
//    			<div class="filebox"> 
// 				  <label for="file">업로드</label> 
// 				  <input type="file" id="file"> 
// 				  <input class="upload-name" value="파일선택">
// 				</div>


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

	<!--
	memNo: ${memNo} <br/>
	memId: ${memId} <br/>
	email:  ${email} <br/><br/>
	
	badRequest:${badRequest}
	-->
	
	<section class="bg">
	<br/><br/>
	
	<div id="tableDiv">
	<form action="${path}/qna/add" id="addForm" method="post" enctype="multipart/form-data">

		<input type="hidden" name="memNo" value="${sessionScope.memNo}" >
		<input type="hidden" name="writerId" value="${sessionScope.memId}" >
		<input type="hidden" name="writerEmail" value="${sessionScope.email}" >

		<table border="1"  style="    width: 63%;">
			<tr>
				<th>작성자 아이디</th>
				<td>${sessionScope.memId}</td>
			</tr>
			<tr>
				<th>글 공개여부</th>
				<td>
					<span><input type="radio" name="secret" id="secret" value="N" class="radio" required="required"><p style="    margin-left: -90%;    margin-top: -1.5%;">공개</p></span>
					<span><input type="radio" name="secret" id="secret" value="Y" class="radio"> <p style=" margin-left: -90%;    margin-top: -1.5%;">비공개</p></span>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" style="color: black; width: 950px;"/>
					<br>
					<spring:hasBindErrors name="qna">
						<c:if test="${errors.hasFieldErrors('title')}">
							<strong style="color: red;">${errors.getFieldError('title').defaultMessage}</strong>
						</c:if>
					</spring:hasBindErrors>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea cols="90" rows="10" name="content" style="color: black;" ></textarea>
					<br>
					<spring:hasBindErrors name="qna">
						<c:if test="${errors.hasFieldErrors('content')}">
							<strong style="color: red;">${errors.getFieldError('content').defaultMessage}</strong>
						</c:if>
					</spring:hasBindErrors>
				</td>
			</tr>
			<tr>
				<td></td>
			    <td>
			    <span id="waringSpan">*주의사항 : 파일은 반드시 순서대로 등록해야합니다</span><br><br>
			        <input type="button" value="파일추가" id="btnAddFile" style="color: black;background-color: #ffffff;border: none;height: 50px;width: 200px;border-radius: 10px;" />
			    	<input type="button" value="파일삭제" id="btnDelFile" style="color: black;background-color: #ffffff;border: none;height: 50px;width: 200px;border-radius: 10px;" />
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<div class="filebox"> 
					  <label for="file">업로드</label> 
					  <input type="file" id="file"> 
					  <input class="upload-name" value="파일선택">
					</div>
	     		</td>
			</tr>	
			<tr id="i1">
	     		<td colspan="2" style="text-align: center;">
	     			<input type="submit" value="등록" style="color: black;background-color: #ffffff;border: none;height: 50px;width: 200px;border-radius: 10px; margin-left: 17%;" />
	     			<input type="button" value="목록" id="btnList" style="color: black;background-color: #ffffff;border: none;height: 50px;width: 200px;border-radius: 10px;" />
	     		</td>
	    	</tr>	
		</table>

		<!-- 업로드용 파일찾기 버튼이 동적으로 생성추가되는 영역
	    <div id="fileArea">
	    </div>
	    -->
	</form>
	</div>
	
	</section>
</body>
</html>