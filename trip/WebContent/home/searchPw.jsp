<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ page import="com.b3.UsersDB"%>
     <%@ page import="com.b3.Users"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 찾기</title>
<% request.setCharacterEncoding("euc-kr"); %>

<%

	String u_id = request.getParameter("u_id");
	String u_phone = request.getParameter("u_phone");

	
	UsersDB  manager = UsersDB .getInstance();
	Users c =  manager.searchPw(u_id, u_phone); 
	

	try
	{
%>

<body>
<center>
<form method = "post" action = "main.jsp">
<%
		if(c != null)
		{
%>
			<%= u_id %>님에 비밀번호는 <b><%= c.getU_pwd() %></b> 입니다.<p>
			<input type = "submit" value = "메인으로..">
<%
		}
		else
		{
%>
			아이디 또는 주민등록번호가 틀렸습니다.<p>
			<input type = "button" value = "다시 입력하기" onclick = 
				"javascript:window.location='searchPwForm.jsp'">
<%
		}
%>
</form>
</center>
</body>
<%
		}catch(Exception e) {}
%>
</html>