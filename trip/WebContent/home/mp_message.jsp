<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="trip.point.PointDataBean"%>
<%@ page import="trip.point.PointDBBean"%>
<%@ page import="trip.board.BoardDataBean"%>
<%@ page import="trip.board.BoardDB"%>
<%@ page import="trip.message.MessageDataBean"%>
<%@ page import="trip.message.MessageDBBean"%>
<%@ page import="java.util.*"%>
<%@ include file="sessionCheckPro.jsp"%>
<jsp:include page="header.jsp" flush="false" />
<script src="/js/jquery.modal.js"></script>

<link rel="stylesheet" href="assets/css/message.css" />
<link rel="stylesheet" href="assets/css/jquery.modal.css" />
<link href="assets/css/mypage.css" rel="stylesheet" type="text/css"
	media="all" />
	<style>
	.td{
	text-overflow:ellipsis; overflow:hidden; white-space:nowrap;
	}
	
	</style>
<%
	request.setCharacterEncoding("utf-8");
	u_id = null;
	PointDataBean pointBean = null;
	String id = (String) session.getAttribute("u_id");
    String s_id = request.getParameter("s_id");
	PointDBBean point = PointDBBean.getInstance();
	
	if (session.getAttribute("u_id") != null) {
		u_id = (String) session.getAttribute("u_id");
		pointBean = point.PointInfo(u_id);
	}

	MessageDBBean message = MessageDBBean.getInstance();
	int count = message.getmymessage(id);//보낸
	int counts = message.getmymessages(id);//받은
	MessageDataBean messageBean = null;//보낸
	MessageDataBean messageBean1 = null;//받은
	List<MessageDataBean> messageLists = null;//보낸
	List<MessageDataBean> messageList = null;//받은
	int nowpoint = point.Nowpoint(u_id);//현재포인트
	//messageBean1 = message.Modalmessage();
	
	
