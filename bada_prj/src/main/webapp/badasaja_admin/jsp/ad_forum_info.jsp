<%@page import="kr.co.sist.badasaja.vo.AdForumVO"%>
<%@page import="kr.co.sist.badasaja.admin.dao.AdminForumDAO"%>
<%@page import="kr.co.sist.badasaja.admin.dao.AdminAdDAO"%>
<%@page import="kr.co.sist.badasaja.vo.ProductVO"%>
<%@page import="kr.co.sist.badasaja.vo.LocalVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.badasaja.admin.dao.BaseDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
session.setAttribute("insertAdForumFlag", false);
request.setCharacterEncoding("utf-8");
int filecounter = 0;
if (request.getParameter("addcnt") != null) { 
	filecounter = Integer.parseInt(request.getParameter("addcnt"));
}
%>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="../assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>Vertical Layouts - Forms | Sneat - Bootstrap 5 HTML Admin
	Template - Pro</title>

<meta name="description" content="" />
<style type="text/css">
img {
	width: 200px;
	height: 200px;
	margin-right: 5%;
	margin-top: 2%;
}
/* CSS */
.Blog .imgs_wrap {
	display: flex;
	flex-wrap: wrap;
	align-items: flex-start;
	margin: 30px 0;
}

.Blog .imgs_wrap {
	width: calc(33.333% - 10px);
	margin: 0 15px 15px 0;
}

.Blog .imgs_wrap img:nth-of-type(3n), .Blog .imgs_wrap img:last-child {
	margin-right: 0;
}

@media screen and (max-width:640px) {
	.Blog .imgs_wrap img {
		width: calc(50% - 15px);
	}
}

@media screen and (max-width:480px) {
	.Blog .imgs_wrap img:nth-of-type(2n) {
		margin-right: 0;
	}
	.Blog .imgs_wrap img:nth-of-type(3n) {
		margin-right: 15px;
	}
}
</style>
<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="../assets/img/favicon/favicon.ico" />

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
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />

<!-- Page CSS -->
<%
	BaseDAO bDAO = BaseDAO.getInstance();
	List<ProductVO> pList = bDAO.selectProductList();
	
	String afNum = request.getParameter("afNum");
	
	AdminForumDAO afDAO = AdminForumDAO.getInstance();
	
	AdForumVO afVO = afDAO.selectAdForum(afNum);
	
/* 	String topic = afVO.getAfTopic();
	String mainImg = afVO.getMainImg();
	String aID = afVO.getaID();
	String product = afVO.getpCode();
	String status = afVO.getAfStatus();
	String main = afVO.getAfMain();
	String postedDate = afVO.getPostedDate();
	String expiryDate = afVO.getExpiryDate(); */

	pageContext.setAttribute("afVO", afVO);
	%>

<!-- Helpers -->
<script src="../assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="../assets/js/config.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("#aID").val("<%= afVO.getaID() %>");
		$("#topic").val("<%= afVO.getAfTopic() %>");
		$("#forumMain").val("<%= afVO.getAfMain() %>")
		$("#status").val("<%= afVO.getAfStatus() %>")
		
		$("#preview").attr("src","http://localhost/badasaja/images/" + "<%= afVO.getMainImg() %>" )
		
	})
	
</script>
</head>

<body>
	
	<%@ include file="nav.jsp"%>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Menu -->
			<%@ include file="sidemenu.jsp"%>

			<!-- Layout container -->
			<div class="layout-page">
				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->

					<div class="container-xxl flex-grow-1 container-p-y">
						<h4 class="fw-bold py-3 mb-4">
							<span class="text-muted fw-light">Advertiserment/</span> Ad Forum Info
						</h4>

						<!-- Basic Layout -->
						<div class="row">
							<div class="col-xl">
								<div class="card mb-4">
									<div
										class="card-header d-flex justify-content-between align-items-center">
									</div>
									<div class="card-body">
											<div class="mb-3">
												<label class="form-label" for="basic-default-fullname">Board
													Topic</label> <input type="text" id="topic" name="topic"
													class="form-control" id="basic-default-fullname" readonly="readonly"
													placeholder="Banner Topic" />
											</div>

											<div class="mb-3">
												<label class="form-label" for="basic-default-company"
													style="margin-top: 10px;">Img</label>
												<div class="input-group">
													<!-- <input type="file" class="form-control" id="input_imgs" name="input_imgs" multiple="multiple"/>
                        <label class="input-group-text" for="inputGroupFile02">Upload</label> -->
													<table style="margin: 0px auto;">
														<tr>
															<td><img id="preview" /> <br />
															<br/></td>
															<td><img id="preview1" /> <br />
															<br /> </td>
															<td><img id="preview2" /> <br />
															<br /></td>
														</tr>
													</table>
												</div>
											</div>
											<div class="mb-3">
												<div class="input-group input-group-merge">
													<div class="mb-3" style="margin-right: 4%;">
														<label for="defaultSelect" class="form-label">Advertiser
															ID</label>
														<div class="input-group input-group-merge">
															<span id="basic-icon-default-fullname2"
																class="input-group-text"><i
																class="bx bx-user"></i></span> <input type="text"
																class="form-control" id="aID" name="aID"
																readonly="readonly"
																aria-describedby="basic-icon-default-fullname2" />
														</div>
														<div id="idCheck">&nbsp;&nbsp;&nbsp;&nbsp;</div>
													</div>
													<div class="mb-3" style="margin-right: 5%;">
														<label for="defaultSelect" class="form-label">카테고리</label>
														<input type="text" class="form-control" readonly="readonly" id="category" name="category" class="form-select"/>
													</div>
													<div class="mb-3">
														<label for="defaultSelect" class="form-label">상태</label>
														<input type="text" class="form-control" readonly="readonly" id="status" name="status" />
													</div>
												</div>
											</div>

											<div class="mb-3">
												<label class="form-label" for="basic-default-fullname">Board
													Main</label>
												<div class="input-group input-group-merge">
													<textarea class="form-control" id="forumMain"
														name="forumMain" aria-label="With textarea"
														readonly="readonly"
														style="height: 400px;"></textarea>
												</div>
											</div>

											<button type="button" id="send" name="send"
												class="btn btn-primary">작성</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Footer -->
					<footer class="content-footer footer bg-footer-theme">
						<div
							class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
							<div class="mb-2 mb-md-0">
								©
								<script>
									document.write(new Date().getFullYear());
								</script>
								, made with ❤️ by <a href="https://themeselection.com"
									target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
							</div>
							<div>
								<a href="https://themeselection.com/license/"
									class="footer-link me-4" target="_blank">License</a> <a
									href="https://themeselection.com/" target="_blank"
									class="footer-link me-4">More Themes</a> <a
									href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
									target="_blank" class="footer-link me-4">Documentation</a>

								<a
									href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
									target="_blank" class="footer-link me-4">Support</a>
							</div>
						</div>
					</footer>
					<!-- / Footer -->

				</div>
				<!-- Content wrapper -->
			</div>
			<!-- / Layout page -->
		</div>

		<!-- Overlay -->
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- / Layout wrapper -->

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