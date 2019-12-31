<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" flush="false" />
<%@ page import="trip.board.BoardDataBean"%>
<%@ page import="trip.board.BoardDB"%>
<%@ page import="trip.buy.BuyDBBean"%>
<%@ page import="trip.buy.BuyDataBean"%>
<%@ page import="trip.comment.CommentDBBean"%>
<%@ page import="trip.comment.CommentDataBean"%>
<%@ page import="java.util.*"%>
<link rel="stylesheet" href="assets/css/detail.css" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/message.css" />
<link rel="stylesheet" href="assets/css/circleimage.css" />
<link href="https://unpkg.com/ionicons@4.4.4/dist/css/ionicons.min.css"
   rel="stylesheet">

<script src="assets/js/message.js"></script>
<script src="assets/js/detail.js"></script>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="assets/bootstrap-4.1.0/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/ionicons@4.4.4/dist/ionicons.js"></script>
<%
   request.setCharacterEncoding("utf-8");

   String lotation = request.getParameter("lotation");
   String cost = request.getParameter("cost");
   String trans = request.getParameter("trans");
   String tema = request.getParameter("tema");
   String day = request.getParameter("day");
   String search = request.getParameter("search");

   List<BoardDataBean> modalPopLists = null;
   BoardDataBean modalBean = null;
   BoardDataBean modalBean1 = null;
   BoardDB modal = BoardDB.getInstance();

   int count = modal.getBoardCount();
   modalBean = modal.ModalInfo();
   if (count > 0) {
      modalPopLists = modal.getPopModals(lotation, day, cost, trans, tema, search);
   }

   String u_id = null;
   if (session.getAttribute("u_id") != null) {
      u_id = (String) session.getAttribute("u_id");
   }
   
   List<BuyDataBean> buyLists = null;
   BuyDBBean buy = BuyDBBean.getInstance();
   buyLists = buy.getBuys(u_id);
   BuyDataBean buyBean = null;
   

%>
<br>
<br>
<style>
#check {
   margin-left: auto;
   margin-right: auto;
}

#checks {
   margin-left: 670;
}

#text {
   width: 48%;
   height: 2em;
   font-size: 30px;
   font-family: fontAwesome;
   border: solid #2C96ED;
}
.ba button{
   color:#ec2d32;
   border:2px solid #ec2d32;
}
.ba1 button{
   color:#b6d2ed;
   border:2px solid #b6d2ed;
}
.ba2 button{
   color:#ec9933;
   border:2px solid #ec9933;
}
.top3{
width:100%;
   margin-left:170px;
}
.tit{
   text-align:center;
   font-size:2.5em;
}
.win{
   width:100px;
}
.win1{
   margin-left:310px;
   margin-bottom:20px;
}
.win2{
   margin-left:240px;
   margin-bottom:20px;
}
.win3{
   margin-left:240px;
   margin-bottom:20px;
}

</style>
<div class="b_container">
<div class="tit">인기코스 TOP3</div><br>
<img src="images/first.png" class="win win1"/>
<img src="images/second.png" class="win win2" />
<img src="images/third.png" class="win win3" />
   <div class="row top3">
   
<%
         for (int j = 0; j < 3; j++) {
            modalBean = (BoardDataBean) modalPopLists.get(j);

      %>
      <div class="col-3 col-8-narrower" id="js-load">
         <section class="box special sect" data-toggle="modal"
                     data-target="#mainModal"
                     onclick="show('<%=modalBean.getB_title()%>',
                     '<%=modalBean.getB_cate()%>','<%=modalBean.getU_id()%>','<%=modalBean.getB_day1()%>',
                     '<%=modalBean.getB_day2()%>','<%=modalBean.getB_ac()%>','<%=modalBean.getB_pic1()%>',
                     '<%=modalBean.getB_pic2()%>','<%=modalBean.getB_pic3()%>','<%=modalBean.getB_price()%>'
                     ,'<%=modalBean.getB_lo()%>','<%=modalBean.getB_num()%>')">
            <span class="image featured"><img
               src="/uploadFile/<%=modalBean.getB_pic1()%>" alt="" class="mip" /></span>
            <div class="txt_line"><%=modalBean.getB_title()%></div>
         </section>

         <br>
      </div>
      <%
         }
      %>
      <br>
</div>
</div>


