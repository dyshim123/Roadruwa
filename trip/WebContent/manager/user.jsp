<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.b3.Users"%>
<%@ page import="com.b3.UsersDB"%>
<%@ page import="java.util.List"%>
<jsp:include page="mheader.jsp" flush="false" />
<%
   request.setCharacterEncoding("utf-8");

   List<Users> userList = null;

   UsersDB userProcess = UsersDB.getInstance();
   int count = userProcess.getUserCount();

   if (count > 0) {
      userList = userProcess.getUsers();
   }
%>
   <div id="wrapper">
      <div id="main">
         <div class="inner">
            <div class="row">
               <header class="majorr">
                  <br>
                  <h2>회원관리테이블</h2>
               </header>
               <%
                  if (count == 0) {
               %>
               <table class="table">
                  <tr>
                     <td align="center">가입한 회원이 없습니다.<br></td>
                  </tr>
               </table>
               <%
                  } else {
               %>
               <table class="table table-striped">
                  <thead>
                     <tr>
                        <th scope="col">번호</th>
                        <th scope="col">아이디</th>
                        <th scope="col">이름</th>
                        <th scope="col">나이</th>
                        <th scope="col">핸드폰번호</th>
                        <th scope="col">성별</th>
                        <th scope="col">이메일</th>
                     </tr>
                  </thead>
                  <%
                     for (int i = 0; i < userList.size(); i++) {
                           Users user = (Users) userList.get(i);
                  %>
                  <tbody class="tbo1">
                     <tr>
                        <td><%=i+1 %></td>
                        <td><%=user.getU_id()%></td>
                        <td><%=user.getU_name()%></td>
                        <td><%=user.getU_age()%>세</td>
                        <td><%=user.getU_phone()%></td>
                        <td><%=user.getU_gender()%></td>
                        <td><%=user.getU_email()%></td>
                     </tr>
                  </tbody>
                  <%
                     }
                  %>
               </table>
               <%
                  }
               %>
            </div>
         </div>
      </div>
<jsp:include page="mfooter.jsp" flush="false" />