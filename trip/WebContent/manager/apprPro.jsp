<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="trip.board.BoardDB"%>
<%@ page import="trip.board.BoardDataBean"%>
<%@ page import = "java.util.List" %>
<%
	request.setCharacterEncoding("utf-8");

	int b_num = Integer.parseInt(request.getParameter("b_num"));
	
	BoardDB Process = BoardDB.getInstance();
	Process.apprBoard(b_num);
	
	out.println("<script>alert('승인처리 되었습니다.');location.href='product1.jsp';</script>");
%>
