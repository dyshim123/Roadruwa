<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="com.b3.Users"%>
<%@ page import="com.b3.UsersDB"%>
<%@ page import="trip.point.PointDataBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/insertMemberForm.css" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="/aban/assets/bootstrap-4.1.0/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<jsp:useBean id="users" class="com.b3.Users">
	<jsp:setProperty name="users" property="*" />
</jsp:useBean>
<jsp:useBean id="point" class="trip.point.PointDataBean">
	<jsp:setProperty name="point" property="*" />
</jsp:useBean>
<body>
<%
UsersDB userDB = UsersDB.getInstance();
userDB.insertUser(users);
response.sendRedirect("main.jsp");
%>

</body></html>