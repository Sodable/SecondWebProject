<%@ page import="DWM.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<html>



<head>
   <link rel="shortcut icon" type="image/x-icon" href="https://www.flaticon.com/kr/premium-icon/icons/svg/1362/1362476.svg">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Landing PAGE Html5 Template">
    <meta name="keywords" content="landing,startup,flat">
    <meta name="author" content="Made By GN DESIGNS">
    <title>매일날로먹기</title>



    <!-- // PLUGINS (css files) // -->

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/js/plugins/bootsnav_files/skins/color.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/js/plugins/bootsnav_files/css/animate.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/js/plugins/bootsnav_files/css/bootsnav.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/js/plugins/bootsnav_files/css/overwrite.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/js/plugins/owl-carousel/owl.carousel.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/js/plugins/owl-carousel/owl.theme.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/js/plugins/owl-carousel/owl.transitions.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/js/plugins/Magnific-Popup-master/Magnific-Popup-master/dist/magnific-popup.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/social/social_font-awesome.min.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/social/social_main.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/social/social_util.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/socialfloating.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/components/reset.min.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/components/site.min.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/components/icon.min.css">
   
   
   
    <!--// ICONS //-->

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet">
   <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!--// BOOTSTRAP & Main //-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/bootstrap-3.3.7/bootstrap-3.3.7-dist/css/bootstrap.min.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/main.css">

