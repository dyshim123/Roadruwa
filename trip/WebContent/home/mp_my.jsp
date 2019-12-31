<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="trip.point.PointDataBean"%>
<%@ page import="trip.point.PointDBBean"%>
<%@ page import="trip.board.BoardDataBean"%>
<%@ page import="trip.board.BoardDB"%>
<%@ page import="java.util.*"%>
<%@ include file="sessionCheckPro.jsp"%>
<jsp:include page="header.jsp" flush="false" />
<link href="assets/css/mypage.css" rel="stylesheet" type="text/css"
   media="all" />
<link rel="stylesheet" href="assets/css/card.css" />
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.4.2/css/all.css">
<%
   request.setCharacterEncoding("utf-8");

   u_id = null;
   PointDataBean pointBean = null;
   PointDBBean point = PointDBBean.getInstance();

   if (session.getAttribute("u_id") != null) {
      u_id = (String) session.getAttribute("u_id");
      pointBean = point.PointInfo(u_id);
   }
   BoardDB modal = BoardDB.getInstance();
   int count = modal.getmyCount(u_id);
   BoardDataBean modalBean = null;
   List<BoardDataBean> modalLists = null;
   int nowpoint = point.Nowpoint(u_id);//현재포인트
%>
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
            <li class="current_page_item"><a href="mp_my.jsp" accesskey="1" title="">내 게시물</a></li>
            <li><a href="mp_buy.jsp" accesskey="2" title="">구매리스트</a></li>
            <li><a href="mp_point.jsp" accesskey="3" title="">포인트 충전/내역</a></li>
            <li><a href="mp_message.jsp" accesskey="4" title="">쪽지</a></li>
            <li><a href="mp_set.jsp"
               accesskey="5" title="">설정</a></li>
         </ul>
      </div>
   </div>

   <div id="nmain" class="nmain_no">
      <h4>
         <b>내 게시물</b>
         <button onclick="location.href='writeForm.jsp'">글쓰기</button>
      </h4>
      <div id="line"></div>
      <br>
      <%
         if (count == 0) {
      %>
      <div>내가 쓴 상품이 없습니다.</div>
      <a href="writeForm.jsp">글쓰기</a>
      <%
         }
         if (count > 0) {
            modalLists = modal.getmyModals(u_id);
      %>
      <div class="row">
         <%
            for (int i = 0; i < modalLists.size(); i++) {
                  modalBean = (BoardDataBean) modalLists.get(i);
         %>
         <div class="col-4 col-8-narrower" id="js-load">

            <section class="box special" onclick="show(<%=modalBean.getB_num()%>)">
               <span class="image featured"><img
                  src="/uploadFile/<%=modalBean.getB_pic1()%>" alt="" class="mip" /></span>
                  <%String app="미승인";
                  if(app.equals(modalBean.getAppr())){%>
                  <div id="appr1"><%=modalBean.getAppr()%></div>
                  <%}else{ %>
                  <div id="appr"><%=modalBean.getAppr()%></div>
                  <%} %>
                  <div class="txt_line"><%=modalBean.getB_title()%></div>
            </section>
         </div>
         <%
            }
         %>
         <br>
      </div>

      <%
         }
      %>
   <script type="text/javascript">
   function show(b_num) { 
      location.href ="content.jsp?b_num="+b_num; 
   }
   </script>


   </div>
</div>
<br>
<br>
<br>
<br>
<jsp:include page="footer.jsp" flush="false" />