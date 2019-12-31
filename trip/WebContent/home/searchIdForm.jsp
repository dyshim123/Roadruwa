<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="com.b3.UsersDB"%>
     <%@ page import="com.b3.Users"%>
  
    <jsp:include page="header.jsp" flush="false" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <style>

    body{
  text-align: center;
}
 table {
  
    margin-left: auto;
    margin-right: auto;
border: 1px solid #DEE2E6;
  }

 
    </style>

<title>아이디 찾기/비밀번호 찾기</title>
</head>
<link href = "style.css" rel = "stylesheet" type = "text/css">
<br><br><br><br><br><br>
<!--  style="border:1px solid;" -->

<div class="containter">
<form method = "post" action = "searchId.jsp">
<table  class="table" style="width: 35%;"> <tr>
<td colspan="2" style="padding-bottom:0px;"><h3><b>아이디 찾기</b></h3></td>


<tr>
	<td >
		이름
	</td>
	<td >
		<input type = "text" name = "u_name" id="u_name"  size = "18" >
    </td>
</tr>
<tr>
	<td >
		이메일 번호
	</td>
	<td >
		<input type = "text" name = "u_email" id="u_email"> 
		
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type = "submit" value = "찾기">
		<input type = "button" value = "메인" onclick = 
			"javascript:window.location = 'main.jsp'">
	</td>
</tr>
</table>
</form>
</div>
<% request.setCharacterEncoding("utf-8"); %>

<%

	String u_name = request.getParameter("u_name");
	String u_email = request.getParameter("u_email");
	
	
	UsersDB manager = UsersDB.getInstance();
	Users c = manager.searchId(u_name,u_email); 
	
	try
	{
%>




<%
		}catch(Exception e) {}
%>


</html>