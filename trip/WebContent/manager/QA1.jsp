<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="trip.point.PointDataBean"%>
<%@ page import="trip.point.PointDBBean"%>
<%@ page import="trip.board.BoardDataBean"%>
<%@ page import="trip.board.BoardDB"%>
<%@ page import="trip.message.MessageDataBean"%>
<%@ page import="trip.message.MessageDBBean"%>
<%@ page import="java.util.List"%>
<jsp:include page="mheader.jsp" flush="false" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/js/jquery.modal.js"></script>
<link rel="stylesheet" href="/home/assets/css/jquery.modal.css" />
<%
String id = (String) session.getAttribute("managerId");
String u_id = null;

request.setCharacterEncoding("utf-8");
String s_id = request.getParameter("s_id");

MessageDBBean message = MessageDBBean.getInstance();
int count = message.getmymessage(id);//보낸
int counts = message.getmymessages(id);//받은
MessageDataBean messageBean = null;//보낸
MessageDataBean messageBean1 = null;//받은
List<MessageDataBean> messageList = message.writemessage(id);//보낸

%>
<div id="wrapper">
	<div id="main">
		<div class="inner">
			<div class="row">
				<header class="majorr">
					<br>
					<h2>받은 쪽지함</h2>
				</header>
			</div>
			<table class="table">
			<thead>
				<tr>
					<th scope="col">보낸이</th>
					<th scope="col">제목</th>
					<th scope="col">내용</th>
					<th scope="col">보낸날짜</th>
					
				</tr>
			</thead>
			<tbody class="tbo">
				
							<tbody>
							<%
								if (counts == 0) {
							%>
								<tr>
									<td>메시지가 없습니다.</td>
								</tr>
							<%
								} else if (counts > 0) {//받은메세지
									/* 
									messageList = message.writemessages(s_id); */
									messageList = message.writemessages(id);
									for (int i = 0; i < messageList.size(); i++) {
										messageBean1 = (MessageDataBean) messageList.get(i);
							%>
								<tr>
									
									<td><%=messageBean1.getU_id()%></td>
									<%--<td><a  class="a" data-toggle="modal" data-target="#exampleModals"><%=messageBean.getM_sid()%></a></td> --%>
									<td><a href="manager_views.jsp?m_num=<%=messageBean1.getM_num()%>" rel="modal2:open"><%=messageBean1.getM_sid()%></a></td>
									<td><%=messageBean1.getM_content()%></td>
									<td><%=messageBean1.getM_date()%></td>
								</tr>
								<%
									}
								}
								%>
							</tbody>
				
			</tbody>
		</table>
		</div>
	</div>
	<script src="/home/assets/js/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

	<jsp:include page="mfooter.jsp" flush="false" />