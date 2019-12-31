<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="com.b3.Users"%>
<%@ page import="com.b3.UsersDB"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="trip.point.PointDataBean"%>
<%@ page import="trip.point.PointDBBean"%>
<jsp:include page="header.jsp" flush="false" />
<link rel="stylesheet" href="assets/css/card.css" />
<link rel="stylesheet" href="assets/css/circleimage.css" />
<link href="assets/css/mypage.css" rel="stylesheet" type="text/css"
   media="all" />

<%
   request.setCharacterEncoding("UTF-8");
   String u_id = (String) session.getAttribute("u_id");
   PointDataBean pointBean = null;
   PointDBBean point = PointDBBean.getInstance();
   int nowpoint = point.Nowpoint(u_id); //현재포인트

   Users user = null;

   try {
      if (session.getAttribute("u_id") == null) {
         response.sendRedirect("main.jsp");
      } else {
         UsersDB users = UsersDB.getInstance();
         user = users.getUser(u_id);
         pointBean = point.PointInfo(u_id);
         String yu = user.getU_id().toString();
%>
<style>
   .but{
      float:left;
      margin-left:200px;
   }
</style>
<div id="npage" class="side">
   <div id="nheader">
      <div id="nlogo">
      <img src="images/user.png" alt="" />
         <h6>
            <b><a href="#"><%=u_id%></a></b>
         </h6>
         <h4>
            <b><%=nowpoint%>P</b>
         </h4>
      </div>
      <div id="nmenu">
         <ul>
            <li><a href="mp_my.jsp" accesskey="1" title="">내 게시물</a></li>
            <li><a href="mp_buy.jsp" accesskey="2" title="">구매리스트</a></li>
            <li><a href="mp_point.jsp" accesskey="3" title="">포인트 충전/내역</a></li>
            <li><a href="mp_message.jsp" accesskey="4" title="">쪽지</a></li>
            <li class="current_page_item"><a href="mp_set.jsp" accesskey="5" title="">설정</a></li>
         </ul>
      </div>
   </div>

   <div id="nmain" class="nmain_no">
      <h4>
         <b> 회원 수정 </b>
      </h4>
      <div id="line"></div>
      <br><br><br><br><br>
      <form method="post" role="form" action="memberUpdatePro.jsp"
         enctype="multipart/form-data">
         <table class="table table-borderless">
            <thead>
            <colgroup>
               <col width="25%">
               <col width="25%">
               <col width="25%">
               <col width="25%">
            </colgroup>
            </thead>
            <tbody>
               <tr>
                  <td></td>
                  <td><label for="pwd">Password</label></td>
                  <td><input type="password" class="update" id="u_pwd"
                     name="u_pwd" value="<%=user.getU_pwd()%>" required></td>
                  <td></td>
               </tr>
               <tr>
                  <td></td>
                  <td><label for="name">name</label></td>
                  <td><input type="text" class="update" id="u_name"
                     name="u_name" value="<%=user.getU_name()%>" required></td>
                  <td></td>
               </tr>
               <tr>
                  <td></td>
                  <td><label for="age">Age</label></td>
                  <td><input type="text" class="update" id="u_age" name="u_age"
                     value="<%=user.getU_age()%>" required></td>
                  <td></td>
               </tr>
               <tr>
                  <td></td>
                  <td><label for="phone">Phone</label></td>
                  <td><input type="text" class="update" id="u_phone"
                     name="u_phone" value="<%=user.getU_phone()%>" required></td>
                  <td></td>
               </tr>
               <tr>
                  <td></td>
                  <td><label for="email">Email</label></td>
                  <td><input type="text" class="update" id="u_email"
                     name="u_email" value="<%=user.getU_email()%>" required></td>
                  <td></td>
               </tr>
               <tr>
                  <td><input type="hidden" id="u_id" name="u_id"
                     value="<%=user.getU_id()%>" required> <input
                     type="hidden" id="u_type" name="u_type"
                     value="<%=user.getU_type()%>" required></td>
                  <td colspan="2"><button type="submit" class="btn btn-primary but">정보수정</button></td>
                  <td></td>
               </tr>
            </tbody>
         </table>
      </form>

   </div>
</div>


<br>
<br>
<br>
<br>
<jsp:include page="footer.jsp" flush="false" />
<%
   }
   } catch (Exception e) {
      e.printStackTrace();
   }
%>