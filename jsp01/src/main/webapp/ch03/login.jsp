<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- session(세션) - 서버에서 사용자를 인증하는 기술 -->
	<form method="post"
		action="<%=request.getContextPath()%>/ch03_servlet/login.do">
		아이디 <input name="id"> <br> 비밀번호 <input type="password"
			name="pass"> <br> <input type="submit" value="로그인">
	</form>
	<!-- 로그인 실패 메시지 -->
	<!-- param.변수 => request.getParameter("변수") -->    
	<span style="color: red;">${param.message}</span>
</body>
</html>
