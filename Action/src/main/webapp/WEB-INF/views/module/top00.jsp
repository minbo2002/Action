<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<header id="navigation" class="navbar-fixed-top animated-nav"  style="background: linear-gradient(rgb(0, 0, 0) 0%, rgb(255, 255, 255) 300%);">
	<div class="container">

		<div class="navbar-header" >
			<!-- responsive nav button -->
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle</span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<!-- /responsive nav button -->

			<!-- logo -->
			<h1 class="navbar-brand">
				<a href="#body"> <img
					src="<%=request.getContextPath() %>/resources/img/logo2.png"
					alt="Logo" style="width: 35px; height: 35px;">
				</a>
			</h1>
			<!-- /logo -->
		</div>
		<!-- main nav -->
		<nav class="collapse navigation navbar-collapse navbar-right" 
			role="navigation">
			<ul id="nav" class="nav navbar-nav">
				<li><a href="<%=request.getContextPath()%>/">메인페이지</a></li>
				<li><a href="#portfolio">영화소개</a></li>
				<li><a href="#pricing">예매페이지</a></li>
				<li><a href="#about">스토어</a></li>
				<li><a href="#service">공지사항</a></li>
				<li><a href="#">마이페이지</a></li>
				<li><a href="#contact">테스트페이지</a></li>
			</ul>
		</nav>
	</div>
</header>
<br>
<br>
<br>
<br>

