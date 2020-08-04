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
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collaps" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">매일 날로 먹기 </a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.jsp">메인</a></li>
				<li><a href="/ProtoType/freeboard/view">자유게시판</a></li>
				<li><a href="/ProtoType/photoboard/view?date=today&pagenum=1">포토게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="/ProtoType/member/login">로그인</a></li>
						<li><a href="view/home/insert.jsp">회원가입</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
	<!-- ---------------------네비게이션 마지막--------------------- -->
	

	<hr>
	
	<a href="/ProtoType/memberSelect.do">회원 리스트</a>
	<br />
	<hr>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script  src="js/bootstrap.js"></script>
</body>
</html>