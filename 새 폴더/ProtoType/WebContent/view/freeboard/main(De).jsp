<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ page import="DWM.vo.FreeBoardVO" %>
<%@ page import="DWM.vo.MemberVO" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("지금 눈 떠 있는 시간 궁금하죠? : [yyyy년 MM월 dd일 a hh시 mm분]");
%>
<!DOCTYPE HTML>
<!--
   Monochromed by TEMPLATED
    templated.co @templatedco
    Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html class=" desktop 1000px">
<head>
<link rel="shortcut icon" type="image/x-icon"
	href="https://www.flaticon.com/kr/premium-icon/icons/svg/1362/1362476.svg">
<title>매일날로먹기</title>

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="description" content="">
<meta name="keywords" content="">
<link href="http://fonts.googleapis.com/css?family=Oxygen:400,300,700"
	rel="stylesheet" type="text/css">
<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<style type="text/css">
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
	b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline
}

article, aside, details, figcaption, figure, footer, header, hgroup,
	menu, nav, section {
	display: block
}

body {
	line-height: 1
}

ol, ul {
	list-style: none
}

blockquote, q {
	quotes: none
}

blockquote:before, blockquote:after, q:before, q:after {
	content: '';
	content: none
}

table {
	border-collapse: collapse;
	border-spacing: 0
}

body {
	-webkit-text-size-adjust: none
}
</style>
<style type="text/css">
@
-ms-viewport {
	width: device-width
}
</style>
<style type="text/css">
*, *:before, *:after {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box
}
</style>
<style type="text/css">
body {
	min-width: 960px
}

.container {
	margin-left: auto;
	margin-right: auto;
	width: 960px
}

.container.small {
	width: 720px
}

.container.big {
	width: 100%;
	max-width: 1200px;
	min-width: 960px
}
</style>
<style type="text/css">
.\31 2u {
	width: 100%
}

.\31 1u {
	width: 91.6666666667%
}

.\31 0u {
	width: 83.3333333333%
}

.\39 u {
	width: 75%
}

.\38 u {
	width: 66.6666666667%
}

.\37 u {
	width: 58.3333333333%
}

.\36 u {
	width: 50%
}

.\35 u {
	width: 41.6666666667%
}

.\34 u {
	width: 33.3333333333%
}

.\33 u {
	width: 25%
}

.\32 u {
	width: 16.6666666667%
}

.\31 u {
	width: 8.3333333333%
}

.\-11u {
	margin-left: 91.6666666667%
}

.\-10u {
	margin-left: 83.3333333333%
}

.\-9u {
	margin-left: 75%
}

.\-8u {
	margin-left: 66.6666666667%
}

.\-7u {
	margin-left: 58.3333333333%
}

.\-6u {
	margin-left: 50%
}

.\-5u {
	margin-left: 41.6666666667%
}

.\-4u {
	margin-left: 33.3333333333%
}

.\-3u {
	margin-left: 25%
}

.\-2u {
	margin-left: 16.6666666667%
}

.\-1u {
	margin-left: 8.3333333333%
}
</style>
<style type="text/css">
.row>* {
	float: left;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box
}

.row:after {
	content: '';
	display: block;
	clear: both;
	height: 0
}

.row:first-child>* {
	padding-top: 0 !important
}
</style>
<style type="text/css">
.row.flush {
	margin-left: 0
}

.row.flush>* {
	padding: 0 !important
}

.row>* {
	padding-left: 50px
}

.row+.row>* {
	padding: 50px 0 0 50px
}

.row {
	margin-left: -50px
}

.row.half>* {
	padding-left: 25px
}

.row+.row.half>* {
	padding: 25px 0 0 25px
}

.row.half {
	margin-left: -25px
}

.row.quarter>* {
	padding-left: 12.5px
}

.row+.row.quarter>* {
	padding: 12.5px 0 0 12.5px
}

.row.quarter {
	margin-left: -12.5px
}

.row.oneandhalf>* {
	padding-left: 75px
}

.row+.row.oneandhalf>* {
	padding: 75px 0 0 75px
}

.row.oneandhalf {
	margin-left: -75px
}

.row.double>* {
	padding-left: 100px
}

.row+.row.double>* {
	padding: 100px 0 0 100px
}

.row.double {
	margin-left: -100px
}
</style>
<style type="text/css">
.not-desktop, .not-1000px {
	display: none !important
}

