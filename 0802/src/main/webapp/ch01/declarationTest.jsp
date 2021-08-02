<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="book.*"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	// scriptlet(스크립틀릿)
	String str1 = "java"; //지역변수( jspService() )
	%>
	<%!// jsp 선언부(전역변수, method 선언부)
	String str2 = "hello"; //전역변수
	//method 선언

	String getStr2() {
		return str2;
	}%>
	<%=str1%><br>
	<%=str2%><br>
	<%=getStr2()%><br>
	<%
	BookDAO dao = BookDAO.getDao();
	ArrayList<BookDTO> list = dao.bookList();
	%>
	<ul>
		<%
		for (BookDTO dto : list) {
		%>
		<li><%=dto.getTitle()%> <%=dto.getPrice() %></li>
		<%
		}
		%>
	</ul>
</body>
</html>