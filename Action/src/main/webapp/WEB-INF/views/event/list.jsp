<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 목록</title>
</head>
<body>
  <h3>이벤트 목록</h3>
 
<form action="${contextPath}/event/list">  
<input type="text" placeholder="검색어를 입력하세요." name="keyword" value="${keyword}" />  
<input type="submit" value="검색" />
</form>

<table border=1>
    <thead>
        <tr>
            <th>번호</th>
            <th>작성자</th>
            <th>제목</th>
            <th>등록일</th>
        </tr>
    </thead>
    <tbody>
         <c:forEach var="data" items="${list}">
            <tr>
                <td>${data.eventNo}</td>
                <td>${data.memberId}</td>
                <td><a href="${contextPath}/event/detailForm?eventNo=${data.eventNo}">${data.title}
                <td><fmt:formatDate value="${data.writeDate}" pattern="yyyy-MM-dd"/></td>
       </a></td>
            </tr>
      </c:forEach>
    </tbody>
</table>
<button type="button" onclick="location.href='${contextPath}/event/addForm'">글쓰기</button>
</body>
</html>





