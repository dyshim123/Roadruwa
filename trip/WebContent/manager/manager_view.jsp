<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="trip.point.PointDataBean"%>
<%@ page import="trip.point.PointDBBean"%>
<%@ page import="trip.board.BoardDataBean"%>
<%@ page import="trip.board.BoardDB"%>
<%@ page import="trip.message.MessageDataBean"%>
<%@ page import="trip.message.MessageDBBean"%>
<%@ page import="java.util.*"%>
<%
request.setCharacterEncoding("utf-8");
String u_id = null;
String m_num = request.getParameter("m_num");
MessageDBBean message = MessageDBBean.getInstance();
MessageDataBean messageBean = message.Modalmessage(Integer.parseInt(m_num));

int b_num = messageBean.getB_num();
%>
<div class="form-group row">
<label class="col-sm-6 col-form-label">
받은사람: <%=messageBean.getS_id() %></label>
<label class="col-sm-6 col-form-label"><%=messageBean.getM_date() %></label></div>

제목: <%=messageBean.getM_sid()%><br>
내용: <%=messageBean.getM_content()%>

