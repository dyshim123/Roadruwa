<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Trip</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/header.css" />
<link rel="stylesheet"
	href="assets/bootstrap-4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
</head>
<body>
	<nav class="navbar  bnav">
		<div class="container-fluid">
			<a href="main.jsp"> <img src="images/main.png"></a>
			<div>
				<%
					String u_id = null;
					if (session.getAttribute("u_id") != null) {
						u_id = (String) session.getAttribute("u_id");
					}

					if (u_id == null) {
				%>
				<ul class="nav navbar-right">
					<li class="h_set"><a class="nav-link disabled"
						data-toggle="modal" data-target="#myModal">로그인</a></li>
					<li class="h_set"><a class="nav-link disabled"
						data-toggle="modal" data-target="#joinModal">회원가입</a></li>
				</ul>
				<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header" style="padding: 35px 50px;">

								<h1>Login</h1>
							</div>
							<div class="modal-body" style="padding: 40px 50px;">
								<form role="form" action="loginFormPro.jsp">
									<div class="form-group">
										<label for="usrname"><span
											class="glyphicon glyphicon-user"></span> ID</label> <input
											type="text" class="form-control" id="u_id" name="u_id"
											placeholder="아이디" onkeydown="inputIdChk()">
									</div>

									<div class="form-group">
										<label for="psw"><span
											class="glyphicon glyphicon-eye-open"></span> Password</label> <input
											type="password" class="form-control" id="u_pwd" name="u_pwd"
											placeholder="비밀번호">
									</div>


									<button type="submit" class="btn btn-ff btn-block">
										<span class="glyphicon glyphicon-off"></span> Login
									</button>
								</form>
							</div>
							<div class="modal-footer">

								<p>
									Forgot <a href="searchIdForm.jsp">ID?</a>
								</p>
								<p>
									Forgot <a href="searchPwForm.jsp">Password?</a>
								</p>
							</div>
						</div>

					</div>
				</div>
			</div>
			<script>
				$(document).ready(function() {
					$("#myBtn").click(function() {
						$("#myModal").modal();
					});
				});
			</script>

			<!-- joinModal -->
			<div class="modal fade" id="joinModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="padding: 35px 50px;">

							<h1>sign up</h1>
						</div>
						<div class="modal-body" style="padding: 40px 50px;">
							<form role="form" action="./insertMemberPro.jsp">
								<div class="form-group">
									<label for="id"><span class="glyphicon glyphicon-user"></span>
										ID</label> <input type="text" class="form-control" id="u_id"
										name="u_id" placeholder="아이디" required>
								</div>



								<div class="form-group">
									<label for="psw"><span
										class="glyphicon glyphicon-eye-open"></span> Password</label> <input
										type="password" class="form-control" id="u_pwd" name="u_pwd"
										placeholder="비밀번호" required>
								</div>
								<div class="form-group">
									<label for="name"><span
										class="glyphicon glyphicon-eye-open"></span> name</label> <input
										type="text" class="form-control" id="u_name" name="u_name"
										placeholder="이름" required>
								</div>
								<div class="form-group">
									<label for="age"><span
										class="glyphicon glyphicon-eye-open"></span> Age</label> <input
										type="text" class="form-control" id="u_age" name="u_age"
										placeholder="나이" required>
								</div>
								<div class="form-group">
									<label for="phone"><span
										class="glyphicon glyphicon-eye-open"></span> Phone</label> <input
										type="text" class="form-control" id="u_phone" name="u_phone"
										placeholder="전화번호" required>
								</div>
								<div class="form-group">
									<label for="email"><span
										class="glyphicon glyphicon-eye-open"></span> Email</label> <input
										type="text" class="form-control" id="u_email" name="u_email"
										placeholder="이메일" required>
								</div>
								<div class="form-group">
									<label for="gender"><span
										class="glyphicon glyphicon-eye-open"></span> Gender</label>

									<div class="btn-group col-sm-8" data-toggle="buttons">
										<label class="btn btn-primary active"> <input
											type="radio" name="u_gender" autocomplete="off" value="여자"
											checked>여자
										</label> <label class="btn btn-primary"> <input type="radio"
											name="u_gender" autocomplete="off" value="남자">남자
										</label>
									</div>
								</div>

								<button type="submit" class="btn btn-ff btn-block">
									<span class="glyphicon glyphicon-off"></span> join
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			$(document).ready(function() {
				$("#joinBtn").click(function() {
					$("#joinModal").modal();
				});
			});
		</script>
		<%
			} else {
		%>
		<ul class="nav navbar-right">
			<li><div class="nav-link disabled"><%=u_id%>
					님 환영합니다!
				</div></li>
			<li><a class="nav-link disabled" href="mp_my.jsp">마이페이지</a></li>
			<li><a class="nav-link disabled" href="logout.jsp">로그아웃</a></li>
			<%
				}
			%>

		</ul>
	</nav>