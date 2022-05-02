<%@page import="kr.co.sist.badasaja.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.badasaja.admin.dao.BaseDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="배너 광고 등록 페이지"
    %>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
session.setAttribute("insertBannerFlag", false);
request.setCharacterEncoding("utf-8");
int filecounter = 0;
if (request.getParameter("addcnt") != null) {
	filecounter = Integer.parseInt(request.getParameter("addcnt"));
}
%>
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Vertical Layouts - Forms | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="../assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="../assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->

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
	$(function() {
		
			
		$("#aID").focusout(function() {
			
			var aID = $("#aID").val();
			
			if(aID == ""){
				$("#idCheck").html("아이디는 필수 입력 입니다.");
				return;
			}
			
			$.ajax({
				url:"id_check.jsp",
				data: { "aID" : aID},
				type:"get",
				dataType:"json",
				error:function( xhr ){
					alert( xhr.status)
				},
				success:function( jsonObj ){
					
					var flag = jsonObj.flag
					 if(flag){
						$("#idCheck").css({"color" : ""});
						$("#idCheck").html("");
						return
					 }
						$("#idCheck").css({"color" : "red"});
						$("#idCheck").html("존재하지 않는 아이디 입니다.");
					
				},
				
			}) // ajax
			
		}) // focusout
		
		$("#send").click(function(){
			
			if($("#aID").val == ""){
				alert("ID는 필수 입력 값입니다.");
				$("#aID").focus();
				return;
			}
			
			if ($("#idCheck").val() == "존재하지 않는 아이디 입니다.") {
				alert("광고주 아이디를 확인 해주세요");
				$("#aID").focus();
				return;
			}
			
			if($("#bURL").val == ""){
				alert("URL을 입력해주세요.");
				$("#aID").focus();
				return;
			}
			
			if( ($("#bImg").val()=="") ){
				alert("이미지는 필수 입니다.");
				$("#bImg").focus();
				return;
			}
			
			if ($("#category option:selected").val() == "none") {
				alert("카테고리를 선택해주세요.");
				return;

			}
			
			$("#writeBanner").submit();
			
		}) // click
		
		
	}) //ready 
	</script>

  </head>

  <body>
  <%
  
  	BaseDAO bDAO = BaseDAO.getInstance();
	List<ProductVO> pList = bDAO.selectProductList();

	pageContext.setAttribute("pList", pList);
  
  %>
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
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">WriteAds/</span> Write Banner</h4>

              <!-- Basic Layout -->
              <div class="row">
                <div class="col-xl">
                  <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                    </div>
                    <div class="card-body">
                      <form action="write_banner_process.jsp" method="post" id="writeBanner" enctype="multipart/form-data">
                        <div class="mb-3">
                          <label class="form-label" for="basic-default-fullname">Advertiser_ID</label>
                          <input type="text" class="form-control" id="aID" name="aID" placeholder="Advertiser_ID" />
                          <div id="idCheck"></div>
                        </div>
                        <label class="form-label" for="basic-default-company">Banner URL</label>
                        <div class="input-group input-group-merge">
                        <span class="input-group-text" id="basic-addon34">https://</span>
                        <input type="text" class="form-control" id="bURL" name="bURL" aria-describedby="basic-addon34" />
                        </div>
                        
                      <div class="mb-3">
                      	  <label class="form-label" for="basic-default-company" style="margin-top: 10px;">Img</label>
                      <div class="input-group">
                        <input type="file" class="form-control" id="bImg" name="bImg" />
                        <label class="input-group-text" for="inputGroupFile02">Upload</label>
                      </div>
                      </div>
                        
                        <div class="mb-3">
                          <div class="input-group input-group-merge">
                          <div class="mb-3">
                        <label for="defaultSelect" class="form-label">Category</label>
                        <select id="category" name="category" class="form-select">
                          <option value="none">카테고리 선택</option>
						<c:forEach items="${ pList }" var="data">
							<option value="${ data.pCode }">${ data.product }</option>
						</c:forEach>
                        </select>
                      </div>
                     </div>
                     </div>
                        	<button type="button" id="send" name="send"
							class="btn btn-primary">작성</button>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
             </div>
            <!-- Footer -->
            <footer class="content-footer footer bg-footer-theme">
              <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                <div class="mb-2 mb-md-0">
                  ©
                  <script>
                    document.write(new Date().getFullYear());
                  </script>
                  , made with ❤️ by
                  <a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
                </div>
                <div>
                  <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
                  <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>

                  <a
                    href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
                    target="_blank"
                    class="footer-link me-4"
                    >Documentation</a
                  >

                  <a
                    href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
                    target="_blank"
                    class="footer-link me-4"
                    >Support</a
                  >
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
    <script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

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