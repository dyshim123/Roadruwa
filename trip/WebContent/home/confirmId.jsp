<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ page import="com.b3.UsersDB"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ID 중복확인</title>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String u_id = request.getParameter("u_id");
	UsersDB manager = UsersDB.getInstance();
	
	int check = manager.confirmId(u_id);
%>

<body>
<%
	if(check == 1)
	{
%>
<table width = "270" border = "0" cellspacing = "0" cellpadding = "5">
<tr>
	<td height = "39"><%= u_id %>이미 사용중인 아이디입니다.</td>
</tr>
</table>
<form name = "checkForm" method = "post" action = "confirmId.jsp">
<table width = "270" border = "0" cellspacing = "0" cellpadding = "5">
<tr>
	<td align = "center">
		다른 아이디를 사용하세요.<p>
		<input type = "text" size = "10" maxlength = "12" name = "u_id" id = "u_id">
		<input type = "submit" value = "ID중복확인">
	</td>
</tr>
</table>
</form>
<%
	}
	else
	{
%>
<table width = "270" border = "0" cellspacing = "0" cellpadding = "5">
<tr>
	<td align = "center"><p>
		입력하신 <%= u_id %>는 사용하실 수 있는 ID입니다.
		<input type = "button" value = "닫기" onclick = "setU_id()">
	</td>
</tr>
</table>
<%
	}
%>
</body>
</html>
<script language = "javascript">
<!-- 
	function setid()
	{
		opener.document.userinput.id.value = "<%= u_id %>";
		self.close();
	}
-->
</script>