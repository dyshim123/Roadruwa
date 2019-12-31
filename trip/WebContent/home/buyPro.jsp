<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="trip.board.BoardDB"%>
<%@ page import="trip.board.BoardDataBean"%>
<%@ page import="trip.buy.BuyDBBean"%>
<%@ page import="trip.buy.BuyDataBean"%>
<%@ page import="trip.point.PointDataBean"%>
<%@ page import="trip.point.PointDBBean"%>
<%@ page import = "java.util.List" %>
<%
   request.setCharacterEncoding("utf-8");

   int b_num = Integer.parseInt(request.getParameter("b_num"));
   String buyer = (String)session.getAttribute("u_id");
   
   BoardDB Process = BoardDB.getInstance();
   BoardDataBean board = Process.getArticle(b_num);
   
   PointDBBean point = PointDBBean.getInstance();
   int nowpoint = point.Nowpoint(buyer);
   int Snowpoint = point.Snowpoint(board.getU_id());
   //nowpoint가 board의 b_price보다 작을경우에는 못사게 함
   if(nowpoint>=board.getB_price()){
      BuyDBBean dbPro = BuyDBBean.getInstance();
      dbPro.insertBuy(board,b_num,buyer,nowpoint,Snowpoint);
      response.sendRedirect("content.jsp?b_num=" + b_num);
   }else{
      out.println("<script>alert('포인트가 부족합니다.');location.href='mp_point.jsp';</script>");//포인트가 부족합니다 띄우기
      //response.sendRedirect("mp_point.jsp");
   }
%>