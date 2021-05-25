<%@page import="com.test.BoardDTO"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// 테스트
	/*
	String pageNum = request.getParameter("pageNum");
	String num = request.getParameter("num");
	*/
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	// 이전 페이지(List.jsp, 목록 페이지)로 부터 데이터 수신(pageNum, num)
	String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(request.getParameter("num"));
	
	// 조회수 증가
	dao.updateHitCount(num);
	
	// 게시물 상세 내용 가져오기
	BoardDTO dto = dao.getReadData(num);
	
	// 이전 다음 게시물 번호 확인
	int beforeNum = dao.getBeforeNum(num);
	int nextNum = dao.getNextNum(num);
	
	BoardDTO dtoBefore = null;
	BoardDTO dtoNext = null;
	
	if(beforeNum != -1)
		dtoBefore = dao.getReadData(beforeNum);
	if(nextNum != -1)
		dtoNext = dao.getReadData(nextNum);
	
	if(dto==null)
		response.sendRedirect("List.jsp");
	
	// 게시물 본문의 라인 수 확인 및 게시물 내용 재구성
	int lineSu = dto.getContent().split("\n").length;
	dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/article.css">
</head>
<body>

<%-- 테스트
<h1>PageNum : <%=pageNum %></h1>
<h1>num : <%=num %></h1>
--%>

<div id="bbs">
	<div id="bbs_title">
		게 시 판(JDBC 연동 버전)
	</div>
	
	<div id="bbsArticle">
		<div id="bbsArticle_header">
         	<!-- 게시물 제목 -->
         	<%=dto.getSubject() %>
      	</div>

		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>작성자</dt>
				<!-- <dd>박정준</dd> -->
				<dd><%=dto.getName() %></dd>
				<dt>라인수</dt>
				<!-- <dd>2</dd> -->
				<dd><%=lineSu %></dd>
			</dl>
		</div><!-- .bbsArticle_bottomLine -->
		
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>등록일</dt>
				<!-- <dd>2021-05-24</dd> -->
				<dd><%=dto.getCreated() %></dd>
				<dt>조회수</dt>
				<!-- <dd>103</dd> -->
				<dd><%=dto.getHitCount() %></dd>
			</dl>
		</div><!-- .bbsArticle_bottomLine -->
		
		<div id="bbsArticle_content">
			<table style="width: 600;">
				<tr>
					<td style="padding: 10px 40px 10px 10px; vertical-align: top; height: 150;">
						<!-- 어쩌구 저쩌구 게시물 내용입니다. -->
						<%=dto.getContent() %>
					</td>
				</tr>
			</table>
		</div><!-- #bbsArticle_content -->
		
		<div class="bbsArticle_bottomLine">
			<!-- 이전글 -->
			<%
			if (beforeNum != -1)
			{
			%>
			<a href="">이전글 : (<%=beforeNum %>) <%=dtoBefore.getSubject() %></a>
			<%
			}
			else
			{
			%>
			이전글 : 없음
			<%
			}
			%>
		</div><!-- .bbsArticle_bottomLine -->
		
		<div class="bbsArticle_noLine">
			<!-- 다음글 -->
			<%
			if (nextNum != -1)
			{
			%>
			<a href="">다음글 : (<%=nextNum %>) <%=dtoNext.getSubject() %></a>
			<%
			}
			else
			{
			%>
			다음글 : 없음
			<%
			}
			%>
		</div><!-- .bbsArticle_noLine -->
		
	</div><!-- #bbsArticle -->
	
	<div class="bbsArticle_noLine" style="text-align: right;">
		From : <%=dto.getIdAddr() %>
	</div><!-- .bbsArticle_noLine -->
	
	<div id="bbsArticle_footer">
		<div id="leftFooter">
			<input type="button" value="수정" class="btn2"
			onclick="javascript:location.href='<%=cp%>/Updated.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">
			<input type="button" value="삭제" class="btn2"
			onclick="javascript:location.href='<%=cp%>/Delete.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">
		</div><!-- #bbsArticle_footer -->
	
		<div id="rightFooter">
         	<input type="button" value="리스트" class="btn2"
         	onclick="javascript:location.href='<%=cp%>/List.jsp?pageNum=<%=pageNum%>'">
         	<!-- 검색 시에는 리스트 버튼의 주소에 검색에 대한 키워드도 넘겨줘야함 -->
      	</div><!-- #rightFooter -->
      	
   	</div><!-- .bbsArticle_footer -->

</div><!-- #bbs -->

</body>
</html>