<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   	request.setCharacterEncoding("UTF-8");
   	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GetTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	body { font-size: 10pt; font-family: 굴림; }
	#resultDiv
	{
		width: 180px;
		height: 180px;
		border: 2px solid #499bd7;
	}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	// 제이쿼리 함수
	$(function()
	{
		// 눌러보자 버튼 클릭 시
		$("#loadBtn").click(function()
		{
			var nickName = $("#nickName").val();
			
			$.get("GetTest02_ok.jsp", {nickName : nickName}, function(data)
			{
				$("#resultDiv").html(data);
			});
		});
		
		// 지워보자 버튼 클릭 시
		$("#clearBtn").click(function()
		{
			$("#resultDiv").empty();
		});
	});

</script>

</head>
<body>

<div>
	<h1>jQuery 의 get() 메소드 실습</h1>
	<hr />
</div>

<div>
	<input type="text" id="nickName" class="txt" />
	<br />
	<button type="button" id="loadBtn" class="btn">눌러보자</button>
	<button type="button" id="clearBtn" class="btn">지워보자</button>
</div>

<div id="resultDiv">
</div>

</body>
</html>