<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%	request.setCharacterEncoding("utf-8");%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
</head>
<body>
	<footer id="footer" class="text-center">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">

					<div class="footer-logo wow fadeInDown">
						<img
							src="${ pageContext.request.contextPath }/resources/img/logo2.png"
							alt="logo" style="height: 15%; width: 15%;">
					</div>

					<div class="footer-social wow fadeInUp">
						<h3>We are social</h3>
						<ul class="text-center list-inline">
							<li><a href="https://ko-kr.facebook.com/"><i
									class="fa fa-facebook fa-lg"></i></a></li>
							<li><a href="https://twitter.com/"><i
									class="fa fa-twitter fa-lg"></i></a></li>
							<li><a href="https://www.google.com/"><i
									class="fa fa-google-plus fa-lg"></i></a></li>
							<li><a href="http://localhost:8081/"><i
									class="fa fa-dribbble fa-lg"></i></a></li>
						</ul>
					</div>

				</div>
			</div>
		</div>
	</footer>
</body>
</html>


