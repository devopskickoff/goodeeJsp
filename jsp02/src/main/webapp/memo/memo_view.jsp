<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;
charset=UTF-8" />
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){ $(“#btnUpdate”).click(function(){
var writer = $(“#writer”);
var memo = $(“#memo”);
if (writer.val() == "") {
alert("이름을 입력하세요");
writer.focus();
return;
}
if (memo.val() == "") {
alert("메모를 입력하세요");
memo.focus();
return;
}
document.form1.action =
"${pageContext.request.contextPath}/memo_servlet/update.do";
document.form1.submit(); }); $(“#btnDelete”).click(function(){
if (confirm("삭제하시겠습니까?")) { //확인 버튼을 클릭하면
true
document.form1.action =
"${pageContext.request.contextPath}/memo_servlet/del.do";
document.form1.submit();
} }); });
</script>
</head>
<body>
	<h2>메모 수정</h2>
	<form name="form1" method="post">
		<table border="1" style="width: 550px">
			<tr>
				<td>이름</td>
				<!-- input 태그의 value 속성==> 태그에 표시되는 기본값
-->
				<td><input type="text" name="writer" id="writer"
					value="${dto.writer}" /></td>
			</tr>
			<tr>
				<td>메모</td>
				<td><input type="text" name="memo" id="memo" size="60"
					value="${dto.memo}" /></td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<!-- 수정,삭제할 때 idx가 꼭 필요할 경우 hidden 태그에
저장 --> <input type="hidden" name="idx" value="${dto.idx}"> <input
					type="button" value="수정" id="btnUpdate"> <input
					type="button" value="삭제" id="btnDelete">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>