<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style >


td{
	text-align: center;
}
.searchmove{
			position: relative;
            left: 880px;
            margin:20px;
            }

#tablediv{	
		
}


<style type="text/css">
   th{
      width: 50px;
   }
  
   body {
     color: #666;
     font: 14px/24px "Open Sans", "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", Sans-Serif;
   }
   table {
     border-collapse: separate;
     border-spacing: 0;
     width: 100%;
     margin: auto;
     background-color: white;
     
   }
   th,   td {
     padding: 6px 15px;
   }
   th {
     background: #42444e;
     color: #fff;
     text-align: center;
   }
   tr:first-child th:first-child {
     border-top-left-radius: 6px;
   }
   tr:first-child th:last-child {
     border-top-right-radius: 6px;
   }
   td {
     border-right: 1px solid #c6c9cc;
     border-bottom: 1px solid #c6c9cc;
   }
   td:first-child {
     border-left: 1px solid #c6c9cc;
   }
   tr:nth-child(even) td {
     background: white;
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

</style>
<meta charset="UTF-8">
<title>공지사항 목록</title>
</head>
<body>
<section id="bg">



  
  <div class="searchmove">
  
<form action="${contextPath}/notice/list" style="display:inline;">
        <label for="theater"> 극장선택 </label>
        <select id="theater" name="keyword" value="${keyword}">
          <option value="">-- 선택하세요 --</option>
            <option value="t1">강남대로(씨티)</option>
            <option value="t2">강동</option>
            <option value="t3">군자</option>
            <option value="t4">더 부티크 목동현대백화점</option>
            <option value="t5">동대문</option>
            <option value="t6">마곡</option>
            <option value="t7">목동</option>
            <option value="t8">상봉</option>
            <option value="t9">상암월드컵경기장</option>
            <option value="t10">성수</option>
            <option value="t11">센트럴</option>
            <option value="t12">송파파크하비오</option>
            <option value="t13">신촌</option>
            <option value="t14">이수</option>
            <option value="t15">창동</option>
            <option value="t16">코엑스</option>
            <option value="t17">홍대</option>
            <option value="t18">화곡</option>
            <option value="t19">ARTNINE</option>
        </select>
</form>
    
<form action="${contextPath}/notice/list" style="display:inline;">  
<input type="text" placeholder="검색어를 입력해 주세요." name="keyword" value="${keyword}" />  
<input type="submit" value="검색" />  
</form>  
  </div>
  
<div id="tablediv">

<table border=1 style="width:1200px;">
    <thead>
        <tr>
            <th>번호</th>
            <th>작성자</th>
            <th>극장</th>
            <th>구분</th>
            <th>제목</th>
            <th>등록일</th>
        </tr>
    </thead>
    <tbody>
         <c:forEach var="data" items="${list}">
            <tr>
                <td>${data.noticeNo}</td>
                <td>${data.memberId}</td>
                <td>${data.theater}</td>
                <td>${data.category}</td>
                <td style="width:404px;"><a href="${contextPath}/notice/detailForm?noticeNo=${data.noticeNo}" style="color: black;">${data.title}
                <td><fmt:formatDate value="${data.writeDate}" pattern="yyyy-MM-dd "/></td>
           </a></td>
            </tr>
      </c:forEach>
    </tbody>
</table>

<button type="button" onclick="location.href='${contextPath}/notice/addForm'">글쓰기</button>
</div>
</section>
</body>
</html>





