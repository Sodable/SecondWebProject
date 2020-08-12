<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>

<!-- -------------------head 설정 시작 ------------------- -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , intial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>매일 날로기먹기</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<!-- -------------------head 설정 마지막------------------- -->



<body>
	<h2>** main으로 시험해보자**</h2>
		<%String loginid =(String) session.getAttribute("id");%>
	<p>
		로그인 id :
		<%=loginid%></p>


	<a href="index.jsp">메인</a><br>
	<a href="/ProtoType/freeboard/view?pagenum=1">자유게시판</a><br>
	<a href="/ProtoType/photoboard/view?date=today&pagenum=1">포토게시판</a><br>
	
	<%if(session.getAttribute("id")==null){ %>
	<hr>
	<a href="/ProtoType/member/login">로그인</a><br>
	<a href="/ProtoType/member/regi">회원가입</a><br>
	<%}else{ %>
	<!-- 로그인 후 이용가능 -->
	<a href="/ProtoType/weather/now?id=<%=loginid%>">현재 날씨 페이지</a><br>
	<a href="/ProtoType/weather/future?id=<%=loginid%>">날씨 예보 페이지</a><br>
	<hr>
	<a href="/ProtoType/member/logout">로그아웃</a><br>
	<a href="/ProtoType/member/regimore">추가 정보 등록</a>
	<%} %>
	
	<%if((session.getAttribute("id")!=null)&&(session.getAttribute("id").equals("master"))){ %>
	<a href="/ProtoType/master/main">관리자 페이지 가기</a>
	<%} %>
	

	<br />
	<hr>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>