<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="trip.board.BoardDB"%>
<%@ page import="trip.board.BoardDataBean"%>
<%@ page import="trip.comment.CommentDBBean"%>
<%@ page import="trip.comment.CommentDataBean"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.Timestamp"%>
<jsp:useBean id="cmtdto" scope="page" class="trip.comment.CommentDataBean">
   <jsp:setProperty name="cmtdto" property="*" />
</jsp:useBean>
<%
   request.setCharacterEncoding("utf-8");
   String uploadPath = "D:\\uploadFile";

   int maxSize = 1024 * 1024 * 10; // 한번에 올릴 수 있는 파일 용량 : 10M로 제한

   String fileName1 = ""; // 중복처리된 이름
   String originalName1 = ""; // 중복 처리전 실제 원본 이름
   long fileSize = 0; // 파일 사이즈
   String fileType = ""; // 파일 타입

   MultipartRequest multi = null;

   try {
      // request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
      multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
      String c_content = multi.getParameter("text");
      String c_pic = multi.getFilesystemName("c_pic1");
      String star = multi.getParameter("star1");
      
      cmtdto.setC_content(c_content);
      cmtdto.setC_pic(c_pic);
      cmtdto.setStar(star);

   } catch (Exception e) {
      e.printStackTrace();
   }
   
   String b_num = request.getParameter("b_num");
   int c_num = Integer.parseInt(request.getParameter("c_num"));

   CommentDBBean dbPro = CommentDBBean.getInstance();
   dbPro.updateComment(cmtdto,c_num);

   response.sendRedirect("content.jsp?b_num=" + b_num);
%>