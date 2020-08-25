<%@page import="DWM.vo.PhotoBoardVO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>**포토게시판**</title>
<% 
// 로그인 아이디 받아오기
String loginid = (String) session.getAttribute("id");
//================================================================

// 당일 게시물들 받아오기
List<PhotoBoardVO> photolist = (List<PhotoBoardVO>) request.getAttribute("photolist");
//================================================================

// 당일 탑3 게시물들 받아오기
List<PhotoBoardVO> top3list = (List<PhotoBoardVO>) request.getAttribute("top3list");
//================================================================

//닉네임 받아올 객체
Map<String,String> nickname = (Map<String,String>) request.getAttribute("nickname");
//================================================================

// 로그인 아이디로 추천한 게시물 번호 받아오기
List<PhotoBoardVO> likelist = (List<PhotoBoardVO>) request.getAttribute("likelist");
//================================================================

// 페이지 부분 이부분을 컨트롤러에서 get으로 보내주면 검색하기 편할듯 
String date = (String) request.getAttribute("date");
int pagenum = (int) request.getAttribute("pagenum"); // 입력된 페이지 , 컨트롤러에서 디폴트로 1
int itemnum = (int) request.getAttribute("itemnum"); // 게시물 총 갯수 받아오기
int totalpage = (int) itemnum/12 + 1;
int pageflag = (int) (pagenum-1)/5+1;
if(!photolist.isEmpty()){
	int fromIndex = (pagenum-1)*12;
	int toIndex = ((pagenum*12 >itemnum) ? itemnum : pagenum*12 );
	photolist = photolist.subList(fromIndex, toIndex);
}
//================================================================



%>
</head>
<body>
<h1> ** 포토 게시판 **</h1>
<p>로그인 id :	<%=loginid%></p>
<hr>
		<!-- 데일리 탑3 부분 -->
<%=date%>&nbsp;TOP&nbsp;3<br>
<table border="0">
<tr>
<%for(int i = 0 ; i < top3list.size() ; i++) {%>
<td><img src="/ProtoType/upload/photoboard/<%=top3list.get(i).getPb_file().trim()%>" 
	title="<%=top3list.get(i).getPb_file().trim()%>" alt="" width="100px" height="100px" 
	onclick="window.open('/ProtoType/photoboard/viewbody?count=<%=top3list.get(i).getCount() %>',
	'<%=top3list.get(i).getPb_file().trim()%>',
	'height=650,location=no,status=no,scrollbars=yes');"><br>
	<%=nickname.get(top3list.get(i).getId()) %>
	(<%=top3list.get(i).getId() %>)<br>
	날씨 : <%=top3list.get(i).getPb_weather() %><br>
	추천수 : <%=top3list.get(i).getPb_count() %></td>
<%} %>
</tr>
</table>

<hr>
게시물 총 갯수 : <%=itemnum %>
<!-- 데일리 4X3 포맷으로 12개 마다 페이지 넘기기 -->
<table border="0">
<%for(int i = 0 ; i < photolist.size() ; i++){ 
if(i%4==0){%>
<tr>
<%} %>
	<!-- 각 게시물 정보 -->
	<td><img src="/ProtoType/upload/photoboard/<%=photolist.get(i).getPb_file().trim()%>" 
	title="<%=photolist.get(i).getPb_file().trim()%>" 
	alt="" width="100px" height="100px"
	onclick="window.open('/ProtoType/photoboard/viewbody?count=<%=photolist.get(i).getCount() %>',
	'<%=photolist.get(i).getPb_file().trim()%>',
	'height=650,location=no,status=no,scrollbars=yes');"><br>
	<%=nickname.get(photolist.get(i).getId()) %>
	(<%=photolist.get(i).getId() %>)<br>
	날씨 : <%=photolist.get(i).getPb_weather() %><br>
	<%if(loginid!=null) {
	int cnt = 0;
	%>
	<%for(PhotoBoardVO vo : likelist){ 
		if(vo.getCount()==photolist.get(i).getCount()){%>
			<a href="/ProtoType/photoboard/recommandcancel?date=<%=date %>&pagenum=<%=pagenum %>&count=<%=photolist.get(i).getCount() %>&id=<%=loginid %>">추천 취소</a><br>
		<%}else{
			cnt++;
		}%>
	<%}
	if(cnt==likelist.size()){	
	cnt=0;%>
		<a href="/ProtoType/photoboard/recommand?date=<%=date %>&pagenum=<%=pagenum %>&count=<%=photolist.get(i).getCount() %>&id=<%=loginid %>">추천 하기</a><br>
	<%}}%>
	추천수 : <%=photolist.get(i).getPb_count() %><br>
	
	<%if((loginid!=null)&&(loginid.equals(photolist.get(i).getId()))) {%>
		<a href="/ProtoType/photoboard/delete?date=<%=date %>&pagenum=<%=pagenum %>&count=<%=photolist.get(i).getCount() %>&id=<%=loginid %>">글 삭제</a><br>
	<%}%>
	</td>
<%if(i%4==3){ %>
</tr>
<%}} %>
</table>

<!-- 페이지 넘기는 코드 -->
<%if(pageflag>1){%>
<a href="/ProtoType/photoboard/view?date=today&pagenum=<%=pagenum-(pagenum-1)%5-1%>">이전</a>
<%} %>
<%for (int i = 0 ; i < ((totalpage-(pageflag-1)*5)>5 ? 5 : (totalpage-(pageflag-1)*5)) ; i++) {%>
<a href="/ProtoType/photoboard/view?date=today&pagenum=<%=(pagenum-1)/5*5+i+1 %>"><%=(pagenum-1)/5*5+i+1 %></a>
<%} %>
<%if(pageflag<(int)(totalpage-1)/5+1) {%>
<a href="/ProtoType/photoboard/view?date=today&pagenum=<%=(pagenum-1)/5*5+6%>">다음</a>
<%} %>
<hr>
	<%if(loginid!=null) {%>
<form action="/ProtoType/photoboard/write" method="post">
	<input type="text" name="id" value="<%=loginid %>" hidden="true"/>
<input type="submit" value="글 작성"/>
</form>
	<%} %>

</body>
</html>