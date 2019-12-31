<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" flush="false" />
<%@ page import="trip.board.BoardDataBean"%>
<%@ page import="trip.board.BoardDB"%>
<%@ page import="trip.buy.BuyDBBean"%>
<%@ page import="trip.buy.BuyDataBean"%>
<%@ page import="java.util.*"%>
<link rel="stylesheet" href="assets/css/detail.css" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/message.css" />
<link rel="stylesheet" href="assets/css/circleimage.css" />
<link href="https://unpkg.com/ionicons@4.4.4/dist/css/ionicons.min.css"
   rel="stylesheet">
<%
   request.setCharacterEncoding("utf-8");

   String lotation = request.getParameter("lotation");
   String cost = request.getParameter("cost");
   String trans = request.getParameter("trans");
   String tema = request.getParameter("tema");
   String day = request.getParameter("day");
   String search = request.getParameter("search");
   
   List<BoardDataBean> modalLists = null;
   BoardDataBean modalBean = null;
   BoardDataBean modalBean1 = null;
   BoardDB modal = BoardDB.getInstance();

   int count = modal.getBoardCount();
   modalBean = modal.ModalInfo();
   if (count > 0) {
      modalLists = modal.getModals(lotation, day, cost, trans, tema, search);
   }

   String u_id = null;
   if (session.getAttribute("u_id") != null) {
      u_id = (String) session.getAttribute("u_id");
   }
   
   //검색시 value
   String searchv="";
   if(search.equals("")){
      searchv="";
   }else{
      searchv=search;
   }
   
   
    List<BuyDataBean> buyLists = null;
    BuyDBBean buy = BuyDBBean.getInstance();
    buyLists = buy.getBuys(u_id);
    BuyDataBean buyBean = null;


%>
<div class="imgg_c">
   <div class="imgg">
      <br>
      <form class="search-container" id="checks" action="detail.jsp" method="get">
         <input type="hidden" name="lotation" value="<%=lotation %>" /> <input
            type="hidden" name="day" value="<%=day %>" /> <input type="hidden"
            name="trans" value="<%=trans %>" /> <input type="hidden" name="cost" value="<%=cost%>" />
         <input type="hidden" name="tema" value="<%=tema%>" /> <input type="search"
            id="text" name="search" placeholder="search" value=<%=searchv %> >
      </form> 

      <script type="text/javascript">
            //search값 유지
            if(session.getAttribute("search") != null) {
               search = (String)session.getAttribute("search");
            }
            <%
            if (lotation.equals("")) {
               lotation = "전체";
            }
            if (day.equals("")) {
               day = "전체";
            }
            if (trans.equals("")) {
               trans = "전체";
            }
            if (cost.equals("")) {
               cost = "전체";
            }
            if (tema.equals("")) {
               tema = "전체";
            }
         %> 
      </script>
      <table class="tabless" id="check">
         <tr>
            <td id="dd"><h5>지역:</h5></td>
            <td>
               <div class="sels sel--black-panther">
               <script>  //말머리 select값유지
               $(document).ready(function(){
                   $("select option[value=<%=lotation%>]").attr("selected", true);
                   $("select option[value=<%=day%>]").attr("selected", true);
                   $("select option[value=<%=trans%>]").attr("selected", true);
                   $("select option[value=<%=cost%>]").attr("selected", true);
                   $("select option[value=<%=tema%>]").attr("selected", true);
               });
               </script>
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
            <td><div class="sels sel--black-panther">
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
            <td><div class="sels sel--black-panther">
                  <select name="trans" id="trans">
                     <option value="">전체</option>
                     <option value="자동차">자동차</option>
                     <option value="대중교통">대중교통</option>
                     <option value="기타">기타</option>
                  </select>
               </div></td>

            <td><h5>경비:</h5></td>
            <td>

               <div class="sels sel--black-panther">
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
               <div class="sels sel--black-panther">
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
               <div class="bt14">
                  <input type="button" value="검색" onclick="search()">
               </div>
            </td>
         </tr>
      </table>

   </div>
</div>
<br>
<br>

<script>
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
<div class="b_container">
   <div class="row">   
      <%
         for (int i = 0; i < modalLists.size(); i++) {
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
            <div class="txt_line">[<%=modalBean.getB_cate()%>]<%=modalBean.getB_title()%></div>
         </section>

         <br>
      </div>
      <%
         }
      %>
      <br>
   </div>
   <br>
</div>
<br><br><br><br>
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