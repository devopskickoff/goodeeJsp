<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Connection conn = null; //db접속 객체
	try {
		// jdbc:oracle:thin:@서버주소:포트:sid
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "java"; //오라클 계정 아이디
		String dbPass = "java1234";//오라클 계정 비번
		//jdbc 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		out.println("오라클에 접속되었습니다.");
	} catch (Exception e) {
		out.println("오라클 접속 에러...");
		e.printStackTrace();
	}
	%>
</body>
</html>