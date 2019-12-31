<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.b3.Users"%>
<%@ page import="com.b3.UsersDB"%>

<jsp:useBean id="user" class="com.b3.Users">
     <jsp:setProperty name="user" property="*"/>
</jsp:useBean>

<%
   request.setCharacterEncoding("utf-8"); 
   String title = "탈퇴완료";   
   
   String id = request.getParameter("u_id");
   String passwd = request.getParameter("u_pwd");
   user.setU_id(id);
   user.setU_pwd(passwd);
   
   UsersDB logon = UsersDB.getInstance();
   int check= logon.UsersCheck(id,passwd);
   
   if(check==1){
      session.setAttribute("u_id",id);
      logon.deleteUser(id, passwd);
%>


<% session.invalidate(); %>      
<script>
    alert("탈퇴 완료! 다음에 또 만나요!");
   location.href="main.jsp";
</script>

<%
   }else if(check==0){
%>
    <script> 
     alert("아이디가 맞지 않습니다.");
      history.go(-1);
   </script>
<%
   }else{
%>
   <script>
     alert("비밀번호가 맞지 않습니다..");
     history.go(-1);
   </script> 
<%
   }
%>