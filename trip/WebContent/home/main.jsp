<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="trip.buy.BuyDBBean"%>
<%@ page import="trip.buy.BuyDataBean"%>
<%@ page import="trip.board.BoardDataBean"%>
<%@ page import="trip.board.BoardDB"%>
<%@ page import="java.util.*"%>
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/message.css" />
<link rel="stylesheet" href="assets/css/detail.css" />
<link rel="stylesheet" href="assets/css/circleimage.css" />
<jsp:include page="header.jsp" flush="false" />
<%
   request.setCharacterEncoding("utf-8");

   String lotation = request.getParameter("lotation");
   String cost = request.getParameter("cost");
   String trans = request.getParameter("trans");
   String tema = request.getParameter("tema");
   String day = request.getParameter("day");
   String search = request.getParameter("search");

   List<BoardDataBean> modalLists = null;
   List<BoardDataBean> modalPopLists = null;
   BoardDataBean modalBean = null;
   BoardDB modal = BoardDB.getInstance();

   int count = modal.getBoardCount();
   modalBean = modal.ModalInfo();
   
   if (count > 0) {
         modalLists = modal.getModals(lotation, day, cost, trans, tema, search);
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
.txt_line1 { 
   text-align:center;
       font-size: 23;
   
}
</style>
<div id="carouselExampleIndicators" class="carousel slide"
   data-ride="carousel">
   <ol class="carousel-indicators">
      <li data-target="#carouselExampleIndicators" data-slide-to="0"
         class="active"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
   </ol>

   <div class="carousel-inner ci">
      <div class="carousel-item active">
         <div class="bannerimg ba">
            <div class="content">
               <h5>BEST</h5>
               <h1>ROADRUWA 인기코스</h1>
               <h6>생생한 후기가 넘쳐나는 코스를 한눈에</h6><br>
               <button onclick = "location.href = 'popularity.jsp'">자세히 보기</button>
            </div>
            <div class="img-cover"></div>
         </div>
      </div>
      <div class="carousel-item">
         <div class="bannerimg ba1">
            <div class="content">
               <h5>THEMA</h5>
               <h1>추운 겨울엔 호캉스!</h1>
               <h6>다가오는 겨울! 힘든 일정 대신 호캉스가 대세</h6><br>
               <button onclick = "location.href = 'detail.jsp?lotation=&day=&trans=&cost=&tema=호캉스&search='">자세히 보기</button>
            </div>
            <div class="img-cover"></div>
         </div>
      </div>
      <div class="carousel-item">
         <div class="bannerimg ba2">
            <div class="content">
               <h5>#제주</h5>
               <h1>제주 같이 갈래요?</h1>
               <h6>낭만적인 제주 여행으로 힐링하자</h6><br>
               <button onclick = "location.href = 'detail.jsp?lotation=제주&day=&trans=&cost=&tema=&search='">자세히 보기</button>
            </div>
            <div class="img-cover"></div>
         </div>
      </div>
   </div>

   <a class="carousel-control-prev" href="#carouselExampleIndicators"
      role="button" data-slide="prev"> <span
      class="carousel-control-prev-icon" aria-hidden="true"></span> <span
      class="sr-only">Previous</span>
   </a> <a class="carousel-control-next" href="#carouselExampleIndicators"
      role="button" data-slide="next"> <span
      class="carousel-control-next-icon" aria-hidden="true"></span> <span
      class="sr-only">Next</span>
   </a>
</div>
<br>
<br>
<br>
<br>
<form class="search-container" id="checks" action="detail.jsp"
   method="get">
   <input type="hidden" name="lotation" value="" /> <input type="hidden"
      name="day" value="" /> <input type="hidden" name="trans" value="" />
   <input type="hidden" name="cost" value="" /> <input type="hidden"
      name="tema" value="" /> <input type="text" id="text" name="search"
      placeholder="&#xf002; search "
      style="text-align: left; margin-left: 35px;">
</form>
<br>
<br>

<table class="tables" id="check" border="1">
   <tr>
      <td><h5>지역:</h5></td>
      <td>
         <div class="sel sel--black-panther">
            <select name="lotation" id="lotation">
               <option value="">전체</option>
               <option value="서울">서울</option>
               <option value="경기/인천">경기/인천</option>
               <option value="충청">충청</option>
               <option value="전라">전라</option>
               <option value="경상">경상</option>
               <option value="부산">부산</option>
               <option value="제주">제주</option>
            </select>
         </div>
      </td>
      <td></td>
      <td><h5>여행일수:</h5></td>
      <td><div class="sel sel--black-panther">
            <select name="day" id="day">
               <option value="">전체</option>
               <option value="1">1일 이하</option>
               <option value="2">2일</option>
               <option value="3">3일</option>
               <option value="4">4일</option>
               <option value="5">5일 이상</option>
            </select>
         </div></td>

      <td><h5>교통:</h5></td>
      <td><div class="sel sel--black-panther">
            <select name="trans" id="trans">
               <option value="">전체</option>
               <option value="자동차">자동차</option>
               <option value="대중교통">대중교통</option>
               <option value="기타">기타</option>
            </select>
         </div></td>

      <td><h5>경비:</h5></td>
      <td>

         <div class="sel sel--black-panther">
            <select name="cost" id="cost">
               <option value="">전체</option>
               <option value="10만원미만">10만원 미만</option>
               <option value="20만원미만">20만원 미만</option>
               <option value="20만원 이상">20만원 이상</option>
            </select>
         </div>
      </td>

      <td><h5>테마:</h5></td>
      <td>
         <div class="sel sel--black-panther">
            <select name="tema" id="tema">
               <option value="">전체</option>
               <option value="먹방">먹방</option>
               <option value="관광지">관광지</option>
               <option value="문화재/역사">문화재/역사</option>
               <option value="호캉스">호캉스</option>
               <option value="액티비티">액티비티</option>
            </select>
         </div>
      </td>
      <td>
         <div class="wrap">
            <button onclick="search()" class="button" id="m_td">검색</button>
         </div>
      </td>
   </tr>
</table>

<script>
   window.onload = function reset(){//실행시 값 초기화
      $("#tema option:first").attr('selected','selected');
      $("#lotation option:first").attr('selected','selected');
      $("#cost option:first").attr('selected','selected');
      $("#day option:first").attr('selected','selected');
      $("#trans option:first").attr('selected','selected');
   }

   function search() {
      var lotation = document.getElementById("lotation").value;
      var cost = document.getElementById("cost").value;
      var day = document.getElementById("day").value;
      var trans = document.getElementById("trans").value;
      var tema = document.getElementById("tema").value;
      var search = document.getElementById("text").value;

      location.href = "detail.jsp?lotation=" + lotation + "&day=" + day
            + "&trans=" + trans + "&cost=" + cost + "&tema=" + tema
            + "&search=" + search;
   }
</script>

<br>
<br>
<hr>
<div class="row justify-content-center">
   <div class="col-3">
      <h4>최근 등록된 글</h4>
   </div>
   <div class="col-3"></div>
   <div class="col-3">
      <h5 class="a">
         <a href="detail.jsp?lotation=&day=&trans=&cost=&tema=&search=">더보기></a>
      </h5>
   </div>
</div>
<div class="row justify-content-center">
   <%
         for (int i = 0; i < 3; i++) {
            modalBean = (BoardDataBean) modalLists.get(i);

      %>
      <div class="col-3 col-8-narrower" id="js-load">
         <section class="box special" data-toggle="modal"
                     data-target="#mainModal"
                     onclick="show('<%=modalBean.getB_title()%>',
                     '<%=modalBean.getB_cate()%>','<%=modalBean.getU_id()%>','<%=modalBean.getB_day1()%>',
                     '<%=modalBean.getB_day2()%>','<%=modalBean.getB_ac()%>','<%=modalBean.getB_pic1()%>',
                     '<%=modalBean.getB_pic2()%>','<%=modalBean.getB_pic3()%>','<%=modalBean.getB_price()%>'
                     ,'<%=modalBean.getB_lo()%>','<%=modalBean.getB_num()%>')">
            <span class="image featured"><img
               src="/uploadFile/<%=modalBean.getB_pic1()%>" alt="" class="mip" /></span>
            <div class="txt_line1"><%=modalBean.getB_title()%></div>
         </section>

         <br>
      </div>
      <%
         }
      %>
      <br>
