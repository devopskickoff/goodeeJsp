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
		$("#button1").click(function() {
			// id가 dan인 태그에 입력한 값
			var dan = $("#dan").val();
			// 비동기적인 방식으로 서버 호출
			$.ajax({
				type : "post",
				url : "result1.jsp",
				data : "dan=" + dan,
				success : function(data) { //콜백함수
				//alert(data);
				//div 태그에 결과가 출력됨
					$("#result").html(data);
				}
			});
			alert("test");
		});
	});
</script>
</head>
<body>
	<h2>동기식(single thread)</h2>
	<form action="result1.jsp">
		단을 입력하세요 <input type="text" name="dan"> <input type="submit"
			value="확인">
	</form>
	<h2>비동기식(multi thread)</h2>
	단을 입력하세요 - 2 -
	<input type="text" id="dan">
	<input type="button" id="button1" value="확인">
	<div id="result">결과 출력 영역</div>
</body>
</html>