<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 결과값 변수 
	String str = "";
	
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비 
	String sql = "SELECT SID, NAME, KOR, ENG, MAT"
			   + ", (KOR+ENG+MAT) \"TOT\", (KOR+ENG+MAT)/3 \"AVG\" FROM TBL_SCORE";
	
	// 작업 객체 생성
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	// 출력 테이블 생성
	str += "<table border='1'><tr><th id='numTitle'>번호</th><th id='nameTitle'>이름</th>"
	     + "<th id='korTitle'>국어점수</th>" 
	     + "<th id='engTitle'>영어점수</th>" 
	     + "<th id='matTitle'>수학점수</th>"
	     + "<th id='totTitle'>총점</th>"
	     + "<th id='avgTitle'>평균</th></tr>";   
	
	// Resultset 처리
	while(rs.next())
	{
		str += "<tr>";
		
		str += "<td id='numContent'>" + rs.getInt("SID") + "</td>";
		str += "<td id='nameContent'>" + rs.getString("NAME") + "</td>";
		str += "<td id='korContent'>" + rs.getInt("KOR") + "</td>";
		str += "<td id='engContent'>" + rs.getInt("ENG") + "</td>";
		str += "<td id='matContent'>" + rs.getInt("MAT") + "</td>";
		str += "<td id='totContent'>" + rs.getInt("TOT") + "</td>";
		str += "<td id='avgContent'>" + String.format("%.1f", rs.getDouble("AVG")) + "</td>";
		
		str += "</tr>";
	}
	
	str += "</table>";
	
	rs.close();
	stmt.close();
	DBConn.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	input { width: 200px; }
	button { width: 208px; height: 50px; font-weight: bold; }
	.errMsg { font-size: small; color: red; display:none; }
	
	#numTitle { width: 50px; }
	#nameTitle { width: 100px; }
	#korTitle, #engTitle, #matTitle, #totTitle, #avgTitle { width: 80px; }
	
	#numContent { text-align: right; }
	#nameContent{ text-align: center; }
	#korContent, #engContent, #matContent, #totContent, #avgContent { text-align: right; }
</style>
<script type="text/javascript">
	function formCheck()
	{
		var uName = document.getElementById("userName");
		var kor = document.getElementById("kor").value;
		var eng = document.getElementById("eng").value;
		var mat = document.getElementById("mat").value;
		//-- 변수를 가져올 때와 유효성 검사를 할 때 value 는 한 번 만 사용해야 함
		//   uName 변수는 유효성 검사를 할 때 uName.value=="" 와 같이 작성했고
		//   kor, eng, mat 은 변수 자체에 저장할 때 .value 를 작성해주고
		//   유효성 검사에서는 kor=="" 처럼 사용했음
		//   null 로 작성하면 조건문에 걸리지 않는 것에 주의.
		
		var nMsg = document.getElementById("nameMsg");
		var kMsg = document.getElementById("korMsg");
		var eMsg = document.getElementById("engMsg");
		var mMsg = document.getElementById("matMsg");
		
		nMsg.style.display = "none";
		kMsg.style.display = "none";
		eMsg.style.display = "none";
		mMsg.style.display = "none";
		//-- 잘못된 값을 입력 후 
		//   다음 시도 때 제대로 된 값을 입력 하면 경고문구가 사라지게 하기 위함
		
		if(uName.value=="")
		{
			nMsg.style.display = "inline";
			return false;
		}
		
		if(kor=="" || Number(kor)<0 || Number(kor)>100)
		{
			//alert("kor : " + kor);
			kMsg.style.display = "inline";
			return false;
		}
		
		if(eng=="" ||  Number(eng)<0 ||  Number(eng)>100)
		{
			//alert("eng : " + eng);
			eMsg.style.display = "inline";
			return false;
		}
		
		if(mat=="" ||  Number(mat)<0 ||  Number(mat)>100)
		{
			//alert("eng : " + eng);
			mMsg.style.display = "inline";
			return false;
		}

		return true;
		
	}
</script>
</head>
<body>

<div>
	<h1>데이터베이스 연결 및 데이터 처리</h1>
	<hr>
</div>

<div>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName">
					<span class="errMsg" id="nameMsg">이름은 필수항목 입니다.</span>
				</td>
			</tr>
			<tr>
				<th>국어</th>
				<td>
					<input type="text" id="kor" name="kor">
					<span class="errMsg" id="korMsg">0~100 사이의 정수를 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<th>영어</th>
				<td>
					<input type="text" id="eng" name="eng">
					<span class="errMsg" id="engMsg">0~100 사이의 정수를 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<th>수학</th>
				<td>
					<input type="text" id="mat" name="mat">
					<span class="errMsg" id="matMsg">0~100 사이의 정수를 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<button type="submit" id="btnInsert" class="btn">성적 입력</button>
				</td>
			</tr>
		</table>
	</form>
	<br><br>
	
	<div>
		<!-- 처리 결과 -->
		<%=str %>
	</div>
</div>

</body>
</html>