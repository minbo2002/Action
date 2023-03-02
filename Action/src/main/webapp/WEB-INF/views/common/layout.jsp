<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>      <!-- 타일즈 사용하기 위해 추가 -->  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title"/></title>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700" rel="stylesheet" type="text/css">
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
<script	src="${ pageContext.request.contextPath }/resources/js/vendor/modernizr-2.6.2.min.js"></script>
<script	src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
<script	src="${ pageContext.request.contextPath }/resources/js/needDate.js"></script>
<script	src="${ pageContext.request.contextPath }/resources/js/stickysidebar.jquery.js"></script>
<script	src="${ pageContext.request.contextPath }/resources/js/tabs.js"></script>
</head>
<body>
            <tiles:insertAttribute name="header"/>
            
            <tiles:insertAttribute name="side"/>
        
            <tiles:insertAttribute name="body"/>
        
            <tiles:insertAttribute name="footer"/>
</body>
</html>
