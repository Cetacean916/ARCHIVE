<%@page import="dto.MusicVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
@import url('https://fonts.googleapis.com/css2?family=Allison&display=swap');
</style>
<style type="text/css">
	@font-face {
    font-family: 'Cafe24SsurroundAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
	
	#wrap{
		width: 960px;
		margin: 0 auto;
	}
	
	#imgwrap{
		width: 960px;
		height: 460px;
		text-align: center;
		margin-top: 30px;
	}
	#imgwrap h3{
		font-family: 'Allison', cursive;
		font-size: 25px;
		color: #FFCC66;
		margin: 15px;
	}
	#albumImg{
		max-width: 960px;
		height: 400px;
	}
	
	ol{
		text-align: center;
		margin-top: 10px;
	}
	
	ol li{
		font-size: 20px;
		margin: 5px;
	}
	
	ol li a{
		color: #FFCC99;
		font-weight: bold;
		font-family: 'Cafe24SsurroundAir';
	}
	ol li a:hover {
		color: #FF9900;
		font-size: 22px;
	}
</style>
</head>
<body>
	<div id="wrap">
		<%ArrayList<MusicVO> album = (ArrayList)request.getAttribute("album"); %>
		<%for(MusicVO vo : album){ %>
			<div id="imgwrap">
				<img alt="album" src="album/<%=vo.getImage()%>.jpg" id="albumImg">
				<h3>Release Date : <%=vo.getRelease() %></h3>
			</div>
		<%break; } %>
		
		<ol>
			<%int i = 1; %>
			<%for(MusicVO vo : album) {%>
				<li><a href="<%=vo.getLink()%>"><%=i%>.&nbsp;<%=vo.getSong() %></a></li>
				<br>
			<%i++;} %>
		</ol>
	</div>
</body>
</html>