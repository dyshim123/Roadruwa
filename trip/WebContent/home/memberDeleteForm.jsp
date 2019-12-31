<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.b3.Users"%>
<%@ page import="com.b3.UsersDB"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="trip.point.PointDataBean"%>
<%@ page import="trip.point.PointDBBean"%>
<jsp:include page="header.jsp" flush="false" />
<link rel="stylesheet" href="assets/css/card.css" />
<link href="assets/css/mypage.css" rel="stylesheet" type="text/css"
   media="all" />

<%
   request.setCharacterEncoding("UTF-8");
   String u_id = (String) session.getAttribute("u_id");
   String u_pwd = request.getParameter("u_pwd");
   PointDataBean pointBean = null;
   PointDBBean point = PointDBBean.getInstance();

   Users user = null;
   
   int nowpoint = point.Nowpoint(u_id);//현재포인트

   if(session.getAttribute("u_id")==null){
      response.sendRedirect("main.jsp");        
   }else{
      UsersDB users = UsersDB.getInstance();
      user = users.getUser(u_id);
      String yu = user.getU_id().toString();
      pointBean = point.PointInfo(u_id);
%>
<style>
   .in1{
      width:300px;
      margin-left:240px;
   }
   .bu1{
      width:80px;
      height:40px;
      float:left;
      margin-left:350px;
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
         <b> 회원 탈퇴 </b>
      </h4>
      <div id="line"></div>
      <br>
      <form class="form" method="post" action="memberDeletePro.jsp">
        <b><%= yu %>님, 비밀번호 입력 후 확인버튼 누르면 탈퇴가 완료 됩니다.</b><br><br><br>
               <input type="text" class="form-control" name="u_id" id="u_id"
                  value="<%=user.getU_id() %>" readonly hidden="hidden"> 
               
               <input type="password" class="form-control in1" name="u_pwd" id="u_pwd"
                  placeholder="비밀번호를 입력해주세요." required="required">
                  <button type="submit" class="btn btn-primary bu1">완료</button>
                  
                  
      </form>
   </div>
</div>
<br>
<br>
<br>
<br>
<jsp:include page="footer.jsp" flush="false" />
<% } %>
