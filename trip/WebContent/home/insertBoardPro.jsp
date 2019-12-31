
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="trip.board.BoardDB"%>
<%@ page import="trip.board.BoardDataBean"%>
<%@ page import="trip.board.BoardDayBean"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>Board Insert Process</title>
</head>

<jsp:useBean id="board" class="trip.board.BoardDataBean" />

<body>
	<%
		String uploadPath = "/home/dadang/www/uploadFile";

		int maxSize = 1024 * 1024 * 10; // 한번에 올릴 수 있는 파일 용량 : 10M로 제한

		String fileName1 = ""; // 중복처리된 이름
		String originalName1 = ""; // 중복 처리전 실제 원본 이름
		long fileSize = 0; // 파일 사이즈
		String fileType = ""; // 파일 타입

		MultipartRequest multi = null;
		
		String u_id = (String) session.getAttribute("u_id");

		try {
			// request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
			multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
			

			String b_title = multi.getParameter("b_title");
			String b_pic1 = multi.getFilesystemName("b_pic1");
			String b_pic2 = multi.getFilesystemName("b_pic2");
			String b_pic3 = multi.getFilesystemName("b_pic3");
			String b_cate = multi.getParameter("b_cate");
			String b_lo = multi.getParameter("b_lo");
			String b_tr = multi.getParameter("b_tr");
			String b_day1 = multi.getParameter("b_day1");
			String b_day2 = multi.getParameter("b_day2");
			String b_one = multi.getParameter("b_one");
			String b_ac = multi.getParameter("b_ac");
			String b_price = multi.getParameter("b_price");
			

			String[] b_trav = multi.getParameterValues("b_trav");
			String[] b_food = multi.getParameterValues("b_food");
			String[] b_trans = multi.getParameterValues("b_trans");
			String[] b_stay = multi.getParameterValues("b_stay");
			String[] b_cont = multi.getParameterValues("b_cont");
			String[] b_post = multi.getParameterValues("b_post");

			board.setU_id(u_id);
			board.setB_title(b_title);
			board.setB_pic1(b_pic1);
			board.setB_pic2(b_pic2);
			board.setB_pic3(b_pic3);
			board.setB_cate(b_cate);
			board.setB_lo(b_lo);
			board.setB_tr(b_tr);
			board.setB_day1(Integer.parseInt(b_day1));
			board.setB_day2(Integer.parseInt(b_day2));
			board.setB_one(b_one);
			board.setB_price(Integer.parseInt(b_price));
		
		} catch (Exception e) {
			e.printStackTrace();
		}

		BoardDB boardDB = BoardDB.getInstance();

		int b_num = boardDB.insertBoard(board);
		
		String[] b_trav = multi.getParameterValues("b_trav");
		String[] b_food = multi.getParameterValues("b_food");
		String[] b_trans = multi.getParameterValues("b_trans");
		String[] b_stay = multi.getParameterValues("b_stay");
		String[] b_cont = multi.getParameterValues("b_cont");
		String[] b_post = multi.getParameterValues("b_post");
		
		
		BoardDayBean dayBean = new BoardDayBean();
		dayBean.setB_num(b_num);
		
		for(int n=0; n< b_cont.length; n++ ){
			
			dayBean.setB_day((n+1)+"");
			dayBean.setB_trav(b_trav[n]);
			dayBean.setB_food(b_food[n]);
			dayBean.setB_trans(b_trans[n]);
			dayBean.setB_stay(b_stay[n]);
			dayBean.setB_cont(b_cont[n]);
			dayBean.setB_post(b_post[n]);
	
			
		
			boardDB.insertBoardDay(dayBean);
			
		}
		
		
		 response.sendRedirect("content.jsp?b_num="+b_num); 
	%>
</body>
</html>