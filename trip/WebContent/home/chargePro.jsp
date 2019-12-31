<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="trip.buy.BuyDBBean"%>
<%@ page import="trip.buy.BuyDataBean"%>
<%@ page import="trip.point.PointDataBean"%>
<%@ page import="trip.point.PointDBBean"%>
<%@ page import="java.util.List"%>
<%
   request.setCharacterEncoding("utf-8");

   int charge = Integer.parseInt(request.getParameter("charge"));
   String buyer = (String) session.getAttribute("u_id");

   PointDBBean point = PointDBBean.getInstance();
   int nowpoint = point.Nowpoint(buyer);

   PointDBBean dbPro = PointDBBean.getInstance();
   dbPro.insertCharge(buyer, nowpoint, charge);
   response.sendRedirect("mp_point.jsp");
%>