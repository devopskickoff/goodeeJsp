<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl(Jsp Standard Tag Library) 선언 -->
<!-- prefix="태그 접두어" uri="태그의 식별자" -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function view(userid) {
		//클릭한 사용자 아이디를 hidden 태그에 복사
		document.form1.userid.value = userid;
		// 컨트롤러 호출
		document.form1.submit();
	}
</script>
</head>
<body>
	<table border="1">
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>가입일자</th>
			<th>주소</th>
			<th>전화</th>
		</tr>
		<c:forEach var="row" items="${map.list}">
			<tr>
				<td><a href="#" onclick="view('${row.userid}')">
						${row.name}</a></td>
				<td>${row.userid}</td>
				<td>${row.passwd}</td>
				<td>${row.reg_date}</td>
				<td>${row.address}</td>
				<td>${row.tel}</td>
			</tr>
		</c:forEach>
	</table>
	<form name="form1" method="post" action="/jsp02/member_servlet/view.do">
		<input type="hidden" name="userid">
	</form>
</body>
</html>