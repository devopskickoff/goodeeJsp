<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 페이지 이동 -->
	<!-- get방식으로 전달할 값은 param 태그로 전달 -->
	<c:redirect url="ex04.jsp">
		<c:param name="start" value="2" />
		<c:param name="end" value="5" />
	</c:redirect>
	<%
	//response.sendRedirect("ex04.jsp?start=3&end=7");
	%>
</body>
</html>