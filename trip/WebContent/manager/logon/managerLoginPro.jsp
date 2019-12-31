<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="trip.master.MasterDBBean"%>

<% request.setCharacterEncoding("utf-8");%>

<%
    String id = request.getParameter("id");
	String passwd  = request.getParameter("passwd");
	
	MasterDBBean manager = MasterDBBean.getInstance();
    int check = manager.managerCheck(id,passwd); 

	if(check == 1){
		session.setAttribute("managerId",id);
		response.sendRedirect("../manager.jsp");
	}else if(check == 0){%>
    <script> 
	  alert("비밀번호가 맞지 않습니다.");
      history.go(-1);
	</script>
<% }else{ %>
	<script>
	  alert("아이디가 맞지 않습니다..");
	  history.go(-1);
	</script>
<% }%>