<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "trip.comment.CommentDBBean" %>
<%@ page import = "trip.comment.CommentDataBean" %>
<%@ page import = "trip.board.BoardDataBean" %>

<% request.setCharacterEncoding("utf-8");%>

<%
   int c_num = Integer.parseInt(request.getParameter("c_num"));
   int b_num = Integer.parseInt(request.getParameter("b_num"));
 
   CommentDBBean dbpro = CommentDBBean.getInstance();
   dbpro.delete(c_num); 

  response.sendRedirect("content.jsp?b_num="+b_num);
%>