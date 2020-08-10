<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter"  %>
<!DOCTYPE html>
<html>

<!-- -------------------head 설정 시작 ------------------- -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", intial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>매일 날로기먹기</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<!-- -------------------head 설정 마지막------------------- -->



<body>
	<h2>** main으로 시험해보자**</h2>


	<!-- ---------------------네비게이션 시작--------------------- -->
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.jsp">메인</a></li>
				<li><a href="/ProtoType/weather/now?id=test">현재 날씨 페이지</a></li>
				<li><a href="/ProtoType/weather/future?id=test">날씨 예보 페이지</a></li>
				<li><a href="/ProtoType/freeboard/view">자유게시판</a></li>
				<li><a href="/ProtoType/photoboard/view?date=today&pagenum=1" >포토게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
						<li class="active"><a href="/ProtoType/member/login">로그인</a></li>
						<li><a href="/ProtoType/member/regi">회원가입</a></li>
						<li><a href="/ProtoType/member/regimore">추가 정보 등록</a></li>
			</ul>
	<!-- ---------------------네비게이션 마지막--------------------- -->
	

	<hr>
	
	<a href="/ProtoType/memberSelect.do">회원 리스트</a>
	<br />
	<hr>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script  src="js/bootstrap.js"></script>
</body>
</html>