<style type="text/css">
.social-icon {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
        font-size: 14px;
        font-weight: bold;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

.logincheck{
box-sizing: border-box;
font-size: 14px;
line-height: 24px;
color: #6f6f6f;
}

</style>
</head>

<!-- -----------------------------------------------------<Body시작>------------------------------------------------------------------- -->
<!-- -----------------------------------------------------<Body시작>------------------------------------------------------------------- -->
<!-- -----------------------------------------------------<Body시작>------------------------------------------------------------------- -->

<body>



    <!--======================================== 

           Preloader

    ========================================-->

    <div class="page-preloader">

        <div class="spinner">

            <div class="rect1"></div>

            <div class="rect2"></div>

            <div class="rect3"></div>

            <div class="rect4"></div>

            <div class="rect5"></div>

        </div>

    </div>



    <!--======================================== 

           Header

    ========================================-->



    <!--//** Navigation**//-->

    <nav class="navbar navbar-default navbar-fixed white no-background bootsnav navbar-scrollspy" data-minus-value-desktop="70" data-minus-value-mobile="55" data-speed="1000">



        <div class="container">

            <!-- Start Header Navigation -->

            <div class="navbar-header">

                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">

                    <i class="fa fa-bars"></i>

                </button>

                <a class="navbar-brand" href="#brand">

                    <img src="../../resources/assets/img/logo.png" class="logo" alt="logo">

                </a>

            </div>

            <!-- End Header Navigation -->



            <!-- Collect the nav links, forms, and other content for toggling -->

            <div class="collapse navbar-collapse" id="navbar-menu">

                <ul class="nav navbar-nav navbar-right">

                    <li class="active scroll"><a href="#home">맨위로</a></li>

                    <li class="scroll"><a href="#about">매날먹은요?</a></li>

                    <li class="scroll"><a href="#services">서비스</a></li>

                    <li class="scroll"><a href="#price">주요기능</a></li>

                    <li class="scroll"><a href="#team">개발팀</a></li>

                    <li class="scroll"><a href="#clients">협업사</a></li>

                    <li class="scroll"><a href="#contact">개발장소</a></li>

                    <li class="button-holder">

                        <button type="button" class="btn btn-blue navbar-btn" data-toggle="modal" data-target="#SignIn">회원가입</button>

                    </li>

                </ul>

            </div>

            <!-- /.navbar-collapse -->

        </div>

    </nav>



    <!--//** Banner**//-->

    <section id="home">

        <div class="container">

            <div class="row">

                <div id="particles-js"></div>

                <!-- Introduction -->

                <div class="col-md-6 caption">

                    <h1>Welcome To <br/>→ 매일날로먹기</h1>

                    <h2>

                              매일 날로먹기는요!
                     <br/>
                            <span class="animated-text"></span>

                            <span class="typed-cursor"></span>

                        </h2>

                    <p>회원가입을 해서 매일날로먹기의 날씨 서비스를 경험해보세요!</p>

                    <a href="#" class="btn btn-transparent">Get Started</a>

                    <a class="btn btn-blue popup-youtube" href="https://www.youtube.com/watch?v=Q8TXgCzxEnw">

                        <i class="material-icons">play_circle_filled</i>Watch Video

                    </a>

                </div>

                <!-- Sign Up -->

                <div class="col-md-5 col-md-offset-1">

               <%request.setAttribute("login", new MemberVO()); %>
                    <form:form class="signup-form" action="/ProtoType/member/login.do" method="post" modelAttribute="login">

                        <h2 class="text-center">로그인</h2>

                        <hr>

                        <div class="form-group">

                            <form:input type="text" name="id" path="id" class="form-control" placeholder="아이디(Input ID)" required="required" />
                            <p style="color: red; font-weight: bold;">
                            <form:errors path="id"/>
                     </p>
                        </div>

                        <div class="form-group">

                            <form:input type="password" name="password" path="password" class="form-control" placeholder="비밀번호 (Password)" required="required"/>
                     <p style="color:red; font-weight:bold">
                     <form:errors path="password"/>
                     </p>
                        </div>
                     
                        <!-- <div class="form-group">

                            <input type="text" class="form-control" placeholder="User Name" required="required">

                        </div>

                        <div class="form-group">

                            <input type="text" class="form-control" placeholder="Password" required="required">

                        </div>
 -->               
          
                        <div class="form-group text-center">

                            <button type="submit" class="btn btn-blue btn-block">시작하기</button>
      
                        </div>
                        
                  <div class="modal-footer text-center">
                          <a href="#">아이디가 기억안나요</a>
                          <a href="#">/</a>
                          <a href="#">비밀번호가 기억안나요</a>
                        </div>
                         
                         <div class="txt1 text-center p-t-10 p-b-5">
                  <span>
                     <i>SNS 로그인</i>
                  </span>
                  </div>
                        <div class="flex-c-m">
                  <a href="#" class="login100-social-item bg1">
                  <i class="social-icon">N</i>
                  </a>
                  <a href="#" class="login100-social-item bg2">
                  <i class="social-icon">K</i>
                  </a>
                  <a href="#" class="login100-social-item bg3">
                     <i class="social-icon">G</i>
                  </a>
                  </div>
                  
                    </form:form>
                </div>
            </div>
        </div>
    </section>



    <!--======================================== 

           About Us

    ========================================-->



    <section id="about" class="section-padding">

        <div class="container">

            <h2>매날먹에 대해서</h2>

            <p>매일날로먹기는 어떤것을 추구하는지 말씀드릴께요!</p>

            <div class="row">

                <div class="col-md-4">

                    <div class="icon-box">

                        <i class="material-icons">favorite</i>

                        <h4>날씨박사가 되어보세요!</h4>

                        <p>저희 서비스를 꾸준히 이용하시면 날씨 박사가 되실꺼에요</p>

                    </div>

                </div>

                <div class="col-md-4">

                    <div class="icon-box">

                        <i class="material-icons">flash_on</i>

                        <h4>셀럽이 되어보세요!</h4>

                        <p>오늘 정말 찰떡으로 코디했는데 혼자생각하기 아까우셨죠?</p>

                    </div>

                </div>

                <div class="col-md-4">

                    <div class="icon-box">

                        <i class="material-icons">settings</i>

                        <h4>진짜로 기발한 귀여운 기능들을 즐기세요!</h4>

                        <p>날씨때문에 곤란했던 지난날들.. 마땅한 서비스가 없어서 아쉬우셨죠? <br/>그래서 저희가 이렇게 찾아왔죠! </p>

                    </div>

                </div>

            </div>

        </div>

    </section>



    <!--======================================== 

           Story

    ========================================-->



    <section id="story">

        <div class="container-fluid">

            <div class="row">

                <!-- Img -->

                <div class="col-md-6 story-bg">

                </div>

                <!-- Story Caption -->

                <div class="col-md-6">

                    <div class="story-content">

                        <h2>매일날로먹기를 만든 이유는요?..</h2>

                        <p class="story-quote">

                            "날씨는 우리 일상에서 가장 가까운것인데, 그만큼의 서비스가 없어서 불편했어요"

                        </p>

                        <div class="story-text">

                            <p>저희는 어떻게하면 편리하고, 간단하고, 쓸모있는 날씨 서비스를 만들까 항상 생각한답니다.. <br/> 혹시 이런 서비스가 있으면 좋겠다 하는것 있으신가요? 저희에게 시간을 조금 나눠주시면 그 서비스를 실현시켜 드릴께요!</p>

                        </div>

                        <a href="#" class="btn btn-white">불편함 던져주기</a>

                    </div>

                </div>

            </div>

        </div>

    </section>



    <!--======================================== 

           Services

    ========================================-->



    <section id="services" class="section-padding">

        <div class="container">

            <h2>저희는 이거를 신경썼어요!</h2>

            <p>매일 날로먹기는 시장의 변화에따라, 트렌드의 변화에따라 변화합니다 :)</p>

            <div class="row">

                <div class="col-md-3">

                    <div class="icon-box">

                        <i class="material-icons">thumb_up</i>

                        <h4>데일리룩</h4>

                        <p>오늘하루 나의 데일리룩으로 날씨를 표현해보세요! 다른사람의 데일리룩을 보고 추천을 해보세요!</p>

                    </div>

                </div>

                <div class="col-md-3">

                    <div class="icon-box">

                        <i class="material-icons">euro_symbol</i>

                        <h4>날씨캘린더</h4>

                        <p>날씨에 따라서 일정을 짜보세요! 비즈니스에 도움이 된답니다!</p>

                    </div>

                </div>

                <div class="col-md-3">

                    <div class="icon-box">

                        <i class="material-icons">forum</i>

                        <h4>날씨채팅</h4>

                        <p>현장근무를 하시는 분들.. 날씨 중요하시죠? 날씨 채팅을 준비했습니다!</p>

                    </div>

                </div>

                <div class="col-md-3">

                    <div class="icon-box">

                        <i class="material-icons">view_carousel</i>

                        <h4>날씨예측서비스</h4>

                        <p>근거있는 자료들로 근거있는 예측을 해드릴께요! 마음껏 활용해주세요!</p>

                    </div>

                </div>

            </div>

        </div>

    </section>



    <!--======================================== 

           Features

    ========================================-->



    <section id="features">

        <div class="container">

            <div class="row">

                <div class="col-md-6">

                    <h2>미래에는요..</h2>

                    <p>현재에도 인간의 많은 활동으로 기후가 변화하고 있습니다. 우리가 잘 알고 있는 특징으로는 열대야와 그로인한 빙하가 녹아서 생태계가 위협을 받고 있죠.</p>

                    <hr>

                    <div class="feat-media">

                        <!-- Feature -->

                        <div class="media">

                            <div class="media-left">

                                <a href="#">

                                    <i class="material-icons">(사진)</i>

                                </a>

                            </div>

                            <div class="media-body">

                                <h4 class="media-heading">해수면과 바다</h4>

                                <p>전 지구에 비해 우리나라의 해양 수온과 해수면이 높아지고 바다가 산성화되고 있어요.</p>

                            </div>

                        </div>

                        <!-- Feature -->

                        <div class="media">

                            <div class="media-left">

                                <a href="#">

                                    <i class="material-icons">(사진)</i>

                                </a>

                            </div>

                            <div class="media-body">

                                <h4 class="media-heading">평균기온</h4>

                                <p>2014년 이후 열대야와 폭염의 빈도가 증가하고 5월마다 평균기온이 관측이래 1~5위가 형성될정도로 여름처럼 변하고 있어요.</p>

                            </div>

                        </div>

                        <!-- Feature -->

                        <div class="media">

                            <div class="media-left">

                                <a href="#">

                                    <i class="material-icons">(사진)</i>

                                </a>

                            </div>

                            <div class="media-body">

                                <h4 class="media-heading">이산화탄소 증가</h4>
                        <p>화석연료연소와 토지이용 변화로 이산화탄소가 증가하고, 이것이 지구 대대분의 이상기후 현상을 발생시켜요!</p>

                            </div>

                        </div>

                    </div>

                </div>

                <!-- Features Img -->

                <div class="col-md-6 col-md-push-2">
               <i>이미지</i>
                    <img src="../../resources/assets/img/dashboard.png" class="img-responsive" alt="feature">

                </div>

            </div>

        </div>

    </section>



    <!--======================================== 

           Price

    ========================================-->



    <section id="price" class="section-padding">

        <div class="container">

            <h2>매일날로먹기가 제공하는 주요 서비스는?</h2>

            <p>변화하는 기후에 따라 발전하는 서비스를 제공할께요 :)</p>

            <div class="row">

                <!-- Pricing Start Here -->

                <div class="pricing-container">

                    <div class="col-md-4">

                        <!--== SINGLE USER: Plan ==-->

                        <div class="plan">

                            <div class="pricing-header">

                                <h3>데일리룩</h3>

                                <h3>

                                <span class="currency">아이콘</span>

                                <span class="amount">1</span>

                                <span class="period">2</span>

                                </h3>

                            </div>

                            <div class="pricing-body">

                                <ul class="list-unstyled">

                                    <li><i class="material-icons">done</i><b>AAA</b> BBB</li>

                                     <li><i class="material-icons">done</i><b>AAA</b> BBB</li>

                                     <li><i class="material-icons">done</i><b>AAA</b> BBB</li>

                                     <li><i class="material-icons">done</i><b>AAA</b> BBB</li>

                                     <li><i class="material-icons">done</i><b>AAA</b> BBB</li>

                                     <li><i class="material-icons">done</i><b>AAA</b> BBB</li>

                                </ul>

                            </div>

                            <div class="pricing-footer">

                                <a href="#" class="btn btn-blue">보러가기</a>

                            </div>

                        </div>

                    </div>

                    <div class="col-md-4">

                        <!--== MULTIPLE USER: Plan ==-->

                        <div class="plan active">

                            <div class="pricing-header" >

                                <h3>날씨일정관리</h3>

                                <h3>

                                <span class="currency">아이콘</span>

                                <span class="amount">1</span>

                                <span class="period">2</span>

                                </h3>

                            </div>

                            <div class="pricing-body">

                                <ul class="list-unstyled">

                                    <li><i class="material-icons">done</i><b>AAA</b> BBB</li>

                                     <li><i class="material-icons">done</i><b>AAA</b> BBB</li>

                                     <li><i class="material-icons">done</i><b>AAA</b> BBB</li>

                                     <li><i class="material-icons">done</i><b>AAA</b> BBB</li>

                                     <li><i class="material-icons">done</i><b>AAA</b> BBB</li>

                                     <li><i class="material-icons">done</i><b>AAA</b> BBB</li>
                                </ul>

                            </div>

                            <div class="pricing-footer">

                                <a href="#" class="btn btn-blue">보러가기</a>

                            </div>

                        </div>

                    </div>

                    <div class="col-md-4">

                        <!--== Developer: Plan ==-->

                        <div class="plan">

                            <div class="pricing-header">

                                <h3>날씨채팅</h3>

                                <h3>

                                <span class="currency">아이콘</span>

                                <span class="amount">1</span>

                                <span class="period">2</span>

                                </h3>

                            </div>

                            <div class="pricing-body">

                                <ul class="list-unstyled">

                                    <li><i class="material-icons">done</i><b>AAA</b> BBB</li>

                                     <li><i class="material-icons">done</i><b>AAA</b> BBB</li>

                                     <li><i class="material-icons">done</i><b>AAA</b> BBB</li>

                                     <li><i class="material-icons">done</i><b>AAA</b> BBB</li>

                                     <li><i class="material-icons">done</i><b>AAA</b> BBB</li>

                                     <li><i class="material-icons">done</i><b>AAA</b> BBB</li>
                                </ul>

                            </div>

                            <div class="pricing-footer">

                                <a href="#" class="btn btn-blue">보러가기</a>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </section>



    <!--======================================== 

           Team

    ========================================-->



    <section id="team" class="section-padding">

        <div class="container">

            <h2>매일날로먹기 개발팀</h2>

            <p>매일날로먹기 서비스를 만든 사람들을 소개할께요</p>

            <div class="row">

                <div class="col-md-6 col-lg-3">

                    <!--**Team-Member**-->

                    <div class="thumbnail team-member">
                        <img src="<c:url value="/resources/ag"/>" class="img-responsive img-circle" alt="team-1">

                        <div class="caption">

                            <h4>황윤주<br/>(Hwang-yunju)</h4>

                            <h6>Programmer</h6>

                            <p>현재 매일 날로먹기 WebProject진행중</p>

                            <hr>

                            <div class="team-social">

                                <ul class="liste-unstyled">

                                    <li><a href="#facebook"><i class="fa fa-facebook"></i></a></li>

                                    <li><a href="#twitter"><i class="fa fa-twitter"></i></a></li>

                                    <li><a href="#linkedin"><i class="fa fa-linkedin"></i></a></li>

                                    <li><a href="#instagram"><i class="fa fa-instagram"></i></a></li>

                                </ul>

                            </div>

                        </div>

                    </div>

                </div>

                <div class="col-md-6 col-lg-3">

                    <!--**Team-Member**-->

                    <div class="thumbnail team-member">
                  
                        <img src="<c:url value="/resources/assets/img/team-2.png"/>" alt="team-2">

                        <div class="caption">

                        <h4>정승우<br/>(Jung-seungwu)</h4>

                            <h6>Programmer</h6>

                            <p>현재 매일 날로먹기 WebProject진행중</p>

                            <hr>

                            <div class="team-social">

                                <ul class="liste-unstyled">

                                    <li><a href="#facebook"><i class="fa fa-facebook"></i></a></li>

                                    <li><a href="#twitter"><i class="fa fa-twitter"></i></a></li>

                                    <li><a href="#linkedin"><i class="fa fa-linkedin"></i></a></li>

                                    <li><a href="#instagram"><i class="fa fa-instagram"></i></a></li>

                                </ul>

                            </div>

                        </div>

                    </div>

                </div>

                <div class="col-md-6 col-lg-3">

                    <!--**Team-Member**-->

                    <div class="thumbnail team-member">

                        <img src="../../resources/assets/img/team-3.png" class="img-responsive img-circle" alt="team-3">

                        <div class="caption">

                            <h4>용용이</h4>

                            <h6>Dragon</h6>

                            <p>날씨를 다루는데<br/>아주능수능란해요!<br/>믿음직스러워요</p>

                            <hr>

                            <div class="team-social">

                                <ul class="liste-unstyled">

                                    <li><a href="#facebook"><i class="fa fa-facebook"></i></a></li>

                                    <li><a href="#twitter"><i class="fa fa-twitter"></i></a></li>

                                    <li><a href="#linkedin"><i class="fa fa-linkedin"></i></a></li>

                                    <li><a href="#instagram"><i class="fa fa-instagram"></i></a></li>

                                </ul>

                            </div>

                        </div>

                    </div>

                </div>

                <div class="col-md-6 col-lg-3">

                    <!--**Team-Member**-->

                    <div class="thumbnail team-member">

                        <img src="../../resources/assets/img/team-4.png" class="img-responsive img-circle" alt="team-4">

                        <div class="caption">

                            <h4>새끼용</h4>

                            <h6>Child</h6>

                            <p>아무것도 몰라요..이제 알에서 나온 것일 뿐</p>

                            <hr>

                            <div class="team-social">

                                <ul class="liste-unstyled">

                                    <li><a href="#facebook"><i class="fa fa-facebook"></i></a></li>

                                    <li><a href="#twitter"><i class="fa fa-twitter"></i></a></li>

                                    <li><a href="#linkedin"><i class="fa fa-linkedin"></i></a></li>

                                    <li><a href="#instagram"><i class="fa fa-instagram"></i></a></li>

                                </ul>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </section>



    <!--======================================== 

           Clients

    ========================================-->



    <section id="clients" class="section-padding">

        <div class="container">

            <div class="row">

                <h2>다양한 날씨</h2>

                <p>맑음, 흐림, 비, 태풍 등 날씨를 표현하는 것은 얼마나 있을까요?</p>

                <!--// Clients Images //-->

                <div class="clients-images">

                    <div id="owl-clients">

                        <div class="item"><img src="../../resources/assets/img/clients/c_logo01.png" class="center-block" alt="날씨1"></div>

                        <div class="item"><img src="../../resources/assets/img/clients/c_logo02.png" class="center-block" alt="날씨2"></div>

                        <div class="item"><img src="../../resources/assets/img/clients/c_logo03.png" class="center-block" alt="날씨3"></div>

                        <div class="item"><img src="../../resources/assets/img/clients/c_logo04.png" class="center-block" alt="날씨4"></div>

                        <div class="item"><img src="../../resources/assets/img/clients/c_logo05.png" class="center-block" alt="날씨5"></div>

                        <div class="item"><img src="../../resources/assets/img/clients/c_logo06.png" class="center-block" alt="날씨6"></div>

                    </div>

                </div>

                <!--// Clients Testimonials //-->

                <div id="owl-testimonials">

                    <div class="item">

                        <i class="material-icons">mood</i>

                        <p class="quote">내용1</p>

                        <h4>날씨에대한 의견</h4>

                    </div>

                    <div class="item">

                        <i class="material-icons">mood</i>

                        <p class="quote">내용2</p>
                        <h4>날씨에대한 의견</h4>

                    </div>

                    <div class="item">

                        <i class="material-icons">mood</i>

                        <p class="quote">내용3</p>
                        <h4>날씨에대한 의견</h4>

                    </div>

                </div>

            </div>

        </div>

    </section>



    <!--======================================== 

           Newsletter

    ========================================-->



    <section id="newsletter">

        <div class="container">

            <div class="row">

                <h3>이메일을 보내서 날씨서비스를 구독해보세요!</h3>

                <div class="form-container">

                    <form class="form-inline">

                        <input type="email" class="form-control" id="newsletter-form" placeholder="이메일" required="required">

                        <button type="submit" class="btn btn-white">보내기</button>

                    </form>

                </div>

            </div>

        </div>

    </section>



    <!--======================================== 

           Contact

    ========================================-->



    <section id="contact" class="section-padding">

        <div class="container">

            <h2>개발장소</h2>

            <h3>PlayData</h3>

            <p>날씨서비스 매일날로먹기는 플레이데이터 빅데이터 플랫폼5기에서 제작된 프로젝트 입니다.</p>

        </div>

        <!-- Contact Info -->
      
        <div class="container contact-info">

            <div class="row">

                <div class="col-md-4">

                    <div class="icon-box">

                        <i class="material-icons">place</i>

                        <h4>주소</h4>

                        <p>서울시 서초구 효령로 335 (서초동 1604-19)</p>
                  <p><a href="https://playdata.io/">https://playdata.io</a></p>
                    </div>

                </div>

                <div class="col-md-4">

                    <div class="icon-box">

                        <i class="material-icons">phone</i>

                        <h4>전화번호</h4>

                        <p>1-834-527-6940</p>

                    </div>

                </div>

                <div class="col-md-4">

                    <div class="icon-box">

                        <i class="material-icons">email</i>

                        <h4>이메일 E-mail</h4>

                        <p>playdata@playdata.io</p>


                    </div>

                </div>

            </div>

        </div>

        <!-- Kakao Map -->
      <div class="container">
         <header>
         <h1>개발장소 지도</h1>
         </header>
         <div id="map"  style="width: 100%; height: 400px; overflow: hidden; position: relative;">
         <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3bbdb22c2c9ebae75e0379c48255a11b"></script><script charset="UTF-8" src="http://t1.daumcdn.net/mapjsapi/js/main/4.2.0/kakao.js"></script>   
         <script>
         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = { 
              center: new kakao.maps.LatLng(37.48648422457548, 127.02066905778005), // 지도의 중심좌표
              level: 3 // 지도의 확대 레벨
          };

      var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

      // 지도를 클릭한 위치에 표출할 마커입니다
      var marker = new kakao.maps.Marker({ 
          // 지도 중심좌표에 마커를 생성합니다 
          position: map.getCenter() 
      }); 
      // 지도에 마커를 표시합니다
      marker.setMap(map);

      // 지도에 클릭 이벤트를 등록합니다
      // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
      kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
          
          // 클릭한 위도, 경도 정보를 가져옵니다 
          var latlng = mouseEvent.latLng; 
          
          // 마커 위치를 클릭한 위치로 옮깁니다
          marker.setPosition(latlng);
          
          var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
          message += '경도는 ' + latlng.getLng() + ' 입니다';
          
          var resultDiv = document.getElementById('clickLatlng'); 
          resultDiv.innerHTML = message;
          
      });
            </script>
         </div>
         </div>
         
         
         
        <!-- Contact Form -->

        <div class="contact-forms">

            <div class="container">

                <h2>저희에게 의견을 보내주세요!</h2>

                <form class="contact-form">

                    <div class="col-md-6">

                        <div class="form-group">

                            <input type="text" class="form-control" placeholder="아이디 " required="required">

                        </div>

                        <div class="form-group">

                            <input type="email" class="form-control" placeholder="이메일 (E-mail)" required="required">

                        </div>

                    </div>

                    <div class="col-md-6">

                        <div class="form-group">

                            <textarea class="form-control" rows="3" placeholder="하고싶으신 말"></textarea>

                        </div>

                    </div>

                    <button type="submit" class="btn btn-blue">의견 보내기</button>

                </form>

            </div>

        </div>

    </section>



    <!--======================================== 

           Footer

    ========================================-->



    <footer>

        <div class="container">

            <div class="row">

                <div class="footer-caption">

                    <img src="../../resources/assets/img/logo.png" class="img-responsive center-block" alt="logo">

                    <hr>

                    <h5 class="pull-left">만든시기, &copy;2020년에 걸쳐서</h5>

                    <ul class="liste-unstyled pull-right">

                        <li><a href="#facebook"><i class="fa fa-facebook"></i></a></li>

                        <li><a href="#twitter"><i class="fa fa-twitter"></i></a></li>

                        <li><a href="#linkedin"><i class="fa fa-linkedin"></i></a></li>

                        <li><a href="#instagram"><i class="fa fa-instagram"></i></a></li>

                    </ul>

                </div>

            </div>

        </div>

    </footer>



    <!--======================================== 

           Modal

    ========================================-->

    <!-- Modal -->


   
    <div class="modal fade" id="SignIn" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">

        <div class="modal-dialog" role="document">

            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
               &nbsp;
                    <h2 class="modal-title text-center" id="myModalLabel">회원가입</h2>
                </div>
                
            &nbsp;
            
                <div class="modal-body">

                    <form class="signup-form" action="/ProtoType/member/Insert.do" method="post">
                        <div class="form-group" >
                            <input type="text" class="form-control" name="id" placeholder="아이디 입력" required="required">
                        <!-- 아이디 중복체크 버튼 넣기 -->
                        </div>

                        <div class="form-group">
                            <input type="password" name="password" class="form-control" placeholder="비밀번호 입력" required="required">
                        </div>
                        
                         <div class="form-group">
                            <input type="text" name="password" class="form-control" placeholder="비밀번호 체크" required="required">
                        </div>
                        <div class="form-grounp">
                           <input type="text" name="name" class="form-control" placeholder="이름">
                        </div>
                        <div class="form-grounp">
                           <input type="text" name="tel" class="form-control" placeholder="전화번호 입력">
                        </div>
                        <div class="form-group">
                            <input type="email" name="email" class="form-control" placeholder="이메일 입력" required="required">
                               <!-- 이메일 드롭박스 넣기 (이메일 주소) -->
                        </div>
                        
                        <!-- <div class="form-grounp">
                           <input type="text" class="form-control" placeholder="주소지 설정 ">
                           주소지-API 버튼 넣기
                        </div>
                        <div class="form-grounp">
                           <input type="text" class="form-control" placeholder="나의 날씨 설정 지역">
                           API값을 받아와서 동네/지역으로 서비스 시작
                        </div> -->
                  
                  &nbsp;
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-blue btn-block" >가입하기</button>
                        </div>
                  <div class="txt1 text-center p-t-10 p-b-5">
                  <span>
                     <i>SNS 회원가입</i>
                  </span>
                  </div>
                        <div class="flex-c-m">
                  <a href="#" class="login100-social-item bg1">
                  <i class="social-icon">N</i>
                  </a>
                  <a href="#" class="login100-social-item bg2">
                  <i class="social-icon">K</i>
                  </a>
                  <a href="#" class="login100-social-item bg3">
                     <i class="social-icon">G</i>
                  </a>
                  </div>
                    </form>

                </div>

                <div class="modal-footer text-center">

                    <a href="#">지역을 왜 설정하나요?</a>
               <a href="#">/</a>
                    <a href="#">도움말</a>

                </div>

            </div>

        </div>

    </div>
    
   
