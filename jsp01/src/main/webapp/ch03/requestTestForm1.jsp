<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- request 객체 -->
	<form method="post" action="/jsp01/ch03_servlet/request.do">
		이름 : <input name="name"> <br> 
		나이 : <input type="number" name="age" min="20" max="99"> <br> 
		성별 : <input type="radio" name="gender" value="m" checked> 남 
		<input type="radio" name="gender" value="f"> 여 <br> 
		취미 : <select name="hobby">
			<option value="운동">운동</option>
			<option value="요리" selected>요리</option>
			<option value="낚시">낚시</option>
			<option value="등산">등산</option>
		</select> <input type="submit" value="확인">
	</form>
</body>
</html>