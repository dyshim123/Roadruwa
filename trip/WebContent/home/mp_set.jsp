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
.tb{
   width:500px;
   margin-left:150px;
   margin-top:50px;
}
.butt{
   width:100px;
   height:50px;
   border-radius:0;
   float:left;
   margin:10px;
}
.butt1{
   margin-left:280px;
   margin-top:50px;
}
</style>
<div id="npage" class="side">
   <div id="nheader">
      <div id="nlogo">
         <img src="images/user.png" alt="" />
         <h6 style="margin-top: 20px;">
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
            <li class="current_page_item"><a href="mp_set.jsp"
               accesskey="5" title="">설정</a></li>
         </ul>
      </div>
   </div>

   <div id="nmain" class="nmain_no">
      <h4>
         <b>설정</b>
      </h4>
      <div id="line"></div>
      <br><br>
         <table class="table table-bordered tb">
            <thead>
            </thead>
            <colgroup>
               <col width="25%">
               <col width="75%">
            </colgroup>
            <tbody>
               <tr>
                  <td><label for="id">Id</label></td>
                  <td><%=user.getU_id()%></td>
               </tr>
               <tr>
                  <td><label for="name">Name</label></td>
                  <td><%=user.getU_name()%></td>
               </tr>
               <tr>
                  <td><label for="age">Age</label></td>
                  <td><%=user.getU_age()%></td>
               </tr>
               <tr>
                  <td><label for="phone">Phone</label></td>
                  <td><%=user.getU_phone()%></td>
               </tr>
               <tr>
                  <td><label for="email">Email</label></td>
                  <td><%=user.getU_email()%></td>
               </tr>
            </tbody>
         </table>
    <div class="butt1">
      <button type="button" class="butt" onclick="location.href='memberUpdateForm.jsp'">수정</button>
 
      <button type="button" class="butt" onclick="location.href='memberDeleteForm.jsp'">탈퇴</button>
</div>
      <br>

   </div>
</div>
<br><br><br><br>


<%
   }
   } catch (Exception e) {
      e.printStackTrace();
   }
%>
<jsp:include page="footer.jsp" flush="false" />