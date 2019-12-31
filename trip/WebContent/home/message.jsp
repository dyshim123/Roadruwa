<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="trip.point.PointDataBean"%>
<%@ page import="trip.point.PointDBBean"%>
<%@ page import="trip.message.MessageDataBean"%>
<%@ page import="trip.message.MessageDBBean"%>
<%@ page import="java.util.*"%>
<%@ include file="sessionCheckPro.jsp"%>
<jsp:include page="header.jsp" flush="false" />
<link rel="stylesheet" href="assets/css/message.css" />
<link href="assets/css/mypage.css" rel="stylesheet" type="text/css"
	media="all" />
<%
	request.setCharacterEncoding("utf-8");
    
	u_id = null;
	PointDataBean pointBean = null;
	PointDBBean point = PointDBBean.getInstance();

	if (session.getAttribute("u_id") != null) {
		u_id = (String) session.getAttribute("u_id");
		pointBean = point.PointInfo(u_id);
	}
	MessageDBBean message = MessageDBBean.getInstance();
	int count = message.getmymessage(u_id);
	MessageDataBean messageBean = null;
	List<MessageDataBean> messageLists = null;
	int nowpoint = point.Nowpoint(u_id);//현재포인트
%>


	<div id="nmain" class="nmain_no">
		<h4>
			<b>쪽지</b>
		</h4>

		<div id="line"></div>
		<br>
		<div class="tabs">
			<input type="radio" name="tabs" id="tabone" checked="checked">
			<label for="tabone" class="m_label">받은 쪽지함</label>
			<div class="tab">
				<table id="search-results" class="table table-hover">
					<colgroup>
						<col width="2%">
						<col width="*%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr>
							<th><label class="m_container"> <input
									type="checkbox" name="all" class="check-all"> <span
									class="m_checkmark"></span>
							</label></th>
							<th>
								<button type="button" class="btn btn-outline-dark"
									data-toggle="modal" data-target="#exampleModalCenter">삭제</button>
								&nbsp;
		
								<div class="modal fade" id="exampleModalCenter" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalCenterTitle"
									aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalCenterTitle">삭제완료</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">,,</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
							</th>
							<th><h6>시간</h6></th>
						</tr>
					</thead>
					<tbody>
					<%
			if (count == 0) {
		%>
		<div>메시지가 없습니다.</div>
		<%
			}
			if (count > 0) {
				messageLists = message.writemessage(u_id);
		%>
		<div class="row">
					<%
				for (int i = 0; i < messageLists.size(); i++) {
					messageBean = (MessageDataBean) messageLists.get(i);
			%>
			<tr>
			<td><label class="m_container"> 
			<input type="checkbox" name="cb" class="ab"> 
		    <span class="m_checkmark"></span>
            </label></td>
            <td><%=messageBean.getM_sid()%></td>
            <td><%=messageBean.getM_content()%></td>
            <td><%=messageBean.getM_date()%></td>
            </tr>
            </tbody>
				</table>
			<%
				}
			%>
			
				</div></div>
				 <%
		    }
			%>
			
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#exampleModal" data-whatever="@mdo">쪽지보내기</button>
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">쪽지 보내기</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form id="contact-us" method="post" action="#">
									<div class="col-xs-4 wow animated slideInLeft"
										data-wow-delay=".5s">
										<input type="text" name="name" id="name" required="required"
											class="s_form s_form-input" placeholder="Name" /> <input
											type="text" name="id" id="id" required="required"
											class="s_form s_form-input" placeholder="ID(자동으로)" />
										<textarea name="message" id="message"
											class="s_form s_textarea" placeholder="Message"></textarea>
										<button type="submit" id="submit" name="submit"
											class="s_form-btn semibold">Send Message</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<input type="radio" name="tabs" id="tabtwo"> <label
				for="tabtwo" class="m_label">보낸 쪽지함</label>
			<div class="tab">
				<table id="search-results" class="table table-hover">
					<colgroup>
						<col width="2%">
						<col width="*%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr>
							<th><label class="m_container"> <input
									type="checkbox" name="all" class="check-all"> <span
									class="m_checkmark"></span>
							</label></th>
							<th>
								<button type="button" class="btn btn-outline-dark"
									data-toggle="modal" data-target="#exampleModalCenter2">삭제</button>
								&nbsp;
								<div class="modal fade" id="exampleModalCenter2" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalCenterTitle"
									aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalCenterTitle">삭제완료</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">,,</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
							</th>
							<th><h6>시간</h6></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><label class="m_container"> <input
									type="checkbox" name="cb2" class="ab"> <span
									class="m_checkmark"></span>
							</label></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><label class="m_container"> <input
									type="checkbox" name="cb2" class="ab"> <span
									class="m_checkmark"></span>
							</label></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><label class="m_container"> <input
									type="checkbox" name="cb2" class="ab"> <span
									class="m_checkmark"></span>
							</label></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><label class="m_container"> <input
									type="checkbox" name="cb2" class="ab"> <span
									class="m_checkmark"></span>
							</label></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><label class="m_container"> <input
									type="checkbox" name="cb2" class="ab"> <span
									class="m_checkmark"></span>
							</label></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
</div>
<script src="assets/js/main.js"></script>
<script src="assets/js/message.js"></script>
<br><br><br><br>
<jsp:include page="footer.jsp" flush="false" />
