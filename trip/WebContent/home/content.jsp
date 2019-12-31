<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="sessionCheckPro.jsp"%>
<link rel="stylesheet" href="assets/css/content.css" />
<link rel="stylesheet" href="assets/css/writeForm.css" />
<%@ page import="trip.board.BoardDB"%>
<%@ page import="trip.board.BoardDataBean"%>
<%@ page import="trip.board.BoardDayBean"%>
<%@ page import="trip.comment.CommentDBBean"%>
<%@ page import="trip.comment.CommentDataBean"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.List"%>

<jsp:include page="header.jsp" flush="false" />
<style>
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
<%
   request.setCharacterEncoding("utf-8");
   String c_num = request.getParameter("c_num");
   String b_num = request.getParameter("b_num");
   BoardDataBean article = null;
   try {
      BoardDB dbPro = BoardDB.getInstance();
      int bNum = Integer.parseInt(b_num);
      article = dbPro.getArticle(bNum);
      List<BoardDayBean> dayBean = dbPro.getdayArticle(bNum);
      CommentDBBean CdbPro = CommentDBBean.getInstance();
      CommentDataBean cmtdto = CdbPro.getArticle(c_num);
      List<CommentDataBean> CarticleList = CdbPro.getArticles(b_num);
      
      double averStar = CdbPro.getStarcount(b_num);
     String format = "#.##";//소수점 둘째자리까지 나오게 포맷
     java.text.DecimalFormat df = new java.text.DecimalFormat(format);
%>

<div class="container" style="max-width: 1540px;">
   <div class="out">
      <div class="row">
         <div class="col-8">
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
                     <img class="bgi" src="/uploadFile/<%=article.getB_pic1()%>"
                        alt="First slide">
                  </div>
                  <div class="carousel-item">
                     <img class="bgi" src="/uploadFile/<%=article.getB_pic2()%>"
                        alt="Second slide">
                  </div>
                  <div class="carousel-item">
                     <img class="bgi" src="/uploadFile/<%=article.getB_pic3()%>"
                        alt="Third slide">
                  </div>
               </div>
               <a class="carousel-control-prev" href="#carouselExampleIndicators"
                  role="button" data-slide="prev"> <span
                  class="carousel-control-prev-icon" aria-hidden="true"></span> <span
                  class="sr-only">Previous</span></a> <a class="carousel-control-next"
                  href="#carouselExampleIndicators" role="button" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
               </a>
            </div>
         </div>
         <div class="col-4">
            <div class="card">
               <div class="card-body"
                  style="padding-bottom: 4.01rem; height: 443px;">
                  <div id="tma">
                     <div class="row" style="padding-left: 30px;">
                        <h3 style="font-weight: bold; padding-bottom: 0px;">
                           [<%=article.getB_cate()%>]
                        </h3>
                        &nbsp;&nbsp;
                        <h3><%=article.getB_title()%></h3>
                     </div>
                     <div class="row" style="padding-left: 15px; padding-right: 15px;">
                        <div class="col-md-7">
                           <h5>
                              <a class="a" data-toggle="modal" data-target="#exampleModal"><b><%=article.getU_id()%></b>&nbsp;&nbsp;
                                 <img src="images/message.png" width="30px"></a>
                           </h5>
                        </div>
                        <div class="col-md-5" align="right">
                         
                              <div class="stco"><h4>★   <%=df.format(averStar)%></h4></div>
 
                        </div>
                     </div>
                     <hr>
                     <br>
                     <div class="row" style="padding-left: 15px; padding-right: 15px;">
                        <div class="col-md-7">
                           <h5>
                              <b>여행지역</b>
                           </h5>
                        </div>
                        <div class="col-md-5" align="right">
                           <div>
                              <h5><%=article.getB_lo()%></h5>
                           </div>
                        </div>
                     </div>
                     <div class="row" style="padding-left: 15px; padding-right: 15px;">
                        <div class="col-md-7">
                           <h5>
                              <b>교통수단</b>
                           </h5>
                        </div>
                        <div class="col-md-5" align="right">
                           <h5><%=article.getB_tr()%></h5>
                        </div>
                     </div>
                     <div class="row" style="padding-left: 15px; padding-right: 15px;">
                        <div class="col-md-7">
                           <h5>
                              <b>예상일수</b>
                           </h5>
                        </div>
                        <div class="col-md-5" align="right">
                           <h5><%=article.getB_day1()%>박
                              <%=article.getB_day2()%>일
                              <%
                  if (article.getB_one() == null) {
               %>

                              <%
                     } else {
                  %>
                              <%=article.getB_one()%>
                              <%
                     }
                  %>
                           </h5>
                        </div>
                     </div>
                     <div class="row" style="padding-left: 15px; padding-right: 15px;">
                        <div class="col-md-7">
                           <h3 style="font-weight: bold;">예상경비</h3>
                        </div>
                        <div align="right" class="col-md-5">
                           <h3 style="font-weight: bold; color: #2c96ed;"><%=article.getB_ac()%>원
                           </h3>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <br>
         <hr>
      </div>
   </div>
   <script type="text/javascript">
   function sendMsg() {
      var form_data = new FormData();
      form_data.append("b_num","<%=bNum%>");
      form_data.append("m_content", $("#m_content").val());
      form_data.append("m_sid", $("#m_sid").val());
      form_data.append("s_id", $("#s_id").val());
      
      $.ajax({
          data: form_data,
           type: "POST",
           url: 'messagePro.jsp',
           cache: false,
           contentType: false,
           processData: false,         
          success: function(url) {
             location.href="mp_message.jsp"; 
          },
         error: function(request, status, error){
         alert("메시지 전송을 실패하였습니다.");

         }
      });
      return false;
   }
</script>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content" >
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">쪽지 보내기</h5>
               <button type="button" class="close" data-dismiss="modal"aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form id="contact-us" onsubmit="return false;">
                  <div class="col-xs-6 wow animated slideInLeft" data-wow-delay=".5s">
                    <table>
                          <tr><td>
                     <input type="text" name="m_sid" id="m_sid" required="required" class="s_form s_form-input" placeholder="제목을 입력하세요"
                     style="border-radius: 6px; border: solid 1px #e5e5e5; margin-bottom:20px;padding-left:20px;width: 50%;height:40px;" /></td>
                     <td><input type="text" name="s_id" id="s_id" class="s_form s_form-input" value="<%=article.getU_id()%>"
                     style="margin-left: -90px; margin-top:-20px; width:100px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" readonly/></td></tr>
                     <tr><td><textarea name="m_content" id="m_content" class="s_form s_textarea" placeholder="내용을 입럭하세요"
                       style="border-radius: 6px; border: solid 1px #e5e5e5; width:460px;height:200px;"></textarea></td></tr></table><br>
                     <input type="hidden" name="u_id" id="u_id" class="s_form s_form-input" />
                     <button type="submit" id="submit" name="submit" onclick="sendMsg();" class="s_form-btn semibold"
                     style="border-radius: 5px; border:1px solid #2C96ED;">보내기</button>
                     
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div><br><br>
<!-- 지도 -->
<div class="out" id="map"
   style="width: 1510px; height: 460px; margin-left: 197px;">
   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fd6857e52f9e9cc4d68b949a22e061d1&libraries=services"></script>
   <script>
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
            mapOption = { 
                center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
            
            var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
        </script>
   <script type="text/javascript">
function setPosMap(addr, nday){
   // 주소-좌표 변환 객체를 생성합니다
   var geocoder = new daum.maps.services.Geocoder();

   geocoder.addressSearch(addr, function(result, status) {

       // 정상적으로 검색이 완료됐으면 
        if (status === daum.maps.services.Status.OK) {

           var coords = new daum.maps.LatLng(result[0].y, result[0].x);

           // 결과값으로 받은 위치를 마커로 표시합니다
           var marker = new daum.maps.Marker({
               map: map,
               position: coords
           });

           // 인포윈도우로 장소에 대한 설명을 표시합니다
           var infowindow = new daum.maps.InfoWindow({
               content: '<div style="width:150px;text-align:center;padding:6px 0;">'+nday+'박 여행지</div>'
           });
           infowindow.open(map, marker);

           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
           map.setCenter(coords);
       } 
   });    
}
</script>
</div>

<section class="design-process-section" id="process-tab">
   <div class="container">
      <div class="row">
         <div class="col-xs-12">
            <ul class="nav process-model more-icon-preocess " role="tablist" style="padding-left:190px;flex-wrap: inherit;">
            <%for(int n=0; n<article.getB_day2();n++){ %>
               <li role="presentation" class="active" style="padding-top:30px;">
               <a href="#discover" aria-controls="discover" role="tab" data-toggle="tab"><i aria-hidden="true" onclick="show_hide(<%=n%>)"><%=n+1%>일차</i></a></li>
            <%} %>
            </ul>
        <script type="text/javascript">
            function show_hide(idx){
               var div_id = 'strategy';
               
               for(var k=0; k < <%=article.getB_day2()%>; k++){
                  if(idx == (k)){
                     $('#strategy'+k).css('display', '');
                  }else{
                     $('#strategy'+k).css('display', 'none');
                  }
               }
               
               var addr = $('#addr'+idx).val();
               setPosMap(addr, (idx+1)+'');
            }
           </script>
            <div class="tab-content">
                         <div role="tabpanel" class="tab-pane active" id="discover">
                             <%for(int n=0; n<article.getB_day2();n++){ %>
                             <div role="tabpanel" class="tab-pane" id="strategy<%=n%>" style="display: none;">
                                <h3 class="semi-bold" style="margin-left:-160px; margin-top:30px;"><%=n+1%>일차 &nbsp; (주소: <%=dayBean.get(n).getB_post()%>) </h3>
                                <input type="hidden" id="addr<%=n%>" value="<%=dayBean.get(n).getB_post()%>">
                                <div class="design-process-content" style="padding-left:35px; padding-top:35px; padding-bottom:70px; width:1509px; margin-left:-177px; height:auto;">
                                <img src="images/trav.png" style="max-width: 400px; max-height: 80px; margin-right: 95px; margin-left: 190px;"> 
                        <img src="images/food.png" style="max-width: 400px; max-height: 80px; margin-right: 95px; margin-left: 130px;">
                        <img src="images/trans.png" style="max-width: 400px; max-height: 82px; margin-right: 95px; margin-left:130px;">
                         <img src="images/stay.png" style="max-width: 400px; max-height: 80px; margin-right: 95px; margin-left: 150px;">
                           <div class="form-group row">
                           <h4><label for="b_trav" class="col-sm-3 col-form-label" style="max-width: 81%; margin-left:138px; margin-right: 41px;">
                                           여행비: &nbsp;<%=dayBean.get(n).getB_trav()%>원</label></h4>
                           <h4><label for="b_food" class="col-sm-3 col-form-label" style="max-width: 81%; margin-left:70px; margin-right: 41px;">
                               식비: &nbsp;<%=dayBean.get(n).getB_food()%>원</label></h4> 
                          <h4><label for="b_trans" class="col-sm-3 col-form-label" style="max-width: 81%; margin-left:70px; margin-right: 41px;">
                              교통비: &nbsp;<%=dayBean.get(n).getB_trans()%>원</label></h4> 
                          <h4><label for="b_stay" class="col-sm-3 col-form-label" style="max-width: 81%; margin-left:107px; margin-right: 41px;">
                              숙박비: &nbsp;<%=dayBean.get(n).getB_stay()%>원</label></h4><br><br><br><br>
                           </div>
                         <%=dayBean.get(n).getB_cont()%>
                         </div>
                             </div>
                             <%} %>
                        </div>
                   </div>
             </div>
       </div>
   </div>
</section>
<br>
<div class="row butt1">
<div class="col-md-6" style="margin-left:10px;">
<button id="br" class="butt"style="float: center; padding:0.7em;" onclick= "location.href = 'detail.jsp?&lotation=&day=&trans=&cost=&tema=&search='">목록보기</button>
</div>
</div>
<br><br>
<hr>
<!-- 후기 -->

<form method="post" action="contentPro.jsp?b_num=<%=b_num%>" enctype="multipart/form-data">
<input type="hidden" name="u_id" value="<%=session.getAttribute("u_id")%>"> 
<input type="hidden" name="b_num" value="<%=b_num%>"> 
<input type="hidden" name="c_id" value="<%=session.getAttribute("u_id")%>">
   <div class="container">
      <h3>
         <b>후기 (<%=CarticleList.size()%>)</b>
      </h3>
      <div class="stco"><h4>★   <%=df.format(averStar)%></h4></div>
      <%
         if (!u_id.equals(article.getU_id())) {//내가 작성한 글은 후기못쓰게
      %>
      <div>
         <h2><%=session.getAttribute("u_id")%>
            <span class="star"> <span class="input"> <input
                  type="radio" name="star" value="1" id="p1"> <label
                  for="p1">1</label> <input type="radio" name="star" value="2"
                  id="p2"> <label for="p2">2</label> <input type="radio"
                  name="star" value="3" id="p3"> <label for="p3">3</label> <input
                  type="radio" name="star" value="4" id="p4"> <label
                  for="p4">4</label> <input type="radio" name="star" value="5"
                  id="p5" checked="checked"> <label for="p5">5</label>
            </span>
            </span>
         </h2>
      </div>
      <textarea name="c_content" required="required"></textarea>
      <br>
      <div class="form-group">
         <input type="file" name="c_pic" id="file" class="input-file">
         <label for="file" class="btn btn-tertiary js-labelFile"> <i
            class="fa fa-camera"></i> <span class="js-fileName">사진추가</span>
         </label>
      </div>
      <button type="submit" id="br">등록</button>
      <%
         }
      %>

      <br> <br> <br>
      <%
         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

            if (CarticleList.size() == 0) {
      %>
      <div>댓글이 없습니다.</div>
      <%
         }
            for (int i = 0; i < CarticleList.size(); i++) {
               CommentDataBean Carticle = CarticleList.get(i);
      %>
<div id="conid<%=Carticle.getC_num()%>">
      <div class="stco1">
         <h4><%=Carticle.getC_id()%></h4>
      </div>
      <div class="stco"><%if(Carticle.getStar().equals("5")){%>
      ★★★★★
      <%}else if(Carticle.getStar().equals("4")){%>★★★★☆<%}else if(Carticle.getStar().equals("3")){%>★★★☆☆<%}
      else if(Carticle.getStar().equals("2")){%>★★☆☆☆<%}
      else{%>★☆☆☆☆<%}%></div>
      <br>
      <div class="stco2"><%=sdf.format(Carticle.getC_reg())%></div>
      <br>
      <div id="cc<%=Carticle.getC_num()%>">
         <h4><%=Carticle.getC_content()%></h4>
      </div><br><br>
      <%if(Carticle.getC_pic()==null){
         
      }else{ %>
      <img class="cimg" src="/uploadFile/<%=Carticle.getC_pic()%>" alt="">         
      <%
      }%></div><%
      if (session.getAttribute("u_id").equals(Carticle.getC_id())) {
   %>
   <div id="cc1">
   <input type="button" class="btn btn-link" value="수정"
      onclick="upda(<%=Carticle.getC_num()%>,<%=article.getB_num()%>);">
      <input type="button" class="btn btn-link" value="삭제" 
      onclick="dell(<%=Carticle.getC_num()%>,<%=article.getB_num()%>);">
   </div>
   <div id="in<%=Carticle.getC_num()%>"></div>
   
      <%
         }
      %>
   <br>

   <div id="line"></div>

      <%
         }
      %>
</div>

</form>

<%
   } catch (Exception e) {
      out.print(b_num);
   }
%>
<br><br><br>
<script>
$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {

    var href = $(e.target).attr('href');
    var $curr = $(".process-model  a[href='" + href + "']").parent();

    $('.process-model li').removeClass();

    $curr.addClass("active");
    $curr.prevAll().addClass("visited");
});
//end  script for tab steps
function dell(c_num,b_num){
   if (confirm("정말 삭제하시겠습니까??") == true){    //확인
      location.href ="cdelete.jsp?c_num="+c_num+"&b_num="+b_num;
   }else{   //취소
       return;
   }
}

