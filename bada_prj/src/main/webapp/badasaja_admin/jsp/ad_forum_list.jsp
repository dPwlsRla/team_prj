<%@page import="kr.co.sist.badasaja.vo.LocalVO"%>
<%@page import="kr.co.sist.badasaja.vo.ProductVO"%>
<%@page import="kr.co.sist.badasaja.admin.dao.BaseDAO"%>
<%@page import="kr.co.sist.badasaja.vo.AdForumVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.badasaja.admin.dao.AdminForumDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="../assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>Badasaja Admin</title>

<meta name="description" content="" />

<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="../assets/img/favicon/badasaja.ico" />
<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet" href="../assets/vendor/css/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet" href="../assets/vendor/css/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet" href="../assets/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet"
	href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

<!-- Page CSS -->

<!-- Helpers -->
<script src="../assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="../assets/js/config.js"></script>
<!-- jQuery CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

		getSearchData()
		// ID 로 검색했을 때
		$("#idSearch").click(function() {

			getSearchData();

		}) // click

		// 지역으로 검색했을 때
		$(".local").click(function() {

			var gu = $(this).text();

			$("#gu").attr("value", gu);
			$("#local").html(gu);

			getSearchData();
		})

		// 카테고리로 검색했을 때
		$(".category").click(function() {
			var pr = $(this).text();

			$("#pr").attr("value", pr);
			$("#category").html(pr);

			getSearchData();

		})

		// 상태로 검색했을 때
		$(".status").click(function() {
			var st = $(this).text();

			if (st == 'null') {
				st = "상태";

			}

			$("#st").attr("value", st);
			$("#status").html(st);

			getSearchData();

		})

	}) //ready

	// 광고게시글 전체조회 method
	function getSearchData() {
		$.ajax({
			url : "http://localhost/bada_prj/badasaja_admin/jsp/ad_forum_list_process.jsp",
			data : {
				aID : $("#aID").val(),
				gu : $("#gu").val(),
				st : $("#st").val(),
				pr : $("#pr").val(),
				},
			type : "get",
			dataType : "json",
			error : function(xhr) {
				alert(xhr.text + "/" + xhr.status);
			},
			success : function(jsonObj) {
				$("tbody").empty();
				if (jsonObj.resultData.length == 0) {
					$("#tab > tbody").append("<tr><td colspan='5'><strong>조회결과 없음</strong></td></tr>")
				}

						$.each(jsonObj.resultData, function(i, jsonObj) {
							$("#tab > tbody").append(
									"<tr><td class='afNum'>" + jsonObj.afNum
											+ "</td><td>" + jsonObj.aID
											+ "</td><td>" + jsonObj.topic
											+ "</td><td>" + jsonObj.local
											+ "</td><td>" + jsonObj.category
											+ "</td><td>" + jsonObj.status
											+ "</td><td>" + jsonObj.postedDate
											+ "</td><td>" + jsonObj.expiryDate
											+ "</td></tr>")
						})
						// 광고게시글 클릭시 상세보기 조회 method
						$("tbody tr").click(function(e) {

							var tr = $(this);
							var td = tr.children();

							var data = td.eq(0).text();

							window.location.href = "ad_forum_info.jsp?afNum="+ data;
						})
					},

				}) //ajax
	}
</script>
</head>


