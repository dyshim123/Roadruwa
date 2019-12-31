<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="trip.message.MessageDBBean"%>
<%@ page import="trip.message.MessageDataBean"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%
		String uploadPath = "D:\\uploadFile";

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
			System.out.println("여기 다녀갑니다.~~~~:::");
			System.out.println("m_content:"+multi.getParameter("m_content"));
			System.out.println("m_sid:"+multi.getParameter("m_sid"));
			System.out.println("s_id:"+multi.getParameter("s_id"));
			
			MessageDataBean bean = new MessageDataBean();
			bean.setB_num(Integer.parseInt(multi.getParameter("b_num")));
			bean.setU_id(u_id);
			bean.setM_content(multi.getParameter("m_content"));
			bean.setM_sid(multi.getParameter("m_sid"));
			bean.setS_id(multi.getParameter("s_id"));
			
			
			MessageDBBean msgBean = MessageDBBean.getInstance();
			msgBean.insertMessage(bean);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
%>
</body>
</html>