<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Come to Join Us</title>
<script type="text/javascript">
	function join() {
		if(document.fo.id.value == ""){
			alert('ID를 입력해주세요.');
			document.fo.action='Main?command=joinForm';
		}else if(document.fo.pw.value == ""){
			alert('비밀번호를 입력해주세요.');
			document.fo.action='Main?command=joinForm';
		}else if(document.fo.name.value == ""){
			alert('이름을 입력해주세요.');
			document.fo.action='Main?command=joinForm';
		}
	}
</script>
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
	#submit{
		background-image: url('logo/submit.png');
		background-repeat:no-repeat;
		width: 160px;
		height: 72px;
		box-shadow: none;
		background-color: black;
		border: none;
		margin-top: 50px;
	}
	#submit:hover{
		width: 155px;
		height: 65px;
	}
</style>
</head>
<body style="background-color: black; color: white;">
<div id="wrap">
	<div id="hole">
	<h1>JOIN</h1>
	
	<form action="Main?command=join" method="post" name="fo">
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
		
		<tr>
			<td>
				<label> NAME : </label>
			</td>
			<td>
				<input type="text" name="name">
			</td>
		</tr>
	</table>
	<br>
	<input type="submit" id="submit" onclick="join()">
	</form>
	</div>
</div>
</body>
</html>