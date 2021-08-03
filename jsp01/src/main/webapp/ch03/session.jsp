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
session.setAttribute("name", "김철수"); //세션 영역에 변수 저장, 모든 페이지에서 사용 가능
session.setAttribute("age", 20);
%>
<jsp:forward page="session_result.jsp"/>

</body>
</html>