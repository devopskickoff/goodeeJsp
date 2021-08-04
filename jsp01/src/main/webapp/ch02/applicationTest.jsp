<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%/* 4가지 저장영역
pageContext 현재페이지
request 요청 응답페이지
session 사용자단위
application 서버단위*/ 

//WAS(Wep applcation Server)의 정보
String info = application.getServerInfo();
application.log("WAS정보"+info);
//배포 디렉토리
String path = application.getRealPath("/");
application.log("서비스경로"+path);
application.setAttribute("message", "hello");

%>
<a href="application_result.jsp">서버 변수 확인</a>

</body>
</html>