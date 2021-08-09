<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h2>세션의 유효시간 설정</h2>
	<%
	//톰캣 기본값 : 1800초(30분) //session.setMaxInactiveInterval(600); //10분
	int timeout = session.getMaxInactiveInterval();
	out.println("세션의 유효시간:" + timeout); //초 단위
	%>
</body>
</html>