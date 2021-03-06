<%@page import="kr.co.sist.badasaja.vo.AdForumVO"%>
<%@page import="kr.co.sist.badasaja.admin.dao.AdminForumDAO"%>
<%@page import="kr.co.sist.badasaja.admin.dao.AdminAdDAO"%>
<%@page import="kr.co.sist.badasaja.vo.ProductVO"%>
<%@page import="kr.co.sist.badasaja.vo.LocalVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.badasaja.admin.dao.BaseDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="광고 게시글 상세조회 페이지"%>
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
pageContext.setAttribute("pList", pList);

String afNum = request.getParameter("afNum");

pageContext.setAttribute("afNum", afNum);
if (afNum == null) {
	response.sendRedirect("login.jsp");
	return;
}

AdminForumDAO afDAO = AdminForumDAO.getInstance();

AdForumVO afVO = afDAO.selectAdForum(afNum);

pageContext.setAttribute("afVO", afVO);

String imgs = afDAO.selectAdImg(afNum);
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
		
		var afNum = '<%=afNum%>';
		
		$("#aID").val("<%=afVO.getaID()%>");
		$("#topic").val("<%=afVO.getAfTopic()%>");
		$("#forumMain").val("<%=afVO.getAfMain()%>")
		$("#category").val("<%=afVO.getpCode()%>")
		$("#status").val("<%=afVO.getAfStatus()%>")
		$("#preview").attr("src","../upload/" + "<%=afVO.getMainImg()%>" )
		
		var str = '<%=imgs%>';
		if (str == "") {
			return;
		}
		var imgs = str.split(",");
		if (imgs.length == 1) {
			$("#preview1").attr("src", "../upload/" + imgs[0])
		} else if (imgs.length == 2) {
			$("#preview1").attr("src", "../upload/" + imgs[0])
			$("#preview2").attr("src", "../upload/" + imgs[1])
		}

		$("#modify").click(	function() {
			if ($("#topic").val().trim() == "") {
				alert("제목을 입력해주세요");
				$("#topic").focus();
				return;
			}

			if ($("#forumMain").val() == "") {
				alert("내용을 입력해주세요")
				$("#forumMain").focus();
				return;
			}
			
				$.ajax({
						url : "ad_forum_modify_process.jsp",
						data : {
						afNum : afNum,
						topic : $("#topic").val(),
						main : $("#forumMain").val(),
						pr : $("#category option:selected").val(),
						st : $("#status option:selected").val(),
						},
						type : "post",
						error : function(xhr) {
						alert(xhr.text + "/" + xhr.status);
						},
						success : function() {
						alert("변경 되었습니다.")
						location.href="ad_forum_list.jsp";
						},

					})

				}) // click 

/* 		$("#del").click(function() {

			$.ajax({
				url : "http://localhost/bada_prj/badasaja_admin/jsp/ad_forum_delete_process.jsp",
				data : {
					afNum : afNum,
				},
				type : "get",
				error : function(xhr) {
					alert(xhr.text + "/" + xhr.status);
				},
				success : function() {
				alert("삭제 되었습니다.")
					location.replace("http://localhost/bada_prj/badasaja_admin/jsp/ad_forum_list.jsp")
				},

			})

	}) // click */

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
							<span class="text-muted fw-light">Advertiserment/</span>Ad Forum
							Info
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
												class="form-control" id="basic-default-fullname"
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
														<td style="padding: 30px;"><img id="preview" /> <br />
															<br /></td>
														<td style="padding: 30px;"><img id="preview1" /> <br />
															<br /></td>
														<td style="padding: 30px;"><img id="preview2" /> <br />
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
															class="input-group-text"><i class="bx bx-user"></i></span>
														<input type="text" class="form-control" id="aID"
															name="aID" readonly="readonly"
															aria-describedby="basic-icon-default-fullname2" />
													</div>
													<div id="idCheck">&nbsp;&nbsp;&nbsp;&nbsp;</div>
												</div>
												<div class="mb-3" style="margin-right: 5%;">
													<label for="defaultSelect" class="form-label">카테고리</label>
													<select id="category" name="category" class="form-select">
														<c:forEach items="${ pList }" var="data">
															<option value="${ data.pCode }">${ data.product }</option>
														</c:forEach>
													</select>
												</div>
												<div class="mb-3">
													<label for="defaultSelect" class="form-label">상태</label> <select
														id="status" name="status" class="form-select">
														<option value="게시중">게시중</option>
														<option value="삭제">삭제</option>
													</select>
												</div>
											</div>
										</div>

										<div class="mb-3">
											<label class="form-label" for="basic-default-fullname">Board
												Main</label>
											<div class="input-group input-group-merge">
												<textarea class="form-control" id="forumMain"
													name="forumMain" aria-label="With textarea"
													style="height: 400px;"></textarea>
											</div>
										</div>

										<button type="button" id="modify" name="modify"
											class="btn btn-primary" style="margin-right: 20px;">수정</button>
									</div>
								</div>
							</div>
						</div>
					</div>

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