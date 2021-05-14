<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	ScoreDAO dao = null;
	
	String cnt = "<span id='count'>전체 인원 수 : ";

	try
	{
		dao = new ScoreDAO();
		
		cnt += dao.count() + "명</span>";
		
		str.append("<table class='table'>");
		str.append("<tr><th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th><th>수학점수</th>");
		str.append("<th>총점</th><th>평균</th></tr>");
		
		for (ScoreDTO dto : dao.lists())
		{
			str.append("<tr>");
			str.append("<td class='record'>" + dto.getSid() + "</td>");
			str.append("<td class='record'>" + dto.getName() + "</td>");
			str.append("<td class='record'>" + dto.getKor() + "</td>");
			str.append("<td class='record'>" + dto.getEng() + "</td>");
			str.append("<td class='record'>" + dto.getMat() + "</td>");
			str.append("<td class='record'>" + dto.getTot() + "</td>");
			str.append("<td class='record'>" + String.format("%.1f", dto.getAvg()) + "</td>");
			str.append("</tr>");
		}
		
		str.append("</table>");
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e2)
		{
			System.out.println(e2.toString());
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	.inputTitle { width : 200px; }
	input { width: 200px; border-radius: 6px; }
	button { width: 300px; height: 50px; }
	.errMsg { color: red; font-size: small; display: none; }
	.record { text-align: center; }
</style>
<script>
	
	function formCheck()
	{
		var uName = document.getElementById("userName");
		var uKor = document.getElementById("scoreKor");
		var uEng = document.getElementById("scoreEng");
		var uMat = document.getElementById("scoreMat");
		
		var nMsg = document.getElementById("nameMsg");
		var kMsg = document.getElementById("korMsg");
		var eMsg = document.getElementById("engMsg");
		var mMsg = document.getElementById("matMsg");
		
		nMsg.style.display = "none";
		kMsg.style.display = "none";
		eMsg.style.display = "none";
		mMsg.style.display = "none";
		
		if (uName.value=="")
		{
			nMsg.style.display = "inline";
			uName.focus();
			return false;
		}
		
		if (uKor.value=="" || isNaN(uKor.value)
				|| Number(uKor.value)<0 || Number(uKor.value)>100)
		{
			kMsg.style.display = "inline";
			uKor.focus();
			return false;
		}
		
		if (uEng.value=="" || isNaN(uEng.value)
				|| Number(uEng.value)<0 || Number(uEng.value)>100)
		{
			eMsg.style.display = "inline";
			uEng.focus();
			return false;
		}
		
		if (uMat.value=="" || isNaN(uMat.value)
				|| Number(uMat.value)<0 || Number(uMat.value)>100)
		{
			mMsg.style.display = "inline";
			uMat.focus();
			return false;
		}
		
		return true;
	}
	
</script>
</head>
<body>

<div>
	<h1>데이터베이스 연동 성적처리 실습</h1>
	<hr>
</div>

<div>
	<p>DAO, DTO 개념 적용</p>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table class="table">
			<tr>
				<th class="inputTitle">이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName">
					<span class="errMsg" id="nameMsg">이름은 필수항목 입니다.</span>
				</td>
			</tr>
			<tr>
				<th class="inputTitle">국어점수</th>
				<td>
					<input type="text" id="scoreKor" name="scoreKor">
					<span class="errMsg" id="korMsg">0 ~ 100 사이의 정수를 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<th class="inputTitle">영어점수</th>
				<td>
					<input type="text" id="scoreEng" name="scoreEng">
					<span class="errMsg" id="engMsg">0 ~ 100 사이의 정수를 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<th class="inputTitle">수학점수</th>
				<td>
					<input type="text" id="scoreMat" name="scoreMat">
					<span class="errMsg" id="matMsg">0 ~ 100 사이의 정수를 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" id="btnAdd" class="btn">성적 입력</button>
				</td>
			</tr>
		</table>
	</form>
	<br><br>
	
	<div>
		<!-- 결과 출력 -->
		<%=cnt %>
		<%=str %>
	</div>
</div>

</body>
</html>