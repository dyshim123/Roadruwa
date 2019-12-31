<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String managerId = null;
	if (session.getAttribute("managerId") != null) {
		managerId = (String) session.getAttribute("managerId");
	}
	if (managerId == null) {
%>
<script>
	alert("로그인을 해야 합니다.");
	location.href = "logon/managerLoginForm.jsp";
</script>
<%
	}
	managerId = (String) session.getAttribute("managerId");
%>
<!DOCTYPE HTML>
<html>
<head>
<title>관리자 페이지</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/navbar.css" />
</head>
<body>
	<section id="nnaa">
		<a href="manager.jsp" class="lolo"><img src="images/main.png"></a>
		<div class="alignid"><%=managerId%>
			<a href="logon/managerLogout.jsp" class="sp"><i
				class="fa fa-sign-out"></i></a>
		</div>
	</section>