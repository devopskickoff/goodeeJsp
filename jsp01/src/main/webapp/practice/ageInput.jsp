<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="<%= request.getContextPath()%>/practice/AgeController.do">
		<div>텍스트 입력 상자에 이름과 출생연도를 계산하여 나이를 출력하는 코드로 작성하시오</div>
		이름<input name="name"><br> 
		출생년도<input name="year"><br>
		<input type="submit" value="확인">
	</form>
</body>
</html>