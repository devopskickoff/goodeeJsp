<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- result3.jsp -->
<%@ page import="keyword.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//한글 인코딩 설정
	request.setCharacterEncoding("utf-8");
	KeywordDAO dao = new KeywordDAO(); //dao 객체 생성
	//사용자가 입력한 키워드
	String keyword = request.getParameter("search");
	//키워드 목록을 테이블에서 조회
	List<String> items = dao.list(keyword);
	//화면에 출력
	for (String str : items) {
		out.println(str + "<br>");
	}
	%>
</body>
</html>