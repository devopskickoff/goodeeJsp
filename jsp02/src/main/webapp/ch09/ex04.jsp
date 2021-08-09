<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- forEach var="카운터변수" begin="시작값" end="끝값"
step="증가값" -->
	<!-- step에는 0보다 큰 값 입력 -->
	<!-- varStatus="상태변수명"
상태변수.count 일련번호(1부터) 상태변수.index 인덱스(0부터)
-->
	<%-- <c:forEach var="i" begin="0" end="100"
step="1" varStatus="s">
${s.index} / ${s.count} :
<span style="font-size:${110-i}px">hello</span>
<br>
</c:forEach> --%>
	<%-- <%
for(int i=1; i<=100; i++){
%>
<span style="font-size:<%=i%>px">hello</span><br>
<%
}
%> --%>
	<c:forEach var="i" begin="${param.start}" end="${param.end}">
		<h2>${i}단</h2>
		<c:forEach var="j" begin="1" end="9">
${i} x ${j} = ${i * j}<br>
		</c:forEach>
	</c:forEach>
</body>
</html>