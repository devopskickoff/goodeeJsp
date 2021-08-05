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
		$("#btnLogin").click(function() { //버튼클릭이벤트
			var id = $("#id").val();//입력값
			var pwd = $("#pwd").val();
			var param = "id=" + id + "&pwd=" + pwd; // 변수명=값&변수명=값
			$.ajax({
				type : "post",
				url : "result2.jsp",
				data : param,
				success : function(data) {
					$("#div1").html(data);
				}
			});
		});
	});
</script>
</head>
<body>
	<h2>비동기적인 방식</h2>
	아이디 :
	<input id="id">
	<br> 비번 :
	<input type="password" id="pwd">
	<br>
	<input type="button" value="확인" id="btnLogin">
	<div id="div1">결과 출력 영역</div>
</body>
</html>