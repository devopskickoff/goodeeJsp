<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- prefix 태그의 접두어 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//세션변수에 값 저장, 모든 자료형 저장
	session.setAttribute("name", "김철수");
	session.setAttribute("age", 20);
	session.setAttribute("job", "dba");
	%>
	<!-- 변수에 저장 var 변수명, value 값, scope 사용범위 -->
	<c:set var="name" value="김철수" scope="session" />
	<c:set var="age" value="20" scope="session" />
	<c:set var="job" value="dba" scope="session" />
	세션변수가 생성되었습니다.
	<br>
	<a href="ex04_result.jsp">확인</a>
</body>
</html>