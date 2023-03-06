<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("utf-8");%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700" rel="stylesheet" type="text/css">
<script	src="${ pageContext.request.contextPath }/resources/js/vendor/jquery-1.11.1.min.js"></script>
<script	src="${ pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<script	src="${ pageContext.request.contextPath }/resources/js/jquery.nav.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/jquery.mixitup.min.js"></script>
<script	src="${ pageContext.request.contextPath }/resources/js/jquery.fancybox.pack.js"></script>
<script	src="${ pageContext.request.contextPath }/resources/js/jquery.parallax-1.1.3.js"></script>
<script	src="${ pageContext.request.contextPath }/resources/js/jquery.appear.js"></script>
<script	src="${ pageContext.request.contextPath }/resources/js/jquery-countTo.js"></script>
<script	src="${ pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
<script	src="${ pageContext.request.contextPath }/resources/js/wow.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/main.js"></script>
<script	src="${ pageContext.request.contextPath }/resources/js/vendor/modernizr-2.6.2.min.js"></script>
<script	src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
<script	src="${ pageContext.request.contextPath }/resources/js/needDate.js"></script>
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/font-awesome.min.css">
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/jquery.fancybox.css">
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/owl.carousel.css">
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/animate.css">
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/main.css">
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/responsive.css">
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/movie_rank.css">
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/movie_release.css">
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/movie_query.css">

</head>

<style type="text/css">
body {
	background-image:url(${ pageContext.request.contextPath }/resources/img/m_list_bg.png);
}
.tg {
	border-color: white;
	border-collapse: collapse;
	border-spacing: 0;
	border-collapse: collapse;
}
.tg td {
	border-color: border-color:white;
	border-style: solid;
	border-width: 1px;
	font-size: 14px;
	overflow: hidden;
	padding: 10px 25px;
	word-break: normal;
}
.tg th {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-size: 14px;
	font-weight: normal;
	overflow: hidden;
	padding: 15px 20px;
	word-break: normal;
}
.tg .tg-ycr8 {
	background-color: #ffffff;
	text-align: left;
	vertical-align: top
}
.tg .tg-falg {
	background-color: #ecf4ff;
	border-color: #efefef;
	text-align: center;
	vertical-align: top
}
.tg .tg-3xi5 {
	background-color: #ffffff;
	border-color: inherit;
	text-align: center;
	vertical-align: top
}
.tg .tg-4udq {
	background-color: #ecf4ff;
	border-color: #efefef;
	text-align: left;
	vertical-align: top
}
.bg {
	background-color: #121116a6;
	padding-bottom: 90px;
}

.dropdown {
	position: relative;
	display: inline-block;
}
.dropdown-content {
	display: none;
	position: absolute;
	background-color: black;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(255, 255, 255, 0.9);
	padding: 12px 16px;
	z-index: 1;
}
.dropdown:hover .dropdown-content {
	display: block;
}
</style>
</head>
<body>
	<header id="navigation" class="navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle</span> <span class="icon-bar"></span>
					<span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<h1 class="navbar-brand">
					<a href="#body"> <img
						src="${ pageContext.request.contextPath }/resources/img/logo2.png"
						alt="Logo" style="width: 35px; height: 35px;">
					</a>
				</h1>
			</div>
<!-- main nav -->
		<nav class="collapse navigation navbar-collapse navbar-right"
				role="navigation">
				<ul id="nav" class="nav navbar-nav">
					<li ><a href="<%=request.getContextPath()%>/">메인페이지</a></li>
					<li class="dropdown"><a href="#portfolio">영화소개</a>
						<div class="dropdown-content">
							<a href="<%=request.getContextPath()%>/movieReleaseList" >영화 검색</a>
						</div>
					</li>
					<li><a href="#pricing">예매페이지</a></li>
					<li class="dropdown"><a href="#service">스토어</a>
					<div class="dropdown-content">
							<a href="<%=request.getContextPath()%>/store/storeList" >스토어 메뉴</a>
						</div>
					</li>
					<li><a href="#service-bottom">공지사항</a></li>
					<li><a href="#contact">마이페이지</a></li>
					<li><a href="<%=request.getContextPath()%>/test">테스트페이지</a></li>
				</ul>
			</nav>
<!-- /main nav -->
		</div>
	</header>
</body>
</html>
