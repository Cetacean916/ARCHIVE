<%@page import="dto.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String win, popup;
	win = request.getParameter("win");
	
	LoginVO login = (LoginVO) session.getAttribute("login");
	
	if(win ==null || win.equals("")){
		win = "no";
	}
	popup = request.getParameter("popup");
	if(popup == null || popup.equals("")){
		popup = "yes";
	}
	
	Cookie c = new Cookie("popup",popup);
	c.setMaxAge(86400);
	c.setPath("/");
	response.addCookie(c);
	
	if(win.equals("yes")){
		out.println("<script type=\"text/javascript\">");
		out.println("window.close();");
		out.println("</script>");
	}else{
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function sendId() {
		document.Formm.submit();
	}
</script>
</head>
<body style="background: black; color: white;">
	<form action="popup.jsp" method="post" name="Formm">
		<table>
			<tr>
				<td><h3><%= login.getName() %>님 환영합니다.</h3></td>
			</tr>
			<tr>
				<td align="center" height="12" bgcolor="#190033">
					<input type="checkbox" name="popup" value="no"><b> 오늘 하루동안 이 창을 열지 않음</b>
					<input type="hidden" name="win" value="yes">
				</td>
				<td height="14" align="right" width="20" bgcolor="#190033">
					<h3><a onclick="sendId();">Close</a></h3>
			</tr>
		</table>
	</form>
</body>
</html>
<%}%>