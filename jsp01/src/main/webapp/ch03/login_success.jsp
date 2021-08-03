<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$("#btnLogout").click(function() {
			location.href = "/jsp01/ch03_servlet/logout.do";
		});
	});
</script>
</head>
<body>
	<%@include file="session_check.jsp"%>
	<h2>${sessionScope.message}</h2>
	접속중인 아이디: ${sessionScope.userid}
	<button type="button" id="btnLogout">로그아웃</button>
</body>
</html>