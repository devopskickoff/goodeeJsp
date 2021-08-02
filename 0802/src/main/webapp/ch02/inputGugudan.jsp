<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="<%=request.getContextPath()%>/ch02_servlet/gugudan.do">
		<p>구구단 몇 단을 보여드릴까요?</p>
		<input name="number">
		<input type="submit" value="확인">
	</form>
</body>
</html>