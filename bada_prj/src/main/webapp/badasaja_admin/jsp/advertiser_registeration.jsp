<%@page import="kr.co.sist.badasaja.admin.dao.AdminAdDAO"%>
<%@page import="kr.co.sist.badasaja.vo.LocalVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.badasaja.admin.dao.BaseDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="광고주등록페이지"
    %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
 	session.setAttribute("insertAdvertiserFlag", false);
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
	<!-- jQuery CDN -->
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript">
	$(function() {
		
		// ID작성 안했을 시 확인 event
		$("#aID").focusout(function() {
			
			var aID = $("#aID").val();
			
			if(aID == ""){
				$("#idCheck").html("아이디는 필수 입력 입니다.");
				$("#aID").focus();
				return;
			}
			
		 	// 특수문자 검증
			const regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
			if(regExp.test($("#aID").val())){
				$("#idCheck").css({"color" : "red"});
				$("#idCheck").html("특수문자는 사용 불가능 합니다.");
				$("#aID").focus();
				return;
			}
			 
			// ID작성 했을 때 ID 존재여부 확인 ajax
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
						$("#idCheck").css({"color" : "red"});
						$("#idCheck").html("중복된 아이디 입니다.");
						return;
					 }
						$("#idCheck").css({"color" : ""});
						$("#idCheck").html("사용 가능한 아이디 입니다");
					
				},
				
			}) // ajax
			
		})
		
		// 등록 event
		$("#send").click(function(){
			
			// ID 입력 확인 검증
			if($("#aID").val().trim() == ""){
				alert("ID는 필수 입력 입니다.");
				$("#aID").focus();
				return;
			}
			
		
			// 중복, 특수문자  확인 검증
			if( $("#idCheck").html() == "중복된 아이디 입니다." || $("#idCheck").html() == "특수문자는 사용 불가능 합니다." ){
				alert("사용 불가능한 아이디 입니다. 다시 입력 해주세요.")
				$("#aID").focus();
				return;
				
			}
			
			// 이름 미입력 검증
			if($("#aName").val().trim() == ""){
				alert("이름은 필수 입력 값 입니다.");
				$("#aName").focus();
				return;
			}
			
			// 지역 미입력 검증
			if($("#local option:selected").val() == "none"){
				alert("지역을 선택해주세요.");
				$("#local").focus();
				return;
			}
			
			// 검증 통과 후 등록
			$("#advertiserRegister").submit();
			
		}) // click
		
	}) // ready  
    </script>
    </head>

  <body>
  <%
  BaseDAO bDAO = BaseDAO.getInstance();
  List<LocalVO> lList = bDAO.selectLocalList();
  
  pageContext.setAttribute("lList", lList);
  
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
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Advertiser Registeration</span> 광고주 등록</h4>

              <!-- Basic Layout -->
              <div class="row">
                <div class="col-xl">
                  <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                    </div>
                    <div class="card-body">
                      <form action="advertiser_registeration_process.jsp" id="advertiserRegister" method="post">
                        <div class="mb-3">
                          <label class="form-label" for="basic-default-fullname">Advertiser ID</label>
                          <input type="text" class="form-control" id="aID" name="aID" placeholder="Advertiser ID" />
                          <div id="idCheck">&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        </div>
                        <div class="mb-3">
                          <label class="form-label" for="basic-default-company">Advertiser Name</label>
                          <input type="text" class="form-control" id="aName" name="aName" placeholder="Advertiser Name" />
                        </div>
                        <div class="mb-3">
                          <div class="input-group input-group-merge">
                          <div class="mb-3">
                        <label for="defaultSelect" class="form-label">Seoul</label>
                        <select id="local" name="local" class="form-select">
                          <option value="none">지역 선택</option>
                          <c:forEach items="${ lList }" var="data">
                          	<option  value="${ data.guCode }">${data.guName }</option>
                          </c:forEach>
                        </select>
                      </div>
                     </div>
                     </div>
                        <button type="button" id="send" name="send" class="btn btn-primary">Send</button>
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
