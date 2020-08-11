<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
       <link rel="shortcut icon" type="image/x-icon" href="https://www.flaticon.com/kr/premium-icon/icons/svg/1362/1362476.svg">
      <title>매일날로먹기</title>
         
      <meta http-equiv="content-type" content="text/html; charset=utf-8">
      <meta name="description" content="">
      <meta name="keywords" content="">
      <link href="http://fonts.googleapis.com/css?family=Oxygen:400,300,700" rel="stylesheet" type="text/css">
      <!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
      <style type="text/css">html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,b,u,i,center,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,details,embed,figure,figcaption,footer,header,hgroup,menu,nav,output,ruby,section,summary,time,mark,audio,video{margin:0;padding:0;border:0;font-size:100%;font:inherit;vertical-align:baseline}article,aside,details,figcaption,figure,footer,header,hgroup,menu,nav,section{display:block}body{line-height:1}ol,ul{list-style:none}blockquote,q{quotes:none}blockquote:before,blockquote:after,q:before,q:after{content:'';content:none}table{border-collapse:collapse;border-spacing:0}body{-webkit-text-size-adjust:none}</style><style type="text/css">@-ms-viewport{width: device-width}</style><style type="text/css">*,*:before,*:after{-moz-box-sizing:border-box;-webkit-box-sizing:border-box;box-sizing:border-box}</style><style type="text/css">body{min-width:960px}.container{margin-left:auto;margin-right:auto;width:960px}.container.small{width:720px}.container.big{width:100%;max-width:1200px;min-width:960px}</style><style type="text/css">.\31 2u{width:100%}.\31 1u{width:91.6666666667%}.\31 0u{width:83.3333333333%}.\39 u{width:75%}.\38 u{width:66.6666666667%}.\37 u{width:58.3333333333%}.\36 u{width:50%}.\35 u{width:41.6666666667%}.\34 u{width:33.3333333333%}.\33 u{width:25%}.\32 u{width:16.6666666667%}.\31 u{width:8.3333333333%}.\-11u{margin-left:91.6666666667%}.\-10u{margin-left:83.3333333333%}.\-9u{margin-left:75%}.\-8u{margin-left:66.6666666667%}.\-7u{margin-left:58.3333333333%}.\-6u{margin-left:50%}.\-5u{margin-left:41.6666666667%}.\-4u{margin-left:33.3333333333%}.\-3u{margin-left:25%}.\-2u{margin-left:16.6666666667%}.\-1u{margin-left:8.3333333333%}</style><style type="text/css">.row>*{float:left;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;box-sizing:border-box}.row:after{content:'';display:block;clear:both;height:0}.row:first-child>*{padding-top:0!important}</style><style type="text/css">.row.flush{margin-left:0}.row.flush>*{padding:0!important}.row>*{padding-left:50px}.row+.row>*{padding:50px 0 0 50px}.row{margin-left:-50px}.row.half>*{padding-left:25px}.row+.row.half>*{padding:25px 0 0 25px}.row.half{margin-left:-25px}.row.quarter>*{padding-left:12.5px}.row+.row.quarter>*{padding:12.5px 0 0 12.5px}.row.quarter{margin-left:-12.5px}.row.oneandhalf>*{padding-left:75px}.row+.row.oneandhalf>*{padding:75px 0 0 75px}.row.oneandhalf{margin-left:-75px}.row.double>*{padding-left:100px}.row+.row.double>*{padding:100px 0 0 100px}.row.double{margin-left:-100px}</style><style type="text/css">.not-desktop,.not-1000px{display:none!important}.only-mobile{display:none!important}</style>
      
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style-desktop.css">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style-1000px.css">
      
      <script src="resources/js/skel.min.js"></script>
      <script src="resources/js/skel-panels.min.js"></script>
      <script src="resources/js/init.js"></script>
      
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
                  <h1><a href="#">매일날로먹기Page</a></h1>
                  <span>Daily-Weather-Service</span>
               </div>
            
            <!-- Nav -->
               <nav id="nav">
                  <ul>
                     <li class="active"><a href="/ProtoType/member/login.do">매일날로먹기</a></li>
                     <li><a href="/ProtoType/freeboard/view">소통의공간</a></li>
                     <li><a href="/ProtoType/photoboard/view?date=today&pagenum=1">데일리룩</a></li>
                     <li><a href="twocolumn2.html">날씨달력</a></li>
                     <li><a href="onecolumn.html">채팅관리</a></li>
                     <li><a href="onecolumn.html">날씨에 대해서</a></li>
                  </ul>
               </nav>

         </div>
      </div>
   <!-- Header -->
         
   <!-- Main -->
      <div id="main">
         <div class="container">
            <header>
               <h3><%=sf.format(nowTime) %></h3>
               <br/>
               <h2>오늘 가장 사랑받은 옷은요?</h2>
               <br/>
            </header>
            
            <div class="row">
               <div class="3u">
                  <section>
                     <a href="#" class="image full"><img src="https://image.musinsa.com/mfile_s01/2018/01/12/8df7b73a7820f4aef47864f2a6c5fccf005331.jpg" alt="" /></a>
                     <p>날씨 : </p><br/>
                     <p>지역 : </p>
                     <a href="#" class="button">Read More</a>
                  </section>
               </div>
               <div class="3u">
                  <section>
                     <a href="#" class="image full"><img src="https://img1.daumcdn.net/thumb/R720x0/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2Ftag%2Fd397a80e333c44f0b930dee4270c4e9d.png" alt="" /></a>
                     <p>날씨 : </p><br/>
                     <p>지역 : </p>
                     <a href="#" class="button">Read More</a>
                  </section>
               </div>
               <div class="3u">
                  <section>
                     <a href="#" class="image full"><img src="https://img.eomisae.co.kr/files/attach/images/100572/821/664/032/13d8ec628140b4b74a7ffb47185ea547.jpeg" alt="" /></a>
                     <p>날씨 : </p><br/>
                     <p>지역 : </p>
                     <a href="#" class="button">Read More</a>
                  </section>
               </div>
               <div class="3u">
                  <section>
                     <a href="#" class="image full"><img src="http://res.heraldm.com/content/image/2015/05/08/20150508000962_0.jpg" alt="" /></a>
                     <p>날씨 : </p><br/>
                     <p>지역 : </p>
                     <a href="#" class="button">Read More</a>
                  </section>
               </div>
            </div>
            <div class="divider">&nbsp;</div>
            <div class="row">
            
               <!-- Content -->
                  <div class="8u skel-cell-important">
                     <section id="content">
                        <header>
                           <h2>현재 날씨가 궁금하시죠?</h2>
                           <span class="byline">rutrum</span>
                        </header>
                        <p><a href="#" class="image full"><img src="images/pics02.jpg" alt=""></a></p>
                        <p><strong>Monochromed</strong></a>.</p>
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
                        <p>Donec leo, vivamus fermentum nibh in augue praesent a lacus at urna congue rutrum. Maecenas luctus lectus at sapien. Consectetuer adipiscing elit.</p>
                        <ul class="default">
                           <li><a href="#">Pellentesque quis lectus gravida blandit.</a></li>
                           <li><a href="#">Lorem ipsum consectetuer adipiscing elit.</a></li>
                           <li><a href="#">Phasellus nec nibh pellentesque congue.</a></li>
                           <li><a href="#">Cras aliquam risus pellentesque pharetra.</a></li>
                           <li><a href="#">Duis non metus commodo euismod lobortis.</a></li>
                           <li><a href="#">Lorem ipsum dolor adipiscing elit.</a></li>
                        </ul>
                     </section>
                  </div>
               <!-- Sidebar -->
                  
            </div>
         
         </div>
      </div>
   <!-- Main -->

   <!-- Footer -->
      <div id="footer">
         <div class="container">
            <div class="row">
               <div class="3u">
                  <section>
                     <ul class="style1">
                        <li><img src="https://w.namu.la/s/6569ec3042bbbcd89ca27a754349adc4ce68ca7b18c8e54e3defb2831eb917650c031bd0949e8d92c900bec68e432d785420afe55a6ed592e4d1a81cb683cbd3309bcc9d02c0ee8160a21d53405f48ff130dbc3667cb5718c1ddff59a3582f9d" width="78" height="78" alt="">
                           <a href="https://www.weather.go.kr/w/index.do">기상청 날씨누리</a>
                           <p class="posted">공식 기상청</p>
                        </li>
                        <li><img src="http://www.climate.go.kr/home/images/sub2/dev_img2.jpg" width="78" height="78" alt="">
                           <a href="http://book.kma.go.kr/index.ax">기상청<br/>전자도서관</a>
                           <p class="posted">전자 도서관</p>
                        </li>
                        <li><img src="http://www.climate.go.kr/data/ott_banner/15952380430.jpg" width="78" height="78" alt="">
                           <a href="http://www.climate.go.kr/home/09_monitoring/index.php/main">종합기후변화<br/>감시정보</a>
                           <p class="posted">실시간현황</p>
                        </li>
                     </ul>
                  </section>
               </div>
               <div class="3u">
                  <section>
                     <ul class="style1">
                        <li class="first"><img src="http://www.climate.go.kr/home/images/common/logo.png" width="78" height="78" alt="">
                           <a href="http://www.climate.go.kr/home/">기상청 <br/>기후정보 포털</a>
                           <p class="posted">실시간예측</p>
                        </li>
                        <li><img src="http://www.climate.go.kr/home/images/sub2/dev_img1.jpg" width="78" height="78" alt="">
                           <a href="https://rnd.kma.go.kr/kma_rnd/main/main.do">기상청연구관리 <br/>시스템</a>
                           <p class="posted">날씨관련개발</p>
                        </li>
                        <li><img src="http://www.climate.go.kr/home/images/sub2/dev_img4.jpg" width="78" height="78" alt="">
                           <a href="https://www.kmiti.or.kr">한국기상산업<br/>기술원</a>
                           <p class="posted">날씨관련산업</p>
                        </li>
                     </ul>
                  </section>            
               </div>
               <div class="6u">
                  <section>
                     <header>
                        <h2> 유용한 날씨사이트</h2>
                        <h2> 알려드릴께요 :)</h2>
                        <br/>
                     </header>
                     <p>In posuere eleifend odio. Quisque semper augue mattis wisi. Maecenas ligula. Pellentesque viverra vulputate enim. Aliquam erat volutpat. Pellentesque tristique ante ut risus. Quisque dictum. Integer nisl risus, sagittis convallis, rutrum id, elementum congue, nibh. Suspendisse dictum porta lectus.</p>
                     <ul class="default">
                        <li><a href="#">Pellentesque quis lectus gravida blandit.</a></li>
                        <li><a href="#">Lorem ipsum consectetuer adipiscing elit.</a></li>
                        <li><a href="#">Phasellus nec nibh pellentesque congue.</a></li>
                        <li><a href="#">Cras aliquam risus pellentesque pharetra.</a></li>
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
            Design: <a href="http://templated.co">TEMPLATED</a> Images: <a href="http://unsplash.com">Unsplash</a> (<a href="http://unsplash.com/cc0">CC0</a>)
         </div>
      </div>

   </body>
</html>