</div>
<br>
<hr>
<div class="row justify-content-center">
   <div class="col-3">
      <h4>인기코스</h4>
   </div>
   <div class="col-3"></div>
   <div class="col-3">
      <h5 class="a">
         <a href="popularity.jsp">더보기></a>
      </h5>
   </div>
</div>
<div class="row justify-content-center">
<%
         for (int j = 0; j < 3; j++) {
            modalBean = (BoardDataBean) modalPopLists.get(j);

      %>
      <div class="col-3 col-8-narrower" id="js-load">
         <section class="box special" data-toggle="modal"
                     data-target="#mainModal"
                     onclick="show('<%=modalBean.getB_title()%>',
                     '<%=modalBean.getB_cate()%>','<%=modalBean.getU_id()%>','<%=modalBean.getB_day1()%>',
                     '<%=modalBean.getB_day2()%>','<%=modalBean.getB_ac()%>','<%=modalBean.getB_pic1()%>',
                     '<%=modalBean.getB_pic2()%>','<%=modalBean.getB_pic3()%>','<%=modalBean.getB_price()%>'
                     ,'<%=modalBean.getB_lo()%>','<%=modalBean.getB_num()%>')">
            <span class="image featured"><img
               src="/uploadFile/<%=modalBean.getB_pic1()%>" alt="" class="mip" /></span>
            <div class="txt_line1"><%=modalBean.getB_title()%></div>
         </section>

         <br>
      </div>
      <%
         }
      %>
      <br>
</div>
<br>
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
      <div class="modal-content mc1">
         <div class="modal-body mb1">
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
                           <h6>글쓴이</h6><br>
                           <h3>
                              <strong id="id"></strong>
                           </h3></td>
                        <td class="mota"><img src="images/hour.png" id="mpicto">
                           <h6>예상일수</h6><br>
                           <h3>
                              <strong id="day1"></strong>박 <strong id="day2"></strong>일
                           </h3></td>

                        <td class="mota"><img src="images/won.png" id="mpicto">
                           <h6>예상금액</h6><br>
                           <h3>
                              <strong id="ac"></strong>원
                           </h3></td>
                        <td class="mota"><img src="images/world.png" id="mpicto">
                           <h6>지역</h6><br>
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
<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
<script src="assets/js/select.js"></script>
<script src="assets/js/search.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="assets/bootstrap-4.1.0/js/bootstrap.min.js"></script>

<jsp:include page="footer.jsp" flush="false" />