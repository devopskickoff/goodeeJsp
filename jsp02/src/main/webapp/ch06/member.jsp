<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		list();
		$("#btnSave").click(function() {
			insert();
		});
	});
	function insert() {
		var param = "userid=" + $("#userid").val() + "&passwd="
				+ $("#passwd").val() + "&name=" + $("#name").val()
				+ "&address=" + $("#address").val() + "&tel=" + $("#tel").val();
		$.ajax({
			type : "post",
			url : "/jsp02/member_servlet/join.do",
			data : param,
			success : function() {
				list();
				//입력값 초기화
				$("#userid").val("");
				$("#passwd").val("");
				$("#name").val("");
				$("#address").val("");
				$("#tel").val("");
				$("#userid").focus(); //입력포커스 이동
			}
		});
	}
	function list() {
		$.ajax({
			url : "/jsp02/member_servlet/list.do",
			success : function(result) {
				console.log(result);
				$("#memberList").html(result);
			}
		});
	}
</script>
</head>
<body>
	아이디
	<input id="userid">
	<br> 비번
	<input type="password" id="passwd">
	<br> 이름
	<input id="name">
	<br> 주소
	<input id="address">
	<br> 전화
	<input id="tel">
	<br>
	<button id="btnSave">추가</button>
	<div id="memberList"></div>
</body>
</html>