<!--    =========================================================================================================
            Social Floating
   ========================================================================================================= -->
      
      <div id="socialfloating" class="contact-bar left" style="left: 0px;">


         <a href="https://www.facebook.com/" class="cb-link cb-anchor" style="background-color: #3b5998">
         <i class="facebook icon"></i>
         </a>
         
         <a href="https://open.kakao.com/o/sKmnm5pc" class="cb-link cb-anchor" style="background-color: #f7e600">
         <i><img src="<c:url value="/resources/images/icon/kakao-talk.png"/>"></i>
         </a>

         <a href="https://twitter.com/" class="cb-link cb-anchor" style="background-color: #00aced">
         <i class="twitter icon"></i>
         </a>

         
         <a href="https://www.youtube.com/" class="cb-link cb-anchor" style="background-color: #c4302b">
         <i class="youtube icon"></i>
         </a>
         

         <a href="tel:+10-0000-0000" class="cb-link cb-anchor separated" style="background-color: #EC8A74;">
         <i class="phone icon"></i>
         </a>

         <a href="mailto:evom1234@gmail.com" class="cb-link cb-anchor" style="background-color: skyblue;">
         <i class="envelope icon"></i>
         </a>
         </div>
      
      
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js" />"></script>
      
      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src="<c:url value="/resources/assets/bootstrap-3.3.7/bootstrap-3.3.7-dist/js/bootstrap.min.js" />"></script>
      <script src="<c:url value="/resources/assets/js/plugins/owl-carousel/owl.carousel.min.js" />"></script>
      <script src="<c:url value="/resources/assets/js/plugins/bootsnav_files/js/bootsnav.js" />"></script>
      <script src="<c:url value="/resources/assets/js/plugins/typed.js-master/typed.js-master/dist/typed.min.js" />"></script>
      
      
      <script src="<c:url value="/resources/assets/js/plugins/typed.js-master/typed.js-master/dist/typed.min.js" />"></script>
      <script src="<c:url value="/resources/assets/js/plugins/Magnific-Popup-master/Magnific-Popup-master/dist/jquery.magnific-popup.js" />"></script>
      <script src="<c:url value="/resources/assets/js/plugins/particles.js-master/particles.js-master/particles.min.js" />"></script>
      <script src="<c:url value="/resources/assets/js/particales-script.js" />"></script>
      <script src="<c:url value="/resources/assets/js/main.js" />"></script>
      <script src="<c:url value="/resources/js/jquery.socialfloating.js" />"></script>
     <script src="<c:url value="/resources/js/demo.js" />"></script>

</body>



</html>