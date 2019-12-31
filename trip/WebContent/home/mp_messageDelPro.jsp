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
		String[] m_nums = request.getParameterValues("m_num"); 
		

		try {
			// request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책

			MessageDBBean msgBean = MessageDBBean.getInstance();
			for(String m_num: m_nums ){
				//out.print(m_num);
				//out.print(",");
				msgBean.delmymessage(Integer.parseInt(m_num));
			}
		
			
			//msgBean.insertMessage(bean);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		response.sendRedirect("mp_message.jsp");
%>
</body>
</html>