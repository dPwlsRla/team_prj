<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = (String)session.getAttribute("oId");

 if (id == null) {
	response.sendRedirect("login.jsp");
} 
%>

<nav class="navbar-expand-lg navbar-light bg-light mb-5">
	<div class="container-fluid">
		<a class="navbar-brand" href="javascript:void(0)">바다사자</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbar-ex-7">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbar-ex-7">

			<ul class="navbar-nav ms-lg-auto">
				<li class="nav-item">
					<div class="nav-link" id="OperaterID">
						<i class="tf-icons navbar-icon bx bx-user"></i>
						<!-- 관리자아이디노출 --><span id="operID"><%=id%></span></div>
				</li>
				<li class="nav-item"><a class="nav-link" id="logout" href="logout.jsp"><i
						class="tf-icons navbar-icon bx bx-cog"></i>Logout</a></li>
						
				<li class="nav-item"><a class="nav-link"
					href="exit.jsp"><i
						class="tf-icons navbar-icon bx bx-lock-open-alt"></i> Exit</a></li>
			</ul>
		</div>
	</div>
</nav>
