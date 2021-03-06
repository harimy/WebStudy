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
<title>XmlTest02_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendBtn").click(function()
		{
			var params = "title=" + $.trim($("#title").val())
				+ "&content=" + $.trim($("#content").val());
			
			$.ajax(
			{
				type : "POST"
				, url : "XmlTest02_1_ok.jsp"
				, data : params
				, dataType : "xml"
				, success : function(args)
				{
					var out = "";
					//out = ">> 게시물 개수=" + $(args).find("total_dataCount").text() + "<br>";
					$(args).find("comment").each(function()
					{
						var item = $(this);
						var num = item.attr("num");
						var title = item.find("title").text();
						var content = item.find("content").text();
						
						out += ">> id=" + num + "<br>";
						out += "- title=" + title + "<br>";
						out += "- content=" + content + "<br>";
						out += "<br>";
						
					});
					
					$("#resultDiv").html(out);
					
					$("#title").val("");
					$("#content").val("");
					$("#title").focus();
					
				}
				, beforeSend : showRequest
				, error : function(e)
				{
					alert(e.responseText);
					console.log(e);
				}
			});
			
		});
	});
	
	function showRequest(xhr)
	{	
		if (!$.trim($("#title").val()))
		{
			alert("제목을 입력해야 합니다.");
			$("#title").focus();
			return false;
		}
		
		if (!$.trim($("#content").val()))
		{
			alert("내용을 입력해야 합니다.");
			$("#content").focus();
			return false;
		}
		
		return true;
	}

</script>
</head>
<body>

<div>
	<h1>jQuery AJAX XML 관련 실습</h1>
	<hr />
</div>

<div>
	제목 : <input type="text" id="title" class="txt" /><br />
	내용 : <input type="text" id="content" class="txt" /><br />
	<br>
	<input type="button" id="sendBtn" value="전송확인" class="btn"> 
</div>
<br><br>

<div id="resultDiv">
<!-- 
>> id=1<br>
- title=aaaa1<br>
- content=bbbb1<br>

>> id=2<br>
- title=aaaa2<br>
- content=bbbb2<br>
-->
</div>



</body>
</html>