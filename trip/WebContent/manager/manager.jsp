<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<jsp:include page="mheader.jsp" flush="false" />
<%@ page import="com.b3.Users"%>
<%@ page import="com.b3.UsersDB"%>
<%@ page import="trip.board.BoardDB"%>
<%@ page import="trip.board.BoardDataBean"%>
<%
   UsersDB users = UsersDB.getInstance();
   int usercount = users.getUserCount();

   BoardDB dbPro = BoardDB.getInstance();
   int boardcount = dbPro.getBoardCount_pre();//미승인개수
%>
   <div id="wrapper">
      <div id="main">
         <div class="inner">
            <div class="row">
               <div class="col-lg-3 col-xs-6">
                  <div class="rad-info-box rad-txt-success">
                     <a href="user.jsp"><i class="fa fa-user"></i> <span class="heading">회원현황</span>
                        <span class="value"><%=usercount %></span></a>
                  </div>
               </div>
               <div class="col-lg-3 col-xs-6">
                  <div class="rad-info-box rad-txt-primary">
                     <a href="product1.jsp"><i class="fa fa-file-text"></i> <span
                        class="heading">미승인 상품</span> <span class="value"><%=boardcount %></span></a>
                  </div>
               </div>
               <div class="col-lg-3 col-xs-6">
                  <div class="rad-info-box rad-txt-danger">
                     <a href="QA1.jsp"><i class="fa fa-commenting"></i> <span
                        class="heading">받은 쪽지</span> <span class="value">9</span></a>
                  </div>
               </div>
            </div>
         </div>
      </div>
<jsp:include page="mfooter.jsp" flush="false" />