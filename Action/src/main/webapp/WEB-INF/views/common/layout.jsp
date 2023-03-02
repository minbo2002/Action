<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>      <!-- 타일즈 사용하기 위해 추가 -->  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title"/></title>
</head>
<body>
            <tiles:insertAttribute name="header"/>
            
            <tiles:insertAttribute name="side"/>
        
            <tiles:insertAttribute name="body"/>
        
            <tiles:insertAttribute name="footer"/>
</body>
</html>
