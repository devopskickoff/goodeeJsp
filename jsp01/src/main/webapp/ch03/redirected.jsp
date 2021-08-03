<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>이동된 페이지</h2>
	<%--request.getParameter("name") => ${param.name}--%>
	<%
	// url?name=kim&age=20
	// name변수에 kim, age 변수에 20이 저장되어 전달됨
	// get 방식으로 전달되며 스트링으로 처리됨
	// url decode : 인코딩된 문자열을 원상태로 복구
	// URLDecoder.decode("디코딩할 문자열","언어셋")
	String name = URLDecoder.decode(request.getParameter("name"), "utf-8");
	String age = request.getParameter("age");
	%>
	이름 :
	<%=name%><br> 나이 :
	<%=age%><br>
	<!-- out객체 : 웹브라우저에 html을 출력하는 기능 -->
	이름 :
	<%
	out.println(name);
	%><br> 나이 :
	<%
	out.println(age);
	%><br> 이름 : ${param.name}
	<br> 나이 : ${param.age}
	<br>
</body>
</html>