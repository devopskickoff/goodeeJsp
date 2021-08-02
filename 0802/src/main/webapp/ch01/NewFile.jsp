<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %> <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Date nowDate = new Date(); //날짜 객체
out.println(nowDate+"<br>");
// 날짜의 출력 형식 제공
// yyyy 연도, MM 월, dd 날짜, HH 24시간, hh 12시간
// mm 분, ss : 초
SimpleDateFormat dateFormat=
new SimpleDateFormat("yyyy년 MM월 dd일 a HH:mm:ss");
// 날짜포맷.format(date객체) 출력형식으로 변환
String formatDate = dateFormat.format(nowDate);
%>
현재 날짜는 <%=formatDate%>입니다. </body>
</html>