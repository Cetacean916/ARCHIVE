<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#title, #content{
		width: 960px;
		margin: 0 30px;
		background: gray;
		font-size: 25px;
		font-weight: bold;
		color: white;
	}
	
	form{
		margin: 0 auto;
		text-align: center;
	}
	
	#title{
		height: 50px;
	}
	
	#submit{
		background-image: url("img/submit.png");
	}
</style>
<script type="text/javascript">
	function submit() {
		document.fo.action="Main?command=write";
		document.fo.submit();
	}
</script>
</head>
	<body>
		<div id="new">
			<h2>New Write</h2>
		</div>
		
		<div id="form">
		<form action="Main?command=write" method="post" name="fo" id="fo">
			<input type="hidden" name="id" value="${login.id }">
			<input type="text" name="title" maxlength="50" id="title" >
			<br><br>
			<textarea name="content" id="content" cols="900px" rows="23" ></textarea>
			<br>
		</form>
		</div>
		<div id="new">
		<img alt="submit" src="img/submit.png" onclick="return submit()" >
		</div>
</body>
</html>