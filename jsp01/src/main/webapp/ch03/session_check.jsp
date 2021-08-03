<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%> 
<%@page import="java.net.URLEncoder"%>
<%
String userid = (String) session.getAttribute("userid");
if (userid == null) { //세션이 null이면 (로그인 안한 경우)
%>
<script>
   alert("로그인 후 사용가능합니다.");
   location.href = "login.jsp";
</script>
<%
}
%>