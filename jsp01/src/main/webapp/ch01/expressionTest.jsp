<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<%
String[] str = {"jsp","java","android","html5"}; //String[] str=null;
%>
<ul>
<% for(String s : str) { %>
<li><%=s%></li>
<% } %>
</ul>
</body>
</html>