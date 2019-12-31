<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%><%@page import="com.oreilly.servlet.MultipartRequest"%><%
	String uploadPath = "/home/dadang/www/uploadFile";

	int maxSize = 1024 * 1024 * 10; // 한번에 올릴 수 있는 파일 용량 : 10M로 제
	
	MultipartRequest multi = null;

	try {
		// request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
		multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		String file = multi.getFilesystemName("file");
		out.print("/uploadFile/"+file);
	} catch (Exception e) {
		e.printStackTrace();
	}
%>