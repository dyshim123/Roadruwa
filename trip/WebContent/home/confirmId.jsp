<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ page import="com.b3.UsersDB"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ID �ߺ�Ȯ��</title>
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
	<td height = "39"><%= u_id %>�̹� ������� ���̵��Դϴ�.</td>
</tr>
</table>
<form name = "checkForm" method = "post" action = "confirmId.jsp">
<table width = "270" border = "0" cellspacing = "0" cellpadding = "5">
<tr>
	<td align = "center">
		�ٸ� ���̵� ����ϼ���.<p>
		<input type = "text" size = "10" maxlength = "12" name = "u_id" id = "u_id">
		<input type = "submit" value = "ID�ߺ�Ȯ��">
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
		�Է��Ͻ� <%= u_id %>�� ����Ͻ� �� �ִ� ID�Դϴ�.
		<input type = "button" value = "�ݱ�" onclick = "setU_id()">
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