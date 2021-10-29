<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ARCHIVE</title>
<style type="text/css">
	a{
		color: white;
		text-decoration: none;
	}
	#menu li{
		 text-decoration:none;
		 color: white;
	}
	
	#menu li a:active{
		color: #ff00ff;
	}
	
	#menu li:hover{
		background: white;
		color: #000000;
	}
	#menu li a{
		color: inherit;
	}
	
	article{
		
	}
	
	div.wrap{
		width : 960px;
		margin: 0 auto;
		height: 105px;
	}
	
	#logo{
		width: 335px;
		float: left;
		text-align: center;
	}
	
	#mainMenu{
		float: right;
		height: 100px;
		width: 620px;
		text-align: center;
	}
	
	li{
		display: inline-block;
	}
	ul{
		padding-left: 0;
	}
	#menu li {
		width: 145px;
		font-weight: bold;
		height: 35px;
		padding-top: 10px;
	}
	
	#menu{
		padding-left: 0;
	}
	
	#new{
		width: 960px;
		text-align: center;
		margin: 0 auto;
	}
	
</style>
</head>
<%String command = request.getParameter("command"); %>
<body style="background: black; color: white;">
<%if(session.getAttribute("login") == null){ %>
<%	response.sendRedirect("Main?command=loginForm&ms=a");} %>
	<div class="wrap">
	<div style="height: 100px; " >
	<div id="logo" onclick="location.href='Main?command=home'">
		<%if(command.equals("board")) {%>
		<img src="img/asdf.gif" alt="immg" height="100px">
		<%} else if(command.equals("writeForm")) {%>
		<img src="img/asdf.gif" alt="immg" height="100px">
		<%} else if(command.equals("detail")) {%>
		<img src="img/asdf.gif" alt="immg" height="100px">
		<%} else if(command.equals("artist")) {%>
		<img src="img/artist.gif" alt="immg" height="100px">
		<%} else if(command.equals("music")) {%>
		<img src="img/music.gif" alt="immg" height="100px" width="335px">
		<%} else if(command.equals("album")) {%>
		<img src="img/album.gif" alt="immg" height="100px" width="335px">
		<%} else if(command.equals("home")) {%>
		<img src="img/home.gif" alt="immg" width="335px">
		<%} else if(command.equals("gallery")) {%>
		<img src="img/gallery.gif" alt="immg" width="335px">
		<%}%>
	</div>
	<div id="mainMenu">
		<ul >
			<li style="padding: 0 130px;"><b>${login.id }</b></li>
			<li>|</li>
			<li style="padding: 0 130px;"><b><a href="Main?command=logout">Logout</a></b></li>
		</ul>

		<ul id="menu">
			<li onclick="location.href='Main?command=artist'"><a href="Main?command=artist">Artist</a></li>
			<li onclick="location.href='Main?command=gallery'"><a href="Main?command=gallery">Gallery</a></li>
			<li onclick="location.href='Main?command=music'"><a href="Main?command=music">Music</a></li>
			<li onclick="location.href='Main?command=board'"><a href="Main?command=board">Talk</a></li>
		</ul>
	</div>
</div>
	</div>
</body>
</html>