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
	
	// request.getParamter("태그의 name")
	// Integer.valueOf() Integer.parseInt()
	// 스트링을 숫자로 변환
	int dan = Integer.valueOf(request.getParameter("dan"));
	for (int i = 1; i <= 9; i++) {
		out.println(dan + "x" + i + "=" + dan * i + "<br>");
	}
	%>
</body>
</html>