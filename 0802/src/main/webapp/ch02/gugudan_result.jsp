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
	int result = (Integer)request.getAttribute("result");
	%>
	<ul>
	<%
	for(int i=1; i<= result; i++){
	%>
		<li> <%=result%> 곱하기 <%= i%>는 <%= result * i%></li>
	<%	
	}
	%>
	</ul>
</body>
</html>