show_hide(0);

var c="";
var b="";
function upda(c_num,b_num){
   c=c_num;b=b_num;
   document.getElementById("in"+c_num).innerHTML = "" ;
   var append =  $("#upda").html(); 
   $("#in"+c_num).append(append);
      
   var str =document.getElementById("cc"+c_num).innerHTML;
   var string1=str.substring(14,str.length-12);
   document.getElementById("tete1").value=string1;
   $("#conid"+c_num).hide();//수정버튼눌렀을때 기존 댓글 숨기기
}

function fg(){
   $("#frmSubmit").attr("action", "cupdate.jsp?b_num="+b+"&c_num="+c);
}
</script>
<div id="upda">
<form method="post" id="frmSubmit" enctype="multipart/form-data">
      <div>
         <h2><%=session.getAttribute("u_id")%>
            <span class="star1"> <span class="input"> <input
                  type="radio" name="star1" value="1" id="p11"> <label
                  for="p11">1</label> <input type="radio" name="star1" value="2"
                  id="p21"> <label for="p21">2</label> <input type="radio"
                  name="star1" value="3" id="p31"> <label for="p31">3</label>
                  <input type="radio" name="star1" value="4" id="p41"> <label
                  for="p41">4</label> <input type="radio" name="star1" value="5"
                  id="p51" checked="checked"> <label for="p51">5</label>
            </span>
            </span>
         </h2>
      </div>
      <textarea name="text" id="tete1" required="required"></textarea>
      <div class="form-group">
         <input type="file" name="c_pic1" id="file1" class="input-file1">
         <label for="file1" class="btn btn-tertiary js-labelFile"> <i
            class="fa fa-camera"></i> <span class="js-fileName1">사진추가</span>
         </label>
      </div>
      <div id="cc1">
      <button type="submit" onclick="fg();" id="br">수정</button>
      </div>
</form>
</div>   
<script src="assets/js/star1.js"></script>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/star.js"></script>
<script src="assets/bootstrap-4.1.0/js/bootstrap.min.js"></script>
<jsp:include page="footer.jsp" flush="false" />