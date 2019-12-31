<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="trip.point.PointDataBean"%>
<%@ page import="trip.point.PointDBBean"%>
<%@ page import="trip.board.BoardDataBean"%>
<%@ page import="trip.board.BoardDB"%>
<%@ page import="trip.message.MessageDataBean"%>
<%@ page import="trip.message.MessageDBBean"%>
<%@ page import="java.util.*"%>
<style>
a{
display:inline-block; text-align:center; vertical-align:middle; text-decoration:none; font-size:12px; color:#000; border:1px solid #BDBDBD; width:118px; height:38px; line-height:38px; 
margin-left:320px; border-radius: 5px;
}
</style>
<%
request.setCharacterEncoding("utf-8");
String u_id = null;
String m_num = request.getParameter("m_num");
MessageDBBean message = MessageDBBean.getInstance();
MessageDataBean messageBean = message.Modalmessage(Integer.parseInt(m_num));
int b_num = messageBean.getB_num();
if (session.getAttribute("u_id") != null) {
	u_id = (String) session.getAttribute("managerId");
	
}
%>
<div class="form-group row">
<label class="col-sm-6 col-form-label">
보낸사람: <%=messageBean.getU_id()%></label>
<label class="col-sm-6 col-form-label"><%=messageBean.getM_date() %></label></div>
제목: <%=messageBean.getM_sid()%><br>
내용: <%=messageBean.getM_content()%>
<br><br>

답장<br>
<form name="replyMsgForm" method="post" enctype="multipart/form-data" action="manager_reply.jsp">
<input type="hidden" name="m_num" value="<%=m_num%>">
  <input type="text" name="m_sid" id="m_sid" required="required"
             class="s_form s_form-input" placeholder="제목을 입력하세요" style="border-radius: 6px; border: solid 1px #e5e5e5; margin-bottom:20px;padding-left:20px;width: 50%;height:40px;" />
<textarea name="m_content" id="m_content" cols="20" rows="5" placeholder="내용을 입력하세요" 
      style="border-radius: 6px; border: solid 1px #e5e5e5; padding: 0 1em; width: 100%; height:300px; padding-left:20px; padding-top:6px;"></textarea>
       <input type="hidden" name="s_id" id="s_id" 
     class="s_form s_form-input" value="<%=messageBean.getU_id()%>"  readonly/> <br>
  <input  type="hidden" name="u_id" id="u_id" 
     class="s_form s_form-input" value="<%=u_id%>" readonly /><br>
<br><a href="#" onclick="replyMsgForm.submit()">답장</a>
</form>