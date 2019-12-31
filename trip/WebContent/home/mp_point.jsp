<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="trip.point.PointDataBean"%>
<%@ page import="trip.point.PointDBBean"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%@ include file="sessionCheckPro.jsp"%>
<jsp:include page="header.jsp" flush="false" />
<link href="assets/css/mypage.css" rel="stylesheet" type="text/css"
   media="all" />
<%
   request.setCharacterEncoding("utf-8");
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

   List<PointDataBean> pointLists = null;
   PointDataBean pointBean = null;
   PointDBBean point = PointDBBean.getInstance();
   int count = point.getPointCount();

   u_id = null;
   if (session.getAttribute("u_id") != null) {
      u_id = (String) session.getAttribute("u_id");
      pointBean = point.PointInfo(u_id);
      if (count > 0) {
         pointLists = point.getPoints(u_id);
      }
   }
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
            <li><a href="mp_my.jsp" accesskey="1" title="">내 게시물</a></li>
            <li><a href="mp_buy.jsp" accesskey="2" title="">구매리스트</a></li>
             <li class="current_page_item"><a href="mp_point.jsp"
               accesskey="3" title="">포인트 충전/내역</a></li>
            <li><a href="mp_message.jsp" accesskey="4" title="">쪽지</a></li>
               <li><a href="mp_set.jsp" accesskey="5" title="">설정</a></li>
         </ul>
      </div>
   </div>

   <div id="nmain" class="nmain_no">
      <h4>
         <b>포인트 충전/내역</b>
      </h4>
      <div id="line"></div>
      <div id="uda">
         <h5>보유포인트 :  <%=nowpoint%>P</h5>
      <button type="button" class="btn btn-outline-primary" data-toggle="modal"
         data-target="#chargeModal">충전하기</button>
      </div>
      <table class="table">
         <thead>
            <tr>
               <th scope="col">날짜</th>
               <th scope="col">내역</th>
               <th scope="col">거래포인트</th>
               <th scope="col">잔여포인트</th>
            </tr>
         </thead>
         <tbody>
            <%
               for (int i = 0; i < pointLists.size(); i++) {
                  pointBean = (PointDataBean) pointLists.get(i);
            %>
            <tr>
               <td><%=sdf.format(pointBean.getReg_date())%></td>
               <td class="txt_line"><%=pointBean.getContent()%></td>
               <td><%=pointBean.getTpoint()%>p</td>
               <td><%=pointBean.getRpoint()%>p</td>
            </tr>
            <%
               }
            %>
         </tbody>
      </table>
   </div>

</div>
<br><br><br><br>
<div class="modal fade" role="dialog" id="chargeModal">
   <div class="modal-dialog">
      <div class="modal-content mcc">
            <div class="atitle"><h2><b>충전하기</b></h2></div>
            <img src="images/money1.png" class="chim">
            <input type="text" class="tb" name="rg" placeholder="충전할 포인트를 입력하세요." numberOnly/>
            <hr>
            <div class="no">현재 보유한 포인트<div class="imgp2"><img src="images/aa.png" id="imgp"></div>
            <div class="now1"><%=nowpoint %></div></div>
            <div class="no">충전 후 포인트 <div class="imgp2"><img src="images/aa.png" id="imgp"></div>
            <div class="now1" id="ccc"><%=nowpoint %></div></div>
            <div class="no"><button id="mbut" class="mbut">구매</button>
            <button class="mbut2" data-dismiss="modal">취소</button></div>
      </div>
   </div>
</div>
<script>
//포인트 충전
   $(document).ready(function() {
      $("input:text[numberOnly]").on("keyup", function() {
          $(this).val($(this).val().replace(/[^0-9]/g,""));
      });
      
      $('#mbut').click(function() {
           var result = $('.tb').val();
           if (!result) {//입력안했을때
             alert("충전할 포인트를 입력하십시오.");
           }else{
            var charge = $('.tb').val();
            location.href = 'chargePro.jsp?charge=' + charge;
           }
      });
      
      $('.tb').keyup(function() {
         var charge = $('.tb').val();
         document.getElementById('ccc').innerHTML=<%=nowpoint%>+parseInt(charge);
      });
      

   });
</script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="assets/bootstrap-4.1.0/js/bootstrap.min.js"></script>
<jsp:include page="footer.jsp" flush="false" />