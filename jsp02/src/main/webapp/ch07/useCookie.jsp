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
	Cookie[] cookies = request.getCookies(); //쿠키배열
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) { 
			//if(cookies[i].getName().equals("id")){ 
		out.println("쿠키이름:" + cookies[i].getName()); 
		out.println(",쿠키값:" + cookies[i].getValue() + "<br>"); //}
		}
	}
	%>
	<!-- cookie.쿠키변수명.value => 쿠키변수의 값 -->
	<!-- EL(Expression Language, 표현언어)
JSESSIONID 클라이언트의 식별자
웹브라우저가 다르거나 닫았다가 다시 열면 부여
새탭, 새창으로 열면 같음
-->
	아이디 : ${cookie.id.name} ${cookie.id.value}
	<br> 비번 : ${cookie.pwd.name} ${cookie.pwd.value}
	<br> 이름 : ${param.name}
	<br>
	<a href="deleteCookie.jsp?name=${param.name}">쿠키 삭제</a>
	<br>
	<a href="editCookie.jsp">쿠키 변경</a>
	<br>
</body>
</html>