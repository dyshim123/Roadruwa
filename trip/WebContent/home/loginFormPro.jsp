<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.b3.UsersDB"%>
<%
   request.setCharacterEncoding("utf-8");
%>

<%
   String u_id = request.getParameter("u_id");
   String u_pwd = request.getParameter("u_pwd");

   UsersDB logon = UsersDB.getInstance();
   int check = logon.userCheck(u_id, u_pwd);

   if (check == 1) {
      session.setAttribute("u_id", u_id);

      //로그인 후 게시판 목록으로 이동하도록 수정함.
      response.sendRedirect("main.jsp");
   } else if (check == 0) {
%>
<script>
   alert("비밀번호가 맞지 않습니다.");
   history.go(-1);
</script>
<%
   } else {
%>
<script>
   alert("아이디가 맞지 않습니다..");
   history.go(-1);
</script>
<%
   }
%>