.only-mobile {
	display: none !important
}
</style>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style-desktop.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style-1000px.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/floating.css">


<script
	src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery.easing.1.3.js" />"></script>



<script src="<c:url value="resources/js/skel.min.js" />"></script>
<script src="<c:url value="resources/js/skel-panels.min.js" />"></script>
<script src=" <c:url value="resources/js/init.js" />"></script>

<noscript>
	<link rel="stylesheet" href="css/skel-noscript.css" />
	<link rel="stylesheet" href="css/style.css" />
</noscript>
<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="css/ie/v9.css" /><![endif]-->
</head>
<body class="homepage">

	<!-- Header -->
	<div id="header">
		<div class="container">
			<div id="particles-js"></div>
			<!-- Logo -->
			<div id="logo">
				<h1>
					<a href="#">매일날로먹기Page</a>
				</h1>
				<span>Daily-Weather-Service</span>
			</div>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li class="active"><a href="/ProtoType/member/login.do">매일날로먹기</a></li>
					<li><a href="/ProtoType/freeboard/view">소통의공간</a></li>
					<li><a href="/ProtoType/photoboard/view?date=today&pagenum=1"
						onclick="">데일리룩</a></li>
					<li><a href="twocolumn2.html"
						onclick="alert('지역을 설정해주세요(현재구현X)')">날씨달력</a></li>
					<li><a href="onecolumn.html"
						onclick="alert('지역을 설정해주세요(현재구현X)')">채팅관리</a></li>
					<li><a href="onecolumn.html" onclick="alert('페이지 생성중')">날씨에
							대해서</a></li>
				</ul>
			</nav>

		</div>
	</div>
	<!-- Header -->

	<!-- Main -->
	<div id="main">
		<div class="container">
			<header>
				<h3><%=sf.format(nowTime)%></h3>
				<br />
				<h2>자유게시판</h2>
				<br />
			</header>

			<!-- =================================
			
			<%
			String loginid =(String) session.getAttribute("id");
			List<FreeBoardVO> freelist = (List<FreeBoardVO>) request.getAttribute("freelist"); 

			//페이지 부분 이부분을 컨트롤러에서 get으로 보내주면 검색하기 편할듯 
			int pagenum = (int) request.getAttribute("pagenum"); // 입력된 페이지 , 컨트롤러에서 디폴트로 1
			int itemnum = (int) request.getAttribute("itemnum"); // 게시물 총 갯수 받아오기
			int totalpage = (int) itemnum/10 + 1;
			int pageflag = (int) (pagenum-1)/5+1;
			if(!freelist.isEmpty()){
			int fromIndex = (pagenum-1)*10;
			int toIndex = ((pagenum*10 >itemnum) ? itemnum : pagenum*10 );
			freelist = freelist.subList(fromIndex, toIndex);
			}
			//================================================================
			%>
			
			================================== -->
			<table board="0">
				<tr>
					<th>글 번호</th>
					<th>날씨</th>
					<th width="700">제목</th>
					<th>작성자</th>
					<th>작성 날짜</th>
					<th>조회수</th>
				</tr>
				<%
					int gongjicnt = 0;
				for (FreeBoardVO vo : freelist) {
					if ((gongjicnt < 5) && (vo.getFb_weather() != null) && (vo.getFb_weather().equals("공지 사항"))) {
						gongjicnt++;
				%>
				<tr style="background-color: silver;">
					<td><%=vo.getCount()%></td>
					<td><%=vo.getFb_weather()%></td>
					<td><a
						href="/ProtoType/freeboard/viewbody?count=<%=vo.getCount()%>"><%=vo.getTitle()%></a></td>
					<td><%=vo.getId()%></td>
					<td><%=vo.getWrite_date()%></td>
					<td><%=vo.getView_count()%></td>
				</tr>
				<%
					}
				}
				%>
				<%
					for (FreeBoardVO vo : freelist) {
				%>
				<tr>
					<td><%=vo.getCount()%></td>
					<td><%=vo.getFb_weather()%></td>
					<td><a
						href="/ProtoType/freeboard/viewbody?count=<%=vo.getCount()%>"><%=vo.getTitle()%></a></td>
					<td><%=vo.getId()%></td>
					<td><%=vo.getWrite_date()%></td>
					<td><%=vo.getView_count()%></td>
				</tr>
				<%
					}
				%>
			</table>
			<!-- 페이지 넘기는 코드 -->
			<%
				if (pageflag > 1) {
			%>
			<a
				href="/ProtoType/freeboard/view?pagenum=<%=pagenum - (pagenum - 1) % 5 - 1%>">이전</a>
			<%
				}
			%>
			<%
				for (int i = 0; i < ((totalpage - (pageflag - 1) * 5) > 5 ? 5 : (totalpage - (pageflag - 1) * 5)); i++) {
			%>
			<a href="/ProtoType/freeboard/view?pagenum=<%=(pagenum - 1) / 5 * 5 + i + 1%>"><%=(pagenum - 1) / 5 * 5 + i + 1%></a>
			<%
				}
			%>
			<%
				if (pageflag < (int) (totalpage - 1) / 5 + 1) {
			%>
			<a href="/ProtoType/freeboard/view?pagenum=<%=(pagenum - 1) / 5 * 5 + 6%>">다음</a>
			<%
				}
			%>
			<hr>
			<%
				if (loginid != null) {
			%>
			<form action="/ProtoType/freeboard/write">
				<input type="submit" value="글 작성" />
			</form>
			<%
				}
			%>
			<form action="/ProtoType/freeboard/search" method="get">
				<select name="type">
					<option>제목</option>
					<option>내용</option>
					<option>작성자</option>
					<option>제목/내용</option>
				</select> <input type="search" name="search" /> <input type="hidden"
					name="pagenum" value="1" /> <input type="submit" value='검색' />
			</form>
			<div class="row"></div>
			<div class="divider">&nbsp;</div>
			<div class="row">

				<!-- Content -->
				<div class="8u skel-cell-important">
					<section id="content">
						<header>
							<h2>현재 날씨가 궁금하시죠?</h2>
							<span class="byline">rutrum</span>
						</header>
						<p>
							<a href="#" class="image full"><img src="images/pics02.jpg"
								alt=""></a>
						</p>
						<p>
							<strong>Monochromed</strong></a>.
						</p>
						<a href="#" class="button">Read More</a>
					</section>
				</div>
				<!-- /Content -->

				<!-- Sidebar -->
				<div id="sidebar" class="4u">
					<section>
						<header>
							<h2>Gravida praesent</h2>
							<span class="byline">Praesent lacus congue rutrum</span>
						</header>
						<p>Donec leo, vivamus fermentum nibh in augue praesent a lacus
							at urna congue rutrum. Maecenas luctus lectus at sapien.
							Consectetuer adipiscing elit.</p>
						<ul class="default">
							<li><a href="#">Pellentesque quis lectus gravida
									blandit.</a></li>
							<li><a href="#">Lorem ipsum consectetuer adipiscing
									elit.</a></li>
							<li><a href="#">Phasellus nec nibh pellentesque congue.</a></li>
							<li><a href="#">Cras aliquam risus pellentesque
									pharetra.</a></li>
							<li><a href="#">Duis non metus commodo euismod lobortis.</a></li>
							<li><a href="#">Lorem ipsum dolor adipiscing elit.</a></li>
						</ul>
					</section>
				</div>
				<!-- Sidebar -->

			</div>

		</div>
	</div>

	<!-- =========================================
					플로팅메뉴
			========================================= -->

	<script type="text/javascript">
		function FloatMenu() {
			var animationSpeed = 1500;
			var animationEasing = 'easeOutQuint';
			var scrollAmount = $(document).scrollTop();
			var newPosition = menuPosition + scrollAmount;
			if ($(window).height() < $('#fl_menu').height()
					+ $('#fl_menu .menu').height()) {
				$('#fl_menu').css('top', menuPosition);
			} else {
				$('#fl_menu').stop().animate({
					top : newPosition
				}, animationSpeed, animationEasing);
			}
		}
		$(window).load(function() {
			menuPosition = $('#fl_menu').position().top;
			FloatMenu();
		});
		$(window).scroll(function() {
			FloatMenu();
		});
		jQuery(document).ready(function() {
			var fadeSpeed = 500;
			$("#fl_menu").hover(function() { //mouse over
				$('#fl_menu .label').fadeTo(fadeSpeed, 1);
				$("#fl_menu .menu").fadeIn(fadeSpeed);
			}, function() { //mouse out
				$('#fl_menu .label').fadeTo(fadeSpeed, 0.75);
				$("#fl_menu .menu").fadeOut(fadeSpeed);
			});
		});
	</script>

	<div id="fl_menu" style="top: 200px;">
		<div class="label">빠른메뉴</div>
		<div class="menu" style="">
			<a href="../../index.jsp" class="menu_item">로그아웃</a> <a href="#"
				class="menu_item">마이페이지</a> <a href="#" class="menu_item">지역설정변경</a>

		</div>
	</div>
	<!-- =========================================
					메인종료
			========================================= -->

	<!-- Footer -->
	<div id="footer">
		<div class="container">
			<div class="row">
				<div class="3u">
					<section>
						<ul class="style1">
							<li><img
								src="https://w.namu.la/s/6569ec3042bbbcd89ca27a754349adc4ce68ca7b18c8e54e3defb2831eb917650c031bd0949e8d92c900bec68e432d785420afe55a6ed592e4d1a81cb683cbd3309bcc9d02c0ee8160a21d53405f48ff130dbc3667cb5718c1ddff59a3582f9d"
								width="78" height="78" alt=""> <a
								href="https://www.weather.go.kr/w/index.do">기상청 날씨누리</a>
								<p class="posted">공식 기상청</p></li>
							<li><img
								src="http://www.climate.go.kr/home/images/sub2/dev_img2.jpg"
								width="78" height="78" alt=""> <a
								href="http://book.kma.go.kr/index.ax">기상청<br />전자도서관
							</a>
								<p class="posted">전자 도서관</p></li>
							<li><img
								src="http://www.climate.go.kr/data/ott_banner/15952380430.jpg"
								width="78" height="78" alt=""> <a
								href="http://www.climate.go.kr/home/09_monitoring/index.php/main">종합기후변화<br />감시정보
							</a>
								<p class="posted">실시간현황</p></li>
						</ul>
					</section>
				</div>
				<div class="3u">
					<section>
						<ul class="style1">
							<li class="first"><img
								src="http://www.climate.go.kr/home/images/common/logo.png"
								width="78" height="78" alt=""> <a
								href="http://www.climate.go.kr/home/">기상청 <br />기후정보 포털
							</a>
								<p class="posted">실시간예측</p></li>
							<li><img
								src="http://www.climate.go.kr/home/images/sub2/dev_img1.jpg"
								width="78" height="78" alt=""> <a
								href="https://rnd.kma.go.kr/kma_rnd/main/main.do">기상청연구관리 <br />시스템
							</a>
								<p class="posted">날씨관련개발</p></li>
							<li><img
								src="http://www.climate.go.kr/home/images/sub2/dev_img4.jpg"
								width="78" height="78" alt=""> <a
								href="https://www.kmiti.or.kr">한국기상산업<br />기술원
							</a>
								<p class="posted">날씨관련산업</p></li>
						</ul>
					</section>
				</div>
				<div class="6u">
					<section>
						<header>
							<h2>유용한 날씨사이트</h2>
							<h2>알려드릴께요 :)</h2>
							<br />
						</header>
						<p>In posuere eleifend odio. Quisque semper augue mattis wisi.
							Maecenas ligula. Pellentesque viverra vulputate enim. Aliquam
							erat volutpat. Pellentesque tristique ante ut risus. Quisque
							dictum. Integer nisl risus, sagittis convallis, rutrum id,
							elementum congue, nibh. Suspendisse dictum porta lectus.</p>
						<ul class="default">
							<li><a href="#">Pellentesque quis lectus gravida
									blandit.</a></li>
							<li><a href="#">Lorem ipsum consectetuer adipiscing
									elit.</a></li>
							<li><a href="#">Phasellus nec nibh pellentesque congue.</a></li>
							<li><a href="#">Cras aliquam risus pellentesque
									pharetra.</a></li>
							<li><a href="#">Duis non metus commodo euismod lobortis.</a></li>
							<li><a href="#">Lorem ipsum dolor adipiscing elit.</a></li>
						</ul>
					</section>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->

	<!-- Copyright -->
	<div id="copyright">
		<div class="container">
			Design: <a href="http://templated.co">TEMPLATED</a> Images: <a
				href="http://unsplash.com">Unsplash</a> (<a
				href="http://unsplash.com/cc0">CC0</a>)
		</div>
	</div>

</body>
</html>