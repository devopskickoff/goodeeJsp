<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js">
	
</script>
<script>
	$(function() {
		// keydown(눌렀을 때), keyup(떼었을 때)
		$("#search").keyup(function() {
			var search = $("#search").val(); //사용자입력값
			if (search.length == 0) { //글자수가 0이면
				$("#div1").css("visibility", "hidden");
			} else {
				$("#div1").css("visibility", "visible");
				$.ajax({
					url : "result3.jsp",
					data : "search=" + search,
					success : function(data) {
						//서버의 응답텍스트(responseText)를
						//div에 출력
						$("#div1").html(data);
					}
				});
			}
		});
	});
</script>
</head>
<body>
	키워드를 입력하세요
	<input type="text" id="search">
	<div id="div1">검색 결과 출력 영역</div>
</body>
</html>