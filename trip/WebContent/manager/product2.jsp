<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="trip.board.BoardDataBean"%>
<%@ page import="trip.board.BoardDB"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.List"%>
<jsp:include page="mheader.jsp" flush="false" />
<%
	request.setCharacterEncoding("utf-8");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	BoardDB board = BoardDB.getInstance();
	List<BoardDataBean> boardLists = board.getBoard();

%>
<div id="wrapper">
	<div id="main">
		<div class="inner">
			<div class="row">
				<header class="majorr">
					<br>
					<h2>승인된 상품</h2>
				</header>
			</div>
			<table class="table">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">지역</th>
					<th scope="col">일수</th>
					<th scope="col">글쓴이</th>
					<th scope="col">날짜</th>
					<th scope="col">가격</th>
				</tr>
			</thead>
			<tbody class="tbo1">
				<%
					for (int i = 0; i < boardLists.size(); i++) {
						BoardDataBean boardBean = (BoardDataBean) boardLists.get(i);
				%>
				<tr>
					<td><%=i+1 %></td>
					<td><a href="../home/content.jsp?b_num=<%=boardBean.getB_num()%>">[<%=boardBean.getB_cate()%>]<%=boardBean.getB_title()%></a></td>
					<td><%=boardBean.getB_lo()%></td>
					<td><%=boardBean.getB_day1()%>박  <%=boardBean.getB_day2()%>일</td>
					<td><%=boardBean.getU_id()%></td>
					<td><%=sdf.format(boardBean.getB_create_dt())%></td>
					<td><%=boardBean.getB_price()%>원</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		</div>
	</div>
	<jsp:include page="mfooter.jsp" flush="false" />