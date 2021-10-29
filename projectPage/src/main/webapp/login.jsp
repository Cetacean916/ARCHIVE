<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%
    String clientId = "BXMUqmkrVeQk3qxZzo6Q";
    String redirectURI = URLEncoder.encode("http://localhost:8181/projectPage/naver.jsp", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 	%>
<html>
<head>
<meta charset="UTF-8">
<title>ACCESS SPACE</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<c:if test="${chk == '1' }">
	<script type="text/javascript">
		alert('로그인 실패');
	</script>
</c:if>
<c:if test="${ms =='a' }">
	<script type="text/javascript">
		alert('로그인 세션이 종료되었습니다.\r\n다시 로그인 해주세요.');
	</script>
</c:if>
<style type="text/css">
	#wrap{
		width: 960px;
		margin: 130px auto 0;
		text-align: center;
		height: 600px;
	}
	
	#hole h1{
		font-size: 150px;
		margin: 0 auto 70px;
	}
	
	#hole label{
		font-size: 50px;
	}
	
	table{
		text-align: center;
		margin: 0 auto;
	}
	table tr td{
		width: 300px;
	}
	table tr td input {
		width: 600px;
		font-size: 50px;
		background: black;
		border: 2px solid white;
		color: white;
	}
	
	#join,#goMain{
		box-shadow: none;
		border: none;
		background-color: black;
		color: white;
		font-size: 40px;
	}
	#gg,#jj{
		width: 400px;
		margin: 50px 0;
		text-align: center;
		display: inline-block;
	}
	
</style>
</head>
<body style="background-color: black; color: white;">
<div id="wrap">
<div id="hole">
	<h1>ACCESS</h1>
	<form action="Main?command=login" method="post">
	<table>
		<tr>
			<td>
				<label> ID : </label>
			</td>
			<td colspan="2">
				<input type="text" name="id">
			</td>
		</tr>
		
		<tr>
			<td>
				<label>PASSWORD : </label>
			</td>
			<td colspan="2">
				<input type="password" name="pw">
			</td>
		</tr>
	</table>
	<br>
	<div id="gg">
	<input type="submit" value="Login" id="goMain">
	</div>
	<div id="jj">
	<input type="button" value="Join" onclick="location.href='Main?command=joinForm'" id="join">
	</div>
	</form>
 	
	</div>
</div>
</body>
</html>