%>
<div id="npage" class="side">
	<div id="nheader">
		<div id="nlogo">
		 <img src="images/user.png" alt="" />
			<h6 style="margin-top: 20px;"><b><a href="#"><%=u_id%></a></b></h6>
			<h4><b><%=nowpoint%>P</b></h4>
		</div>
		 <div id="nmenu">
         <ul>
            <li><a href="mp_my.jsp" accesskey="1" title="">내 게시물</a></li>
            <li><a href="mp_buy.jsp" accesskey="2" title="">구매리스트</a></li>
            <li><a href="mp_point.jsp" accesskey="3" title="">포인트 충전/내역</a></li>
              <li class="current_page_item"><a href="mp_message.jsp"
               accesskey="4" title="">쪽지</a></li>
            <li><a href="mp_set.jsp" accesskey="5" title="">설정</a></li>
         </ul>
      </div>
	</div>
	<script>   
	$(document).ready(function(){
	    //최상단 체크박스 클릭
	    $("input[name=all1]").click(function(){
	        //클릭되었으면
	        if($("#checkalla").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=m_num]").prop("checked",true);
	            //클릭이 안되있으면
	        }
	        else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=m_num]").prop("checked",false);
	        }
	    }) })
	</script>
	<div id="nmain" class="nmain_no">
		<div class="row">
			<div class="col-md-12 text-center ">
				<nav class="nav-justified ">
					<div class="nav nav-tabs " id="nav-tab" role="tablist">
						<a class="nav-item nav-link active"
							id="pop2-tab" data-toggle="tab" href="#pop2" role="tab"
							aria-controls="pop2" aria-selected="false">받은쪽지함</a>
                        <a class="nav-item nav-link" id="pop1-tab"
							data-toggle="tab" href="#pop1" role="tab" aria-controls="pop1"
							aria-selected="true">보낸쪽지함</a> 
					</div>
				</nav>
			</div>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade " id="pop1" role="tabpanel" aria-labelledby="pop1-tab">
					<div class="pt-3" style="padding-top: 2.4rem!important;">
						<script type="text/javascript">
						function delMsg(){
							if(!confirm('쪽지를 삭제하시겠습니까?')){
								return false;
							}
							
							delForm.submit();
						}
						
						</script>
						<div style="padding-left:550px;">
						<a class="a" data-toggle="modal" data-target="#example" style="margin-top:200px;">관리자한테 쪽지&nbsp;&nbsp;
						<img src="images/message.png" width="30px">
						</a>&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-outline-primary" onclick="delMsg()" style="margin-bottom:5px;">삭제</button></div>
						<form name="delForm" action="mp_messageDelPro.jsp" method="post">
						<table class="table table-header-rotated" style="margin-right: 20px; margin-left: 17px;">
							<colgroup>
								<col width="5%">
								<col width="10%">
								<col width="10%">
								<col width="*%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr>
									<td><input type="checkbox" class="chcktbl" id='checkalla' name="all1" /></td>
									<td><div><span>받는이</span></div></td>
									<td><div><span>제목</span></div></td>
									<td><div><span>내용</span></div></td>
									<td><div><span>보낸날짜</span></div></td>
								</tr>
							</thead>
							<tbody class="td">
							<%
								if (count == 0) {
							%>
								<tr>
									<td>메시지가 없습니다.</td>
								</tr>
							<%
								}else if (count > 0) {
									messageLists = message.writemessage(id);
									for (int i = 0; i < messageLists.size(); i++) {
										messageBean = (MessageDataBean) messageLists.get(i);
									%>
								<tr>
									<td><input type="checkbox" class="chcktbl" id="de<%=i%>" name="m_num" value="<%=messageBean.getM_num()%>"></td>
									<td><%=messageBean.getS_id()%></td>
									<td><a href="mssage_views.jsp?m_num=<%=messageBean.getM_num()%>"
										rel="modal2:open"><%=messageBean.getM_sid()%></a></td>
									<td><%=messageBean.getM_content()%></td>
									<td><%=messageBean.getM_date()%></td>
								</tr>
								<%
									}
								}
								%>
							</tbody>
						</table>
						</form>
					</div>
				</div>
				<script>   
	$(document).ready(function(){
	    //최상단 체크박스 클릭
	    $("input[name=all2]").click(function(){
	        //클릭되었으면
	        if($("#checkallb").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=ck2]").prop("checked",true);
	            //클릭이 안되있으면
	        }
	        else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=ck2]").prop("checked",false);
	        }
	    }) })
	</script>
				<div class="tab-pane fade show active" id="pop2" role="tabpanel" aria-labelledby="pop2-tab">
					<div class="pt-3" style="padding-top: 3rem!important;">
						<button type="button" class="btn btn-outline-primary" style="margin-left:720px;margin-bottom:8px;margin-top:-8px;">삭제</button>
						<table class="table table-header-rotated" style="margin-right: 20px; margin-left: 17px;">
							<colgroup>
								<col width="5%">
								<col width="10%">
								<col width="10%">
								<col width="*%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr>
									<td><input type="checkbox" class="chcktbl" id='checkallb' name="all2" /></td>
									<td><div><span>보낸이</span></div></td>
									<td><div><span>제목</span></div></td>
									<td><div><span>내용</span></div></td>
									<td><div><span>보낸날짜</span></div></td>
								</tr>
							</thead>
							<tbody class="td">
							<%
								if (counts == 0) {
							%>
								<tr>
									<td>메시지가 없습니다.</td>
								</tr>
							<%
								} else if (counts > 0) {//받은메세지
									
									messageList = message.writemessages(id);
									for (int i = 0; i < messageList.size(); i++) {
										messageBean1 = (MessageDataBean) messageList.get(i);
							%>
								<tr>
									<td><input type="checkbox" class="chcktbl" id="del<%=i%>" name="ck2"></td>
									<td class="txt_line"><%=messageBean1.getU_id()%></td>
									<td class="txt_line"><a href="mssage_view.jsp?m_num=<%=messageBean1.getM_num()%>"
										rel="modal2:open"><%=messageBean1.getM_sid()%></a></td>
									<td class="txt_line"><%=messageBean1.getM_content()%></td>
									<td class="txt_line"><%=messageBean1.getM_date()%></td>
								</tr>
								<%
									}
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
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
<script type="text/javascript">
	function sendMsgs2() {
		var form_datas = new FormData();

		
		form_datas.append("m_content", $("#m_content2").val());
		form_datas.append("m_sid", $("#m_sid2").val());
		form_datas.append("s_id", "manager");
		
	   $.ajax({
	       data: form_datas,
	        type: "POST",
	        url: 'mp_messagePro.jsp',
	        cache: false,
	        contentType: false,
	        processData: false,		   
	       success: function(url) {
	    	   location.href="mp_message.jsp";
	       },
		   error: function(request, status, error){
			alert("메시지 전송을 실패하였습니다.");

		   }
		});
	      
		return false;
	}

</script>
<div class="modal fade" id="example" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                     <form id="contact-us" onsubmit="return false;">
                        <div class="col-xs-6 wow animated slideInLeft" data-wow-delay=".5s">
                           <table>
                          <tr><td>
                           <input type="text" name="m_sid2" id="m_sid2" required="required"
                              class="s_form s_form-input" placeholder="제목을 입력하세요" style="border-radius: 6px; border: solid 1px #e5e5e5; margin-bottom:20px;padding-left:20px;width: 50%;height:40px;"/></td>
                             <td> <input type="text" name="s_id2" id="s_id2" 
                              value="관리자" style="margin-left: -90px; margin-top:-20px; width:100px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" readonly/></td></tr>
                           <tr><td><textarea name="m_content2" id="m_content2" class="s_form s_textarea"
                              placeholder="내용을 입럭하세요" style="padding: 0.5rem; border-radius: 6px; border: solid 1px #e5e5e5; width:460px;height:200px;"></textarea></td></tr></table><br>
                           <input  type="hidden" name="u_id2" id="u_id2" class="s_form s_form-input" value="<%=u_id%>"/>
                           <button type="button" id="submit" name="submit" onclick="sendMsgs2();"
                              class="btn" id="mbut" style="margin-left:334px;color: #2C96ED; background: none;border-radius: 5px; border:1px solid #2C96ED;">Send Message</button>                    
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </div> 
       <%--   <div class="modal fade" id="sureModals" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">답장하기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div><table><tr><td>
						 <input type="text" name="m_sid" id="m_sid" required="required"
                              class="s_form s_form-input" placeholder="제목을 입력하세요" style="border-radius: 6px; border: solid 1px #e5e5e5; margin-bottom:20px;padding-left:20px;width: 70%;height:35px;"/>                    
                              <input type="text" name="s_id" id="s_id" 
                              class="s_form s_form-input" value="<%=u_id%>" /> </td><tr><td>
                           <textarea name="m_content" id="m_content" class="s_form s_textarea"
                              placeholder="내용을 입럭하세요"  style="border-radius: 6px; border: solid 1px #e5e5e5; padding: 0 1em; width: 100%; height:300px; padding-left:20px; padding-top:6px;" ></textarea>		
			</td></tr></table>
			<input  type="hidden" name="u_id" id="u_id" 
                              class="s_form s_form-input" />
			<div class="modal-footer" style="background-color:#ffffff; padding:1rem; border-top:0;">
			<button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal"
                        data-target="#sureModal" id="mbut">확인</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal" id="mbut">취소</button>
				
			</div>
		</div>
	</div>
</div> --%>
<script src="assets/js/jquery.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="assets/js/main.js"></script>
<script src="assets/js/message.js"></script>
<br>
<br>
<br>
<br>
<jsp:include page="footer.jsp" flush="false" />
