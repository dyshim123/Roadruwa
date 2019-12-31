<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="com.b3.UsersDB"%>
     <%@ page import="com.b3.Users"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아이디 찾기</title>
</head>
<% request.setCharacterEncoding("utf-8"); %>

<%

	String u_name = request.getParameter("u_name");
	String u_email = request.getParameter("u_email");
	
	
	UsersDB manager = UsersDB.getInstance();
	Users c = manager.searchId(u_name,u_email); 
	
	try
	{
%>

<body >
<center>

<form method = "post" action = "main.jsp">

<%
		if(c != null)
		{
%>
 
			<%=u_name %>님에 아이디는 <b><%= c.getU_id() %></b> 입니다.<p>
			<input type = "submit" value = "메인으로..">
<%
		}
		else
		{
%>
			이름 또는 이메일이 틀렸습니다.<p>
			<input type = "button" value = "다시 입력하기" onclick = 
				"javascript:window.location='searchIdForm.jsp'">
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