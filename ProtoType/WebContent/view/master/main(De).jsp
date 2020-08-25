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
    <title>관리자페이지</title>
    
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
                <i class="mdi mdi-message-outline mdi-1x"></i>
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
                  <h6 class="dropdown-title">Apps</h6>
                  <p class="dropdown-title-text mt-2">Authentication required for 3 apps</p>
                </div>
                <div class="dropdown-body border-top pt-0">
                  <a class="dropdown-grid">
                    <i class="grid-icon mdi mdi-jira mdi-2x"></i>
                    <span class="grid-tittle">Jira</span>
                  </a>
                  <a class="dropdown-grid">
                    <i class="grid-icon mdi mdi-trello mdi-2x"></i>
                    <span class="grid-tittle">Trello</span>
                  </a>
                  <a class="dropdown-grid">
                    <i class="grid-icon mdi mdi-artstation mdi-2x"></i>
                    <span class="grid-tittle">Artstation</span>
                  </a>
                  <a class="dropdown-grid">
                    <i class="grid-icon mdi mdi-bitbucket mdi-2x"></i>
                    <span class="grid-tittle">Bitbucket</span>
                  </a>
                </div>
                <div class="dropdown-footer">
                  <a href="#">View All</a>
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
      	<header style="text-align: center; font-weight: bold; font-size: large;"> 매일날로먹기<br>Admin </header>
        <div class="user-profile">
          <div class="display-avatar animated-avatar">
          
            <img class="profile-img img-lg rounded-circle" src="<c:url value="/resources/admin/images/profile/male/image_1.png" />" alt="">
          </div>
          <div class="info-wrapper">
            <h6 class="user-name">매일날로먹기</h6>
            <p class="display-income">관리자 : SeunWu <br/>관리자 : Yunju</p>
          </div>
        </div>
        <ul class="navigation-menu">
          <li class="nav-category-divider">카테고리</li>
          <li>
            <a href="#">
              <span class="link-title">대시보드</span>
              <i class="mdi mdi-gauge link-icon"></i>
            </a>
          </li>
          <li>
            <a href="#sample-pages" data-toggle="collapse" aria-expanded="false">
              <span class="link-title">페이지관리</span>
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
          <li>
            <a href="#ui-elements" data-toggle="collapse" aria-expanded="false">
              <span class="link-title">Front 관리</span>
              <i class="mdi mdi-bullseye link-icon"></i>
            </a>
            <ul class="collapse navigation-submenu" id="ui-elements">
              <li>
                <a href="#">CSS</a>
              </li>
              <li>
                <a href="#">JS</a>
              </li>
              <li>
                <a href="#">Images</a>
              </li>
            </ul>
          </li>
          <li>
            <a href="#">
              <span class="link-title">Back 관리</span>
              <i class="mdi mdi-clipboard-outline link-icon"></i>
            </a>
          </li>
          <li>
            <a href="#">
              <span class="link-title">접속자관리</span>
              <i class="mdi mdi-chart-donut link-icon"></i>
            </a>
          </li>
          <li>
            <a href="#">
              <span class="link-title">통계차트</span>
              <i class="mdi mdi-flower-tulip-outline link-icon"></i>
            </a>
          </li>
          <li class="nav-category-divider">기타</li>
          <li>
            <a href="#">
              <span class="link-title">자원관리</span>
              <i class="mdi mdi-asterisk link-icon"></i>
            </a>
          </li>
        </ul>
        <div class="sidebar-upgrade-banner">
          <p class="text-gray">현재 개발중인 주제
          
          <br/>
           <b class="text-primary">투표서비스</b> 
          <br/>
          
           	
           	메인사이트안에</p>
          <a class="btn upgrade-btn" target="_blank" href="#">확인하기</a>
        </div>
      </div>
      <!-- partial -->
      <div class="page-content-wrapper">
        <div class="page-content-wrapper-inner">
          <div class="content-viewport">
            <div class="row">
              <div class="col-12 py-5">
                <h4>대시보드</h4>
                <p class="text-gray">각종 통계 차트</p>
              </div>
            </div>
            <div class="row">
              <div class="col-md-3 col-sm-6 col-6 equel-grid">
                <div class="grid">
                  <div class="grid-body text-gray">
                    <div class="d-flex justify-content-between">
                      <p>30%</p>
                      <p>+06.2%</p>
                    </div>
                    <p class="text-black">트래픽</p>
                    <div class="wrapper w-50 mt-4">
                      <canvas height="45" id="stat-line_1"></canvas>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-3 col-sm-6 col-6 equel-grid">
                <div class="grid">
                  <div class="grid-body text-gray">
                    <div class="d-flex justify-content-between">
                      <p>43%</p>
                      <p>+15.7%</p>
                    </div>
                    <p class="text-black">오늘접속자</p>
                    <div class="wrapper w-50 mt-4">
                      <canvas height="45" id="stat-line_2"></canvas>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-3 col-sm-6 col-6 equel-grid">
                <div class="grid">
                  <div class="grid-body text-gray">
                    <div class="d-flex justify-content-between">
                      <p>23%</p>
                      <p>+02.7%</p>
                    </div>
                    <p class="text-black">게시판 업로드</p>
                    <div class="wrapper w-50 mt-4">
                      <canvas height="45" id="stat-line_3"></canvas>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-3 col-sm-6 col-6 equel-grid">
                <div class="grid">
                  <div class="grid-body text-gray">
                    <div class="d-flex justify-content-between">
                      <p>+75%</p>
                      <p>+ 53.34 명</p>
                    </div>
                    <p class="text-black">날씨채팅 회원수</p>
                    <div class="wrapper w-50 mt-4">
                      <%-- <canvas height="45" id="stat-line_4"></canvas> --%>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 equel-grid">
                <div class="grid">
                  <div class="grid-body d-flex flex-column h-100">
                    <div class="wrapper">
                      <div class="d-flex justify-content-between">
                        <div class="split-header">
                          <img class="img-ss mt-1 mb-1 mr-2" src="../assets/images/social-icons/instagram.svg" alt="">
                          <p class="card-title">모든 회원 관리</p>
                        </div>
                        <div class="wrapper">
                          <button class="btn action-btn btn-xs component-flat pr-0" type="button"><i class="mdi mdi-access-point text-muted mdi-2x"></i></button>
                          <button class="btn action-btn btn-xs component-flat pr-0" type="button"><i class="mdi mdi-cloud-download-outline text-muted mdi-2x"></i></button>
                        </div>
                      </div>
                      <div class="d-flex align-items-end pt-2 mb-4">
                        <h4>16.2K 명</h4>
                        <p class="ml-2 text-muted">증가/감소</p>
                      </div>
                    </div>
                    <div class="mt-auto">
                    	<h2>회원 가입자수 막대그래프 넣기(집계는 생각중)</h2>
                      <%-- <canvas class="curved-mode" id="followers-bar-chart" height="220"></canvas> --%>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 equel-grid">
                <div class="grid">
                  <div class="grid-body">
                    <p class="card-title">총 사진  업로드수</p>
                    <div id="radial-chart"></div>
                    &nbsp;
                    <h4 class="text-center">133,335개</h4>
                    <p class="text-center text-muted">데일리룩 업로드수</p>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 equel-grid">
                <div class="grid table-responsive">
                  <table class="table table-stretched">
                    <thead>
                      <tr>
                        <th>공지사항관리</th>
                        <th>주제</th>
                        <th style="text-align: center;">날짜</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          <p class="mb-n1 font-weight-medium">이벤트1</p>
                          <small class="text-gray">이벤트1</small>
                        </td>
                        <td class="font-weight-medium">사진</td>
                        <td class="text-danger font-weight-medium">
                          <div class="badge badge-success">20/08/15</div>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <p class="mb-n1 font-weight-medium">공지사항1</p>
                          <small class="text-gray">공지사항1</small>
                        </td>
                        <td class="font-weight-medium">날씨</td>
                        <td class="text-danger font-weight-medium">
                          <div class="badge badge-danger">20/04/12</div>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <p class="mb-n1 font-weight-medium">이벤트1</p>
                          <small class="text-gray">이벤트2</small>
                        </td>
                        <td class="font-weight-medium">날씨</td>
                        <td class="text-danger font-weight-medium">
                          <div class="badge badge-success">20/03/11</div>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <p class="mb-n1 font-weight-medium">이벤트3</p>
                          <small class="text-gray">이벤트3</small>
                        </td>
                        <td class="font-weight-medium">사진</td>
                        <td class="text-danger font-weight-medium">
                          <div class="badge badge-success">20/08/12</div>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <p class="mb-n1 font-weight-medium">이벤트4</p>
                          <small class="text-gray">이벤트4</small>
                        </td>
                        <td class="font-weight-medium">예측</td>
                        <td class="text-danger font-weight-medium">
                          <div class="badge badge-success">20/01/01</div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
              <div class="col-lg-5 col-md-6 col-sm-12 equel-grid">
                <div class="grid">
                  <div class="grid-body">
                    <div class="split-header">
                      <p class="card-title">게시판관리</p>
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
                        <small class="text-success font-weight-medium mr-2">자유게시판</small>
                        <small class="text-gray">321개</small>
                      </div>
                      <div class="wrapper d-flex">
                        <small class="text-primary font-weight-medium mr-2">사진게시판</small>
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
              <div class="col-lg-7 col-md-12 equel-grid">
                <div class="grid widget-revenue-card">
                  <div class="grid-body d-flex flex-column h-100">
                    <div class="split-header">
                      <p class="card-title">접속자 비교</p>
                      <div class="content-wrapper v-centered">
                        <small class="text-muted">총집계 : 1시간전</small>
                        <span class="btn action-btn btn-refresh btn-xs component-flat">
                          <i class="mdi mdi-autorenew text-muted mdi-2x"></i>
                        </span>
                        <br/>
                      <h3 class="font-weight-medium mt-4">현재 접속자 / 일일 접속자 꺽은선그래프2개로 비교</h3>
                      </div>
                    </div>
                    <div class="mt-auto">
                      <canvas id="cpu-performance" height="80"></canvas>
                      <h3 class="font-weight-medium mt-4">사이트접속 메모리 : 69.05%</h3>
                      <p class="text-gray">저장소</p>
                      <div class="w-50">
                        <div class="d-flex justify-content-between text-muted mt-3">
                          <small></small> <small>35.62 GB / 2TB</small>
                        </div>
                        <div class="progress progress-slim mt-2">
                          <div class="progress-bar bg-primary" role="progressbar" style="width: 68%" aria-valuenow="68" aria-valuemin="0" aria-valuemax="100">
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-8 equel-grid">
                <div class="grid">
                  <div class="grid-body py-3">
                    <p class="card-title ml-n1" style="font-weight: bold;">회원활동내역</p>
                  </div>
                  <div class="table-responsive">
                    <table class="table table-hover table-sm">
                      <thead>
                        <tr class="solid-header">
                          <th colspan="2" class="pl-4">회원프로필</th>
                          <th>회원ID Or 이름</th>
                          <th>업로드내용</th>
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
                          <td> 안녕하세요 </td>
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
                          <td> 네~~ </td>
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
                          <td>사진</td>
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
                          <td> 커피를 마십니다</td>
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
                      <p class="card-title" style="font-weight: bold;">현재접속자 목록</p>
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
                          <p class="log-name">승우</p>
                          <div class="log-details">접속<span class="text-primary ml-1">#서울</span></div>
                          <small class="log-time">8분전</small>
                        </div>
                        <div class="vertical-timeline-wrapper">
                      <div class="timeline-vertical dashboard-timeline">
                        <div class="activity-log">
                          <p class="log-name">윤주</p>
                          <div class="log-details">접속<span class="text-primary ml-1">#서울</span></div>
                          <small class="log-time">15분전</small>
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
                          <p class="log-name">사람</p>
                          <div class="log-details"> 가입 <div class="wrapper mt-2">
                              <button type="button" class="btn btn-xs btn-primary">회원보기</button>
                              <button type="button" class="btn btn-xs btn-inverse-primary">관리</button>
                            </div>
                          </div>
                          <small class="log-time">2시간전</small>
                        </div>
                        <div class="activity-log">
                          <p class="log-name">사람2</p>
                          <div class="log-details">접속<span class="text-primary ml-1">#부산</span></div>
                          <small class="log-time">4시간전</small>
                        </div>
                        <div class="activity-log">
                          <p class="log-name">사람3</p>
                          <div class="log-details">접속<span class="text-primary ml-1">#전라도</span></div>
                          <small class="log-time">8시간전</small>
                        </div>
                      </div>
                    </div>
                  </div>
                  <a class="border-top px-3 py-2 d-block text-gray" href="#">
                    <small class="font-weight-medium"><i class="mdi mdi-chevron-down mr-2"></i> 접속자 전체보기 </small>
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