<hr>
<div class="b_container">
   <div class="row">
      <%
         for (int j = 3; j < 15; j++) {
            modalBean = (BoardDataBean) modalPopLists.get(j);
      %>
      <div class="col-3 col-8-narrower cards" id="js-load">
         <section class="box special" data-toggle="modal"
                     data-target="#mainModal"
                     onclick="show('<%=modalBean.getB_title()%>',
                     '<%=modalBean.getB_cate()%>','<%=modalBean.getU_id()%>','<%=modalBean.getB_day1()%>',
                     '<%=modalBean.getB_day2()%>','<%=modalBean.getB_ac()%>','<%=modalBean.getB_pic1()%>',
                     '<%=modalBean.getB_pic2()%>','<%=modalBean.getB_pic3()%>','<%=modalBean.getB_price()%>'
                     ,'<%=modalBean.getB_lo()%>','<%=modalBean.getB_num()%>')">
            <span class="image featured"><img
               src="/uploadFile/<%=modalBean.getB_pic1()%>" alt="" class="mip" /></span>
            <div class="txt_line"><%=modalBean.getB_title()%></div>
         </section>
         <br>
      </div>
      <%
         }
      %>
      <br>
   </div>
</div>


<br>
<br>
<br>
<br>
<script type="text/javascript">
   function show(b_title, b_cate, u_id, b_day1, b_day2, b_ac, b_pic1, b_pic2,
         b_pic3, b_price, b_lo, b_num) { 
      
      //구매한 사람은 바로 그 content로 넘어가게
      <%for (int i = 0; i < buyLists.size(); i++) {
            buyBean = (BuyDataBean) buyLists.get(i);%>
       if(b_num==<%=buyBean.getB_num()%>){location.href = 'content.jsp?b_num=' + b_num;}
       <%}%>
      $("#title").html(b_title);
      $("#cate").html(b_cate);
      $("#id").html(u_id);
      $("#day1").html(b_day1);
      $("#day2").html(b_day2);
      $("#ac").html(b_ac);
      $("#price").html(b_price);
      $("#loc").html(b_lo);
      $("#b_num").html(b_num);
      
      document.getElementById('profile-upload').style.backgroundImage = 'url(/uploadFile/'
            + b_pic1 + ')';
      document.getElementById('profile-upload2').style.backgroundImage = 'url(/uploadFile/'
            + b_pic2 + ')';
      document.getElementById('profile-upload3').style.backgroundImage = 'url(/uploadFile/'
            + b_pic3 + ')';
      //modal을 띄워준다.
      
   document.getElementById("mbut").onclick = function() {
         location.href = 'buyPro.jsp?b_num=' + b_num;
      }
      
   }
</script>
<div class="modal fade" id="mainModal" role="dialog">
   <div class="modal-dialog modal-lg">
      <div class="modal-content mc">
         <div class="modal-body mb">
            <div class="row">
               <div>
                  <br>
                  <h2 class="h2-responsive product-name">
                     <b>[</b><strong id="cate"></strong><b>]</b> <strong id="title"></strong>
                  </h2>
                  <br> <br>
                  <div id="profile-upload" class="cir"></div>
                  <div id="profile-upload2" class="cir"></div>
                  <div id="profile-upload3" class="cir"></div>

                  <table id="detata">
                     <tr>
                        <td class="mota"><img src="images/writer.png" id="mpicto">
                           <h5>글쓴이</h5>
                           <h3>
                              <strong id="id"></strong>
                           </h3></td>
                        <td class="mota"><img src="images/hour.png" id="mpicto">
                           <h5>예상일수</h5>
                           <h3>
                              <strong id="day1"></strong>박 <strong id="day2"></strong>일
                           </h3></td>

                        <td class="mota"><img src="images/won.png" id="mpicto">
                           <h5>예상금액</h5>
                           <h3>
                              <strong id="ac"></strong>원
                           </h3></td>
                        <td class="mota"><img src="images/world.png" id="mpicto">
                           <h5>지역</h5>
                           <h3>
                              <strong id="loc"></strong>
                           </h3></td>
                     </tr>
                  </table>
                  <div class="text-center">
                     <button id="mbut">
                        -<strong id="price"></strong>p                      
                     </button>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div> 
<!-- Footer -->
<jsp:include page="footer.jsp" flush="false" />