<body>

	<%
	BaseDAO bDAO = BaseDAO.getInstance();
	List<ProductVO> pList = bDAO.selectProductList();
	List<LocalVO> lList = bDAO.selectLocalList();

	AdminForumDAO afDAO = AdminForumDAO.getInstance();

	pageContext.setAttribute("pList", pList);
	pageContext.setAttribute("lList", lList);
	%>

	<%@ include file="nav.jsp"%>

	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Menu -->
			<%@ include file="sidemenu.jsp"%>
			<!-- / Menu -->

			<!-- Layout container -->
			<div class="layout-page">
				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->

					<div class="container-xxl flex-grow-1 container-p-y">

						<!-- Basic Bootstrap Table -->
						<h4 class="fw-bold py-3 mb-4">
							<span class="text-muted fw-light">AD_Forum /</span>광고 게시글 리스트
						</h4>
						<div class="card" style="height: 800px; overflow-y: scroll;">
							<!-- Search -->
							<div class="navbar-nav mb-3">
								<div class="nav-item d-inline">
									<a href="write_ad_forum.jsp"
										class="btn btn-outline-primary float-end shadow-none"
										style="margin-top: 15px; margin-left: 15px">글쓰기</a>
									<button type="button"
										class="btn btn-outline-primary dropdown-toggle float-end"
										data-bs-toggle="dropdown" name="status" id="status"
										style="margin-top: 15px; margin-left: 20px;">
										<c:choose>
											<c:when test="${ not empty param.st }">${ param.st }</c:when>
											<c:when test="${ empty param.st }">상태</c:when>
										</c:choose>
									</button>
									<input type="hidden" name="st" id="st" />
									<ul class="dropdown-menu">
										<li class="status"><a class="dropdown-item"
											href="javascript:void(0);">상태</a></li>
										<li class="status"><a class="dropdown-item"
											href="javascript:void(0);">게시중</a></li>
										<li class="status"><a class="dropdown-item"
											href="javascript:void(0);">게시삭제</a></li>
									</ul>
									<input type="hidden" name="gu" id="gu" />
									<button type="button"
										class="btn btn-outline-primary dropdown-toggle float-end"
										data-bs-toggle="dropdown" id="local"
										style="margin-top: 15px; margin-left: 20px;">지역</button>
									<ul class="dropdown-menu">
										<li class="local"><a class="dropdown-item"
											href="javascript:void(0)">지역</a></li>
										<c:forEach var="data" items="${lList }">
											<li class="local"><a class="dropdown-item"
												href="javascript:void(0)"><c:out
														value="${ data.guName }" /> </a></li>
										</c:forEach>
									</ul>
									<button type="button"
										class="btn btn-outline-primary dropdown-toggle float-end"
										data-bs-toggle="dropdown" name="category" id="category"
										style="margin-top: 15px; margin-left: 20px;">
										<c:choose>
											<c:when test="${ not empty param.product }">${ param.product }</c:when>
											<c:when test="${ empty param.product }">카테고리 선택</c:when>
										</c:choose>

									</button>
									<input type="hidden" name="pr" id="pr" />
									<ul class="dropdown-menu">
										<li class="category"><a class="dropdown-item"
											href="javascript:void(0)">카테고리 선택</a></li>
										<c:forEach var="data" items="${ pList }">
											<li class="category"><a class="dropdown-item"
												href="javascript:void(0)"><c:out
														value="${ data.product }" /> </a></li>
										</c:forEach>
									</ul>

									<a href="javascript:void(0);" id="idSearch"
										class="btn btn-primary float-end shadow-none"
										style="margin-top: 15px; margin-left: 10px">검색</a> <input
										type="text" name="aID" id="aID"
										class="form-control shadow-none float-end"
										placeholder="광고주_ID검색" style="margin-top: 15px; width: 150px;" />
								</div>
							</div>
							<!-- /Search -->
							<div class="table-responsive text-nowrap">
								<table id="tab" class="table table-hover">
									<thead>
										<tr>
											<th>번호</th>
											<th>광고주ID</th>
											<th>제목</th>
											<th>지역</th>
											<th>상태</th>
											<th>상품카테고리</th>
											<th>작성일</th>
											<th>만료일</th>
										</tr>
									</thead>
									<tbody class="table-border-bottom-0" id="af">
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--/ Basic Bootstrap Table -->


	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<script src="../assets/vendor/libs/jquery/jquery.js"></script>
	<script src="../assets/vendor/libs/popper/popper.js"></script>
	<script src="../assets/vendor/js/bootstrap.js"></script>
	<script
		src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

	<script src="../assets/vendor/js/menu.js"></script>
	<!-- endbuild -->

	<!-- Vendors JS -->

	<!-- Main JS -->
	<script src="../assets/js/main.js"></script>

	<!-- Page JS -->

	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
