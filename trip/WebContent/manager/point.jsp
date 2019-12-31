<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="trip.point.PointDataBean"%>
<%@ page import="trip.point.PointDBBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<jsp:include page="mheader.jsp" flush="false" />

<%
   request.setCharacterEncoding("utf-8");
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
   
   String sk = request.getParameter("sk");
    String sv = request.getParameter("sv");

   List<PointDataBean> pointLists = null;
   PointDataBean pointBean = null;
   PointDBBean point = PointDBBean.getInstance();
   int count = point.getPointCount();
   if (count > 0) {
      pointLists = point.getAllPoints(sk,sv);
   }
    
   //검색값 유지
   if(session.getAttribute("sv") != null) {
      sv = (String)session.getAttribute("sv");
   }else if(sv== null) {
      sv="";
   }
%>
<script>  //검색 select값유지
window.onload = function(){
    $("select option[value=<%=sk%>]").attr("selected", true);
}
</script>
<div id="wrapper">
   <div id="main">
      <div class="inner">
         <div class="row">
            <header class="majorr">
               <br>
               <h2>포인트관리테이블</h2>
            </header>
            <form action="point.jsp" method="post" class="divo">
            <div class="row justify-content-md-center">

                <select name="sk" id="sk" class="form-control col-md-2">
                    <option value="전체">전체</option>
                    <option value="내역">내역</option>
                    <option value="아이디">아이디</option>
                </select>
                <input type="text" name="sv" class="form-control col-md-4" value=<%=sv %>>
                <input type="submit" value="검색" id="but">
                </div>
            </form>  

            <table class="table">
               <colgroup>
                  <col width="8%">
                  <col width="12%">
                  <col width="17%">
                  <col width="*">
                  <col width="14%">
                  <col width="14%">
               </colgroup>
               <thead>
                  <tr>
                     <th scope="col">번호</th>
                     <th scope="col">아이디</th>
                     <th scope="col">날짜</th>
                     <th scope="col">내역</th>
                     <th scope="col">거래포인트</th>
                     <th scope="col">잔여포인트</th>
                  </tr>
               </thead>
               <tbody class="tbo1">
                  <%
                     for (int i = 0; i < pointLists.size(); i++) {
                        pointBean = (PointDataBean) pointLists.get(i);
                  %>
                  <tr>
                     <td><%=i + 1%></td>
                     <td><%=pointBean.getU_id()%></td>
                     <td><%=sdf.format(pointBean.getReg_date())%></td>
                     <td><%=pointBean.getContent()%></td>
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
   </div>
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
   <jsp:include page="mfooter.jsp" flush="false" />