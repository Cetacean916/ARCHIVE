<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#wrap{
		width: 960px;
		margin: 0 auto;
	}
	.album{
		margin-top: 10px;
		padding-top: 20px;
		width: 957px;
		height: 777px;
		overflow:scroll;
		overflow-x:hidden;
		text-align: center;
		border: 3px double orange;
		-ms-overflow-style: none;
	}
	.album::-webkit-scrollbar{
		width: 0 !important;
		display: none;
	}
	.album #a,#b,#c,#d{
		width: 960px;
		height: 180px;
		overflow: scroll;
		overflow-y: hidden;
		display: inline-flex;
		text-align: center;
		flex-wrap: nowrap;
		margin-bottom: 10px;
	}
	
	.album div::-webkit-scrollbar{
		display: none;
		width: 0 !important;
	}
	
	.album div div{
		width: 220px;
		height: 155px;
		display: inline-block;
		margin: 10px 5px;
		flex: 0 0 auto;
	}
	.album img{
		max-width: 100%;
		max-height: 90%;
	}
	
	.album div div:hover {
		height: 140px;
		margin: 5px 5px;
	}
	
	#siteLogo img{
		width: 165px;
		height: 50px;
		margin: 10px;
	}
	
	#siteLogo img:hover {
		width: 185px;
		height: 58px;
		margin: 0px;
	}
	
	#logoBox{
		width: 957px;
		border: 3px double orange;
		padding: 20px 0 5px;
		text-align: center;
	}
	#logoBox h1 {
		text-align: center;
		font-family: Times New Roman;
		margin: 0 auto 20px;
		width: 200px;
	}
</style>
</head>
<body >
	<div id="wrap">
	<div style="text-align: center; margin: 5px 0 10px;">
	<b>앨범 리스트는 SHIF + 드레그를 통해서 더 보실 수 있습니다</b>
	</div>
	<div id="albumBox">
		<div class="album">
			<div id="a">
			<%for(int i=1; i<=5; i++) {%>
				<div>
				<a href="Main?command=album&num=<%=i%>"><img alt="album<%=i %>" src="album/<%=i%>.jpg"></a>
				<br><b><%if(i ==1){%><%="Growing Up" %><%}else %>
					<%if (i ==2){ %><%="Last Fantasy" %><%}else %>
					<%if (i ==3){ %><%="Modern Times" %><%}else %>
					<%if (i ==4){ %><%="Palette" %><%}else %>
					<%if (i ==5){ %><%="LILAC" %><%}%></b>
				</div>
			<%} %>
			</div>
			<div id="b">
			<%for(int i=1; i<=5; i++) {%>
				<div>
				<a href="Main?command=album&num=<%=i%>.5"><img alt="albumM<%=i %>" src="album/m<%=i%>.jpg"></a>
				<br><b><%if(i ==1){%><%="Lost And Found" %><%}else %>
					<%if (i ==2){ %><%="IU...IM" %><%}else %>
					<%if (i ==3){ %><%="Real" %><%}else %>
					<%if (i ==4){ %><%="CHAT-SHIRE" %><%}else %>
					<%if (i ==5){ %><%="Love poem" %><%}%></b>
				</div>
			<%} %>
			</div>
			<div id="c">
			<%for(int i=1; i<=2; i++) {%>
				<div>
				<a href="Main?command=album&num=<%=i%>.3"><img alt="albumRE<%=i %>" src="album/remake<%=i%>.jpg"></a>
				<br><b><%if(i ==1){%><%="꽃갈피" %><%}else %>
					<%if(i ==2){%><%="꽃갈피 둘" %><%}%></b>
				</div>
			<%} %>
			</div>
			<div id="d">
			<%for(int i=1; i<=2; i++) {%>
				<div>
				<a href="Main?command=album&num=s<%=i%>.1"><img alt="albumS<%=i %>" src="album/s<%=i%>.jpg"></a>
				<br><b><%if(i ==1){%><%="Real+" %><%}else %>
					<%if(i ==2){%><%="스무 살의 봄" %><%}%></b>
				</div>
			<%} %>
			</div>
		</div>
	</div>
	<div id="logoBox">
		<h1>Album Site</h1>
		<div id="siteLogo">
			<a href="https://www.melon.com/artist/song.htm?artistId=261143"><img alt="melon" src="logo/melon.png"></a>
			<a href="https://www.genie.co.kr/detail/artistInfo?xxnm=67872918"><img alt="genie" src="logo/genie.png"></a>
			<a href="https://www.music-flo.com/detail/artist/hddeyanz/track?sortType=POPULARITY&roleType=ALL"><img alt="flo" src="logo/flo.png"></a>
			<a href="https://music.apple.com/kr/artist/%EC%95%84%EC%9D%B4%EC%9C%A0/409076743"><img alt="apple" src="logo/apple.png"></a>
			<a href="https://music.bugs.co.kr/artist/80049126?wl_ref=list_ab_04_likeab"><img alt="bugs" src="logo/bugs.jpg"></a>
		</div>
	</div>
	</div>
</body>
</html>