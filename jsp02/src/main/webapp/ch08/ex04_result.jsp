<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//세션변수의 값을 조회
	String name = (String) session.getAttribute("name");
	int age = Integer.parseInt((String) session.getAttribute("age"));
	String job = (String) session.getAttribute("job");
	%>
	이름:
	<%=name%><br> 나이:
	<%=age%><br> 직업:
	<%=job%><br> 이름: ${sessionScope.name}
	<br> 나이: ${sessionScope.age}
	<br> 직업: ${sessionScope.job}
	<br>

</body>
</html>