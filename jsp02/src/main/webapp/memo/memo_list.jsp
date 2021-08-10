<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	// 태그.prop("태그의 속성")
	$(function() {
		//모두 선택,해제 체크박스
		$("#chkAll").click(function() {
			//체크 상태이면
			if ($("#chkAll").prop("checked")) {
				//모두 선택
				$("input[name=idx]").prop("checked", true);
			} else { //해제 상태이면
			//모두 해제
				$("input[name=idx]").prop("checked", false);
			}
		});
		$("#btnAllDel")
				.click(
						function() {
							//폼 데이터를 전송할 주소 지정
							document.form1.action = "${pageContext.request.contextPath}/memo_servlet/delete_all.do";
							//폼 데이터를 전송
							document.form1.submit();
						});
	});
	function memo_del(idx) {
		location.href = "${pageContext.request.contextPath}/memo_servlet/del.do?idx="
				+ idx;
	}
</script>
</head>
<body>
	<form method="post" name="form1">
		<table border="1">
			<tr>
				<th><input type="checkbox" id="chkAll"></th>
				<th>번호</th>
				<th>이름</th>
				<th>메모</th>
				<th>날짜</th>
				<th><input type="button" value="선택삭제" id="btnAllDel"></th>
			</tr>
			<c:forEach var="row" items="${list}" varStatus="s">
				<tr>
					<td><input type="checkbox" name="idx" value="${row.idx}">
					</td>
					<%-- <td>${s.count}/ ${list.size() - s.count + 1}</td>
--%>
					<td>${row.idx}</td>
					<td>${row.writer}</td>
					<td><a
						href="${pageContext.request.contextPath}/memo_servlet/view.do?idx=${
row.idx}">
							${row.memo}</a></td>
					<td>${row.post_date}</td>
					<td><input type="button" value="삭제"
						onclick="memo_del('${row.idx}')"></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>