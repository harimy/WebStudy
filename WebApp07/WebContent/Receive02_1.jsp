<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("userName");
	String sKor = request.getParameter("kor");
	String sEng = request.getParameter("eng");
	String sMat = request.getParameter("mat");
	
	int kor = Integer.parseInt(sKor);
	int eng = Integer.parseInt(sEng);
	int mat = Integer.parseInt(sMat);
	
	int sum = kor + eng + mat;
	double avg = sum/3.0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive02_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
   <h1>데이터 송수신 실습 02</h1>
   <hr>
</div>

<div>
   	<h2>성적 처리 확인</h2>
	<p><%=name %>님,
   	성적 처리가 완료되었습니다.<br>
   	회원님의 점수는 국어:<%=kor %>점, 영어:<%=eng %>점, 수학:<%=mat %>점 입니다.<br>
   	총점은 <%=sum %>점, 평균은 <%=avg %>점 입니다.</p>
</div>

</body>
</html>