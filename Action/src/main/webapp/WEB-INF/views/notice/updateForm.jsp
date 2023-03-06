<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="contextPath1" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정하기</title>
</head>
<section id="bg">
<body>
<%-- 컨트롤러에 의해서 아래와 같이 모델을 받았다 
 Article article
 model.addAttribute("article",article);--%>

  <h3>공지사항수정(updateForm.jsp)</h3>
  <form id="updateForm" 
        action="${contextPath}/notice/updateForm" method="post">
 	<input type="hidden" name="noticeNo" value="${notice.noticeNo}"/>
   	<table border="1">
 	  <tbody>
 		<tr>
 		 <th>글번호</th>
 		 <td>${notice.noticeNo}</td>
 		</tr>
 		<tr>
 		 <th>작성자</th>
 		 <td>${notice.memberId}</td>
 		</tr>
 		<tr>
 		 <th>제목</th>
 		 <td><input type="text" name="title" id="title" required="required" value="${notice.title}"/></td>	
 		</tr>
 		<tr>
 		 <th>내용</th>
 		 <td><textarea name="content" id="content" cols="30" rows="5" required="required">${notice.content}</textarea></td>	
 		</tr>
 		<tr>
 		 <td colspan="2" style="text-align:center;">
 		 <input type="submit" id="btnSubmit" value="수정(완료)"/>
 		 <input type="reset" id="btnReset" value="취소"/>	
 		 <input type="button" id="btn1"
 		     value="목록보기"
		onclick="location.href='${contextPath}/notice/list?ano=${notice.noticeNo}'"/>
</td>	
 		</tr>
 	  </tbody>
  	</table>
  </form>
</body>
</section>
</html>










