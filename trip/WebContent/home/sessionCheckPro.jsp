<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
로그인 여부를 체크하여 로그인 안되어 있으면 로그인 페이지로 이동하도록 수정함.
 --%>
<%
	String u_id = "";
	try {
		u_id = (String) session.getAttribute("u_id");
		if (u_id == null || u_id.equals("")) {
%>
<script type="text/javascript">
<!--
	alert("로그인 후 사용 가능합니다.");
	document.location.href = "main.jsp";
//-->
</script>
<%
	return;
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>