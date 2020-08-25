<%@ page import="DWM.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!--  
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/">
<script src="<c:url value="/resources/" />"></script>
-->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" type="image/x-icon" href="https://www.flaticon.com/kr/premium-icon/icons/svg/1362/1362476.svg">
    <title>마이페이지</title>
    
    		<!-- --------------------------------------------------------------------------
  								import css
  			--------------------------------------------------------------------------   -->
    		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin/vendors/iconfonts/mdi/css/materialdesignicons.css">
    		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin/css/shared/style.css">
   		 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin/css/demo_1/style.css">
    		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin/images/favicon.ico">
  	
  	
  			<!-- --------------------------------------------------------------------------
  								import js
  			--------------------------------------------------------------------------   -->
  			<script src="<c:url value="/resources/admin/vendors/js/core.js" />"></script>
  			<script src="<c:url value="/resources/admin/vendors/apexcharts/apexcharts.min.js" />"></script>
  			<script src="<c:url value="/resources/admin/vendors/chartjs/Chart.min.js" />"></script>
  			<script src="<c:url value="/resources/admin/js/charts/chartjs.addon.js" />"></script>
  			<script src="<c:url value="/resources/admin/js/template.js" />"></script>
  			<script src="<c:url value="/resources/admin/js/dashboard.js" />"></script>
  			
  	</head>

	<!-- =============================================================================================================================
						Head(끝) Body(시작) 영역 구분 
	============================================================================================================================= -->

  <body class="header-fixed">
    <nav class="t-header">
      <div class="t-header-brand-wrapper">
        <a href="index.html">
          <img class="logo" src="../assets/images/logo.svg" alt="">
          <img class="logo-mini" src="../assets/images/logo_mini.svg" alt="">
        </a>
      </div>
      <div class="t-header-content-wrapper">
        <div class="t-header-content">
          <button class="t-header-toggler t-header-mobile-toggler d-block d-lg-none">
            <i class="mdi mdi-menu"></i>
          </button>
          <form action="#" class="t-header-search-box">
            <div class="input-group">
              <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="Search" autocomplete="off">
              <button class="btn btn-primary" type="submit"><i class="mdi mdi-arrow-right-thick"></i></button>
            </div>
          </form>
          <ul class="nav ml-auto">
            <li class="nav-item dropdown">
              <a class="nav-link" href="#" id="notificationDropdown" data-toggle="dropdown" aria-expanded="false">
                <i class="mdi mdi-bell-outline mdi-1x"></i>
              </a>
              <div class="dropdown-menu navbar-dropdown dropdown-menu-right" aria-labelledby="notificationDropdown">
                <div class="dropdown-header">
                  <h6 class="dropdown-title">Notifications</h6>
                  <p class="dropdown-title-text">You have 4 unread notification</p>
                </div>
                <div class="dropdown-body">
                  <div class="dropdown-list">
                    <div class="icon-wrapper rounded-circle bg-inverse-primary text-primary">
                      <i class="mdi mdi-alert"></i>
                    </div>
                    <div class="content-wrapper">
                      <small class="name">Storage Full</small>
                      <small class="content-text">Server storage almost full</small>
                    </div>
                  </div>
                  <div class="dropdown-list">
                    <div class="icon-wrapper rounded-circle bg-inverse-success text-success">
                      <i class="mdi mdi-cloud-upload"></i>
                    </div>
                    <div class="content-wrapper">
                      <small class="name">Upload Completed</small>
                      <small class="content-text">3 Files uploded successfully</small>
                    </div>
                  </div>
                  <div class="dropdown-list">
                    <div class="icon-wrapper rounded-circle bg-inverse-warning text-warning">
                      <i class="mdi mdi-security"></i>
                    </div>
                    <div class="content-wrapper">
                      <small class="name">Authentication Required</small>
                      <small class="content-text">Please verify your password to continue using cloud services</small>
                    </div>
                  </div>
                </div>
                <div class="dropdown-footer">
                  <a href="#">View All</a>
                </div>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link" href="#" id="messageDropdown" data-toggle="dropdown" aria-expanded="false">
                <i class="mdi mdi-message-outline mdi-1x"><img src="<c:url value="https://image.flaticon.com/icons/svg/929/929417.svg" />"></i> 
                
                <span class="notification-indicator notification-indicator-primary notification-indicator-ripple"></span>
              </a>
              <div class="dropdown-menu navbar-dropdown dropdown-menu-right" aria-labelledby="messageDropdown">
                <div class="dropdown-header">
                  <h6 class="dropdown-title">Messages</h6>
                  <p class="dropdown-title-text">You have 4 unread messages</p>
                </div>
                <div class="dropdown-body">
                  <div class="dropdown-list">
                    <div class="image-wrapper">
                      <img class="profile-img" src="../assets/images/profile/male/image_1.png" alt="profile image">
                      <div class="status-indicator rounded-indicator bg-success"></div>
                    </div>
                    <div class="content-wrapper">
                      <small class="name">Clifford Gordon</small>
                      <small class="content-text">Lorem ipsum dolor sit amet.</small>
                    </div>
                  </div>
                  <div class="dropdown-list">
                    <div class="image-wrapper">
                      <img class="profile-img" src="../assets/images/profile/female/image_2.png" alt="profile image">
                      <div class="status-indicator rounded-indicator bg-success"></div>
                    </div>
                    <div class="content-wrapper">
                      <small class="name">Rachel Doyle</small>
                      <small class="content-text">Lorem ipsum dolor sit amet.</small>
                    </div>
                  </div>
                  <div class="dropdown-list">
                    <div class="image-wrapper">
                      <img class="profile-img" src="../assets/images/profile/male/image_3.png" alt="profile image">
                      <div class="status-indicator rounded-indicator bg-warning"></div>
                    </div>
                    <div class="content-wrapper">
                      <small class="name">Lewis Guzman</small>
                      <small class="content-text">Lorem ipsum dolor sit amet.</small>
                    </div>
                  </div>
                </div>
                <div class="dropdown-footer">
                  <a href="#">View All</a>
                </div>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link" href="#" id="appsDropdown" data-toggle="dropdown" aria-expanded="false">
                <i class="mdi mdi-apps mdi-1x"></i>
              </a>
              <div class="dropdown-menu navbar-dropdown dropdown-menu-right" aria-labelledby="appsDropdown">
                <div class="dropdown-header">
                  <h6 class="dropdown-title">프로필</h6>
                  <p class="dropdown-title-text mt-2">접속 주소지 : 서울시 동작구</p>
                </div>
                <div class="dropdown-body border-top pt-0">
                  <a class="dropdown-grid">
                    <i class="grid-icon mdi mdi-jira mdi-2x"></i>
                    <span class="grid-tittle">Home</span>
                  </a>
                  <a class="dropdown-grid">
                    <i class="grid-icon mdi mdi-trello mdi-2x"></i>
                    <span class="grid-tittle">자유게시판</span>
                  </a>
                  <a class="dropdown-grid">
                    <i class="grid-icon mdi mdi-artstation mdi-2x"></i>
                    <span class="grid-tittle">사진게시판</span>
                  </a>
                  <a class="dropdown-grid">
                    <i class="grid-icon mdi mdi-bitbucket mdi-2x"></i>
                    <span class="grid-tittle">캘린더</span>
                  </a>
                </div>
                <div class="dropdown-footer">
                  <a href="#">로그아웃</a>
                </div>
              </div>
            </li>
          </ul>
          
        </div>
      </div>
    </nav>
    <!-- partial -->
    <div class="page-body">
      <!-- partial:partials/_sidebar.html -->
      <div class="sidebar">
      	<header style="text-align: center; font-weight: bold; font-size: large;"><a href="#">매일날로먹기</a><br>MyPage </header>
        <div class="user-profile">
          <div class="display-avatar animated-avatar">
          
            <img class="profile-img img-lg rounded-circle" src="<c:url value="/resources/admin/images/profile/male/image_1.png" />" alt="">
          </div>
          <div class="info-wrapper">
            <h6 class="user-name">이름</h6>
            <p class="display-income">ID : hello <br/>e-mail : yammy</p>
          </div>
        </div>
        <ul class="navigation-menu">
          <li class="nav-category-divider">카테고리</li>
          <li>
            <a href="#">
              <span class="link-title">관리</span>
              <i class="mdi mdi-gauge link-icon"></i>
            </a>
          </li>
          <li>
            <a href="#sample-pages" data-toggle="collapse" aria-expanded="false">
              <span class="link-title">내정보수정</span>
              <i class="mdi mdi-flask link-icon"></i>
            </a>
            <ul class="collapse navigation-submenu" id="sample-pages">
              <li>
                <a href="" target="_blank">인덱스(로그인회원가입)</a>
              </li>
              <li>
                <a href="" target="_blank">메인관리</a>
              </li>
               <li>
                <a href="" target="_blank">사진게시판</a>
              </li>
               <li>
                <a href="" target="_blank">포토게시판(데일리룩)</a>
              </li>
               <li>
                <a href="" target="_blank">날씨채팅</a>
              </li>
               <li>
                <a href="" target="_blank">날씨달력</a>
              </li>
            </ul>
          </li>
          
        <div class="sidebar-upgrade-banner">
          <p class="text-gray">현재 개발중인 주제
          
          <br/>
           <b class="text-primary">투표서비스</b> 
          <br/>
			</p>          
           	
          <a class="btn upgrade-btn" target="_blank" href="#">구경하기</a>
        </div>
      </div>
      <!-- partial -->
      <div class="page-content-wrapper">
        <div class="page-content-wrapper-inner">
          <div class="content-viewport">
            
            <div class="row">
        
              <div class="col-lg-5 col-md-6 col-sm-12 equel-grid">
                <div class="grid">
                  <div class="grid-body">
                    <div class="split-header">
                      <p class="card-title">게시글관리</p>
                      <span class="btn action-btn btn-xs component-flat" data-toggle="tooltip" data-placement="left" title="Available balance since the last week">
                        <i class="mdi mdi-information-outline text-muted mdi-2x"></i>
                      </span>
                    </div>
                    <div class="d-flex align-items-end mt-2">
                      <h3>게시물 개수</h3>
                      <p class="ml-1 font-weight-bold">총621개</p>
                    </div>
                    <div class="d-flex mt-2">
                      <div class="wrapper d-flex pr-4">
                        <small class="text-success font-weight-medium mr-2">자유게시글</small>
                        <small class="text-gray">321개</small>
                      </div>
                      <div class="wrapper d-flex">
                        <small class="text-primary font-weight-medium mr-2">사진게시물</small>
                        <small class="text-gray">300개</small>
                      </div>
                    </div>
                    <div class="d-flex flex-row mt-4 mb-4">
                      <button class="btn btn-outline-light text-gray component-flat w-50 mr-2" type="button">자유게시판</button>
                      <button class="btn btn-outline-light text-gray component-flat w-50 mr-2" type="button">사진게시판</button>
                      <!-- <button class="btn btn-primary w-50 ml-2" type="button"></button> -->
                    </div>
                    <div class="d-flex mt-5 mb-3">
                      <small class="mb-0 text-primary">최근게시물</small>
                    </div>
                    <div class="d-flex justify-content-between border-bottom py-2">
                      <p class="text-black">사진게시판1</p>
                      <p class="text-gray">사진게시판내용1</p>
                    </div>
                    <div class="d-flex justify-content-between border-bottom py-2">
                      <p class="text-black">자유게시판1</p>
                      <p class="text-gray">자유게시판내용1</p>
                    </div>
                    <div class="d-flex justify-content-between pt-2">
                      <p class="text-black">자유게시판2</p>
                      <p class="text-gray">자유게시판2</p>
                    </div>
                  </div>
                </div>
              </div>
              
              <div class="col-lg-5 col-md-6 col-sm-12 equel-grid">
                <div class="grid">
                  <div class="grid-body">
                    <div class="split-header">
                      <p class="card-title">질문</p>
                      <span class="btn action-btn btn-xs component-flat" data-toggle="tooltip" data-placement="left" title="Available balance since the last week">
                        <i class="mdi mdi-information-outline text-muted mdi-2x"></i>
                      </span>
                    </div>
                    <div class="d-flex align-items-end mt-2">
                      <h3>Q&A</h3>
                      <p class="ml-1 font-weight-bold"></p>
                    </div>
                    <div class="d-flex mt-2">
                      <div class="wrapper d-flex pr-4">
                        <small class="text-success font-weight-medium mr-2">나의 문의</small>
                        <small class="text-gray">3개</small>
                      </div>
                      
                    </div>
                    <div class="d-flex flex-row mt-4 mb-4">
                      <button class="btn btn-outline-light text-gray component-flat w-50 mr-2" type="button">나의문의보기</button>
                      <button class="btn btn-outline-light text-gray component-flat w-50 mr-2" type="button">모든문의</button>
                      <!-- <button class="btn btn-primary w-50 ml-2" type="button"></button> -->
                    </div>
                    <div class="d-flex mt-5 mb-3">
                      <small class="mb-0 text-primary">자주묻는질문</small>
                    </div>
                    <div class="d-flex justify-content-between border-bottom py-2">
                      <p class="text-black">질문1</p>
                      <p class="text-gray">내용1</p>
                    </div>
                    <div class="d-flex justify-content-between border-bottom py-2">
                      <p class="text-black">질문2</p>
                      <p class="text-gray">내용2</p>
                    </div>
                    <div class="d-flex justify-content-between pt-2">
                      <p class="text-black">질문3</p>
                      <p class="text-gray">내용3</p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-8 equel-grid">
                <div class="grid">
                  <div class="grid-body py-3">
                    <p class="card-title ml-n1" style="font-weight: bold;">실시간반응</p>
                  </div>
                  <div class="table-responsive">
                    <table class="table table-hover table-sm">
                      <thead>
                        <tr class="solid-header">
                          <th colspan="2" class="pl-4">회원프로필</th>
                          <th>회원ID Or 이름</th>
                          <th>시간</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td class="pr-0 pl-4">
                            <img class="profile-img img-sm" src="../assets/images/profile/male/image_4.png" alt="profile image">
                          </td>
                          <td class="pl-md-0">
                            <small class="text-black font-weight-medium d-block">회원1</small>
                            <span class="text-gray">
                              <span class="status-indicator rounded-indicator small bg-primary"></span>자유게시판</span>
                          </td>
                          <td>
                            <small>승우</small>
                          </td>
                          <td> 오후 1:50 </td>
                        </tr>
                        <tr>
                          <td class="pr-0 pl-4">
                            <img class="profile-img img-sm" src="../assets/images/profile/male/image_3.png" alt="profile image">
                          </td>
                          <td class="pl-md-0">
                            <small class="text-black font-weight-medium d-block">회원2</small>
                            <span class="text-gray">
                              <span class="status-indicator rounded-indicator small bg-success"></span>자유게시판</span>
                          </td>
                          <td>
                            <small>윤주</small>
                          </td>
                          <td>  오후 1:50</td>
                        </tr>
                        <tr>
                          <td class="pr-0 pl-4">
                            <img class="profile-img img-sm" src="../assets/images/profile/female/image_2.png" alt="profile image">
                          </td>
                          <td class="pl-md-0">
                            <small class="text-black font-weight-medium d-block">회원3</small>
                            <span class="text-gray">
                              <span class="status-indicator rounded-indicator small bg-warning"></span>데일리룩-사진 </span>
                          </td>
                          <td>
                            <small>승우</small>
                          </td>
                          <td> 오후 1:50</td>
                        </tr>
                        <tr>
                          <td class="pr-0 pl-4">
                            <img class="profile-img img-sm" src="../assets/images/profile/male/image_10.png" alt="profile image">
                          </td>
                          <td class="pl-md-0">
                            <small class="text-black font-weight-medium d-block">회원4</small>
                            <span class="text-gray">
                              <span class="status-indicator rounded-indicator small bg-success"></span>날씨캘린더-일정 </span>
                          </td>
                          <td>
                            <small>윤주</small>
                          </td>
                          <td> 오후 1:50</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <a class="border-top px-3 py-2 d-block text-gray" href="#">
                    <small class="font-weight-medium"><i class="mdi mdi-chevron-down mr-2"></i>오늘날짜 총 활동내역 보기</small>
                  </a>
                </div>
              </div>
              <div class="col-md-4 equel-grid">
                <div class="grid">
                  <div class="grid-body">
                    <div class="split-header">
                      <p class="card-title" style="font-weight: bold;">나의 날씨주소 즐겨찾기</p>
                      <div class="btn-group">
                        <button type="button" class="btn btn-trasnparent action-btn btn-xs component-flat pr-0" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <i class="mdi mdi-dots-vertical"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right">
                          <a class="dropdown-item" href="#">Expand View</a>
                          <a class="dropdown-item" href="#">Edit</a>
                        </div>
                      </div>
                    </div>
                    <div class="vertical-timeline-wrapper">
                      <div class="timeline-vertical dashboard-timeline">
                        <div class="activity-log">
                          <p class="log-name">주소지별명1</p>
                          <div class="log-details"> 실제주소 <div class="wrapper mt-2">
                              <button type="button" class="btn btn-xs btn-primary">수정</button>
                              <button type="button" class="btn btn-xs btn-inverse-primary">삭제</button>
                            </div>
                          </div>
                          <small class="log-time">강남구-강남동</small>
                        </div>
                        <div class="vertical-timeline-wrapper">
                      <div class="timeline-vertical dashboard-timeline">
                        <div class="activity-log">
                          <p class="log-name">주소지별명2</p>
                          <div class="log-details"> 실제주소 <div class="wrapper mt-2">
                              <button type="button" class="btn btn-xs btn-primary">수정</button>
                              <button type="button" class="btn btn-xs btn-inverse-primary">삭제</button>
                            </div>
                          </div>
                          <small class="log-time">강남구-강남동</small>
                        </div>
                        <!--  <div class="activity-log">
                          <p class="log-name">윤주</p>
                          <div class="log-details">게시물 업로드 <div class="grouped-images mt-2">
                              <img class="img-sm" src="" alt="Profile Image" data-toggle="tooltip" title="Gerald Pierce">
                              <img class="img-sm" src="" alt="Profile Image" data-toggle="tooltip" title="Edward Wilson">
                              <img class="img-sm" src="" alt="Profile Image" data-toggle="tooltip" title="Billy Williams">
                              <img class="img-sm" src="" alt="Profile Image" data-toggle="tooltip" title="Lelia Hampton">
                              <span class="plus-text img-sm">+3</span>
                            </div>
                          </div>
                          <small class="log-time">3 Hours Ago</small>
                        </div> -->
                        <div class="activity-log">
                          <p class="log-name">주소지별명3</p>
                          <div class="log-details"> 실제주소 <div class="wrapper mt-2">
                              <button type="button" class="btn btn-xs btn-primary">수정</button>
                              <button type="button" class="btn btn-xs btn-inverse-primary">삭제</button>
                            </div>
                          </div>
                          <small class="log-time">강서구-공항동</small>
                        </div>
                        <div class="activity-log">
                          <p class="log-name">주소지별명4</p>
                          <div class="log-details"> 실제주소 <div class="wrapper mt-2">
                              <button type="button" class="btn btn-xs btn-primary">수정</button>
                              <button type="button" class="btn btn-xs btn-inverse-primary">삭제</button>
                            </div>
                          </div>
                          <small class="log-time">강남구-강남동</small>
                        </div>
                        <div class="activity-log">
                          <p class="log-name">주소지별명5</p>
                          <div class="log-details"> 실제주소 <div class="wrapper mt-2">
                              <button type="button" class="btn btn-xs btn-primary">수정</button>
                              <button type="button" class="btn btn-xs btn-inverse-primary">삭제</button>
                            </div>
                          </div>
                          <small class="log-time">마포구-상수동</small>
                        </div>
                      </div>
                    </div>
                  </div>
                  <a class="border-top px-3 py-2 d-block text-gray" href="#">
                    <small class="font-weight-medium"><i class="mdi mdi-chevron-down mr-2"></i> 주소지목록 생성하기</small>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <footer class="footer">
          <div class="row">
            <div class="col-sm-6 text-center text-sm-right order-sm-1">
              <ul class="text-gray">
                <li><a href="#">승우</a></li>
                <li><a href="#">윤주</a></li>
              </ul>
            </div>
            <div class="col-sm-6 text-center text-sm-left mt-3 mt-sm-0">
              <small class="text-muted d-block">최종 수정 날짜 @ 2020/08/14일 <a href="" target="_blank">매일날로먹기</a></small>
              <small class="text-gray mt-2">PlayData<i class="mdi mdi-heart text-danger"></i></small>
            </div>
          </div>
        </footer>
      </div>
    </div>
    
    
    

  </body>
</html>