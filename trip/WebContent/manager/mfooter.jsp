<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">

				<!-- Menu -->
				<nav id="menu">
					<ul>
						<li><a href="user.jsp">회원관리</a></li>
						<li><span class="opener">상품관리</span>
							<ul>
								<li><a href="product1.jsp">미승인 상품</a></li>
								<li><a href="product2.jsp">승인된 상품</a></li>
							</ul>
						</li>
						<li><a href="point.jsp">포인트관리</a></li>
						<li><span class="opener">쪽지</span>
						<ul>
								<li><a href="QA1.jsp">받은 쪽지</a></li>
								<li><a href="QA2.jsp">보낸 쪽지</a></li>
							</ul>
					</ul>
				</nav>

			</div>
		</div>


<script>
	var dropdown = document.getElementsByClassName("opener");
	var i;
	
	for (i = 0; i < dropdown.length; i++) {
	  dropdown[i].addEventListener("click", function() {
	    this.classList.toggle("active");
	    var dropdownContent = this.nextElementSibling;
	    if (dropdownContent.style.display === "block") {
	      dropdownContent.style.display = "none";
	    } else {
	      dropdownContent.style.display = "block";
	    }
	  });
	}
</script>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>