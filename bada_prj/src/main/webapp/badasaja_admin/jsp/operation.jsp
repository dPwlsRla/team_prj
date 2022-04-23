<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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

    <title>Tables - Basic Tables | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

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
 </head>



<body>

<%@ include file="nav.jsp"%>

<div class="layout-wrapper layout-content-navbar">
  <div class="layout-container">
    <!-- Menu -->
    <%@ include file="sidemenu.jsp"%>
    <!-- / Menu -->
    <div class="layout-page">
      <!-- Content wrapper -->
      <div class="content-wrapper">
        <!-- Content -->

        <div class="container-xxl flex-grow-1 container-p-y">
		 <div class="container-xxl flex-grow-1 container-p-y">
            <!-- Basic Bootstrap Table -->
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Notice /</span>운영자 공지</h4>
                <div class="card" style="height:400px; overflow-y:scroll;">
                   <!-- Search -->
                   <div class="navbar-nav mb-3">
                       <div class="nav-item d-inline">
                           <a href="#" class="btn btn-primary float-end shadow-none" style="margin:15px;">검색</a>
                           <input
                                 type="text"
                                 class="form-control shadow-none float-end"
                                 placeholder="운영자 ID 검색"
                                 style="margin-top: 15px; width: 150px;"
                           />
                       </div>
                   </div>
                   <!-- /Search -->
                   <div class="table-responsive text-nowrap">
                      <table class="table">
                          <thead>
                          <tr>
                             <th>번호</th>
                             <th>내용</th>
                             <th>작성자</th>
                             <th>작성일</th>
                           </tr>
                           </thead>
                           <tbody class="table-border-bottom-0">
                           <tr>
                              <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>1</strong></td>
                              <td>UI 디자인이 상당수 바뀌었습니다. 확인바랍니다.</td>
                              <td>cok893</td>
                              <td>2022.04.18</td>
                           </tr>  
                           <tr>
                              <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>2</strong></td>
                              <td>UI 디자인이 상당수 바뀌었습니다. 확인바랍니다.</td>
                              <td>cok893</td>
                              <td>2022.04.18</td>
                           </tr>  
                           <tr>
                              <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>3</strong></td>
                              <td>UI 디자인이 상당수 바뀌었습니다. 확인바랍니다.</td>
                              <td>cok893</td>
                              <td>2022.04.18</td>
                           </tr>  
                           <tr>
                              <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>4</strong></td>
                              <td>UI 디자인이 상당수 바뀌었습니다. 확인바랍니다.</td>
                              <td>cok893</td>
                              <td>2022.04.18</td>
                           </tr>  
                           </tbody>
                      </table>
                  </div>
             </div>            
	  	 </div>	
	  				
		 <div class="container-xxl flex-grow-1 container-p-y">
            <!-- Basic Bootstrap Table -->
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Prohibit /</span>작성 금지 키워드</h4>
                <div class="card" style="height:400px; overflow-y:scroll;">
                   <!-- Search -->
                   <div class="navbar-nav mb-3">
                       <div class="nav-item d-inline">
                           <a href="#" class="btn btn-primary float-end shadow-none" style="margin:15px;">검색</a>
                           <input
                                 type="text"
                                 class="form-control shadow-none float-end"
                                 placeholder="단어 검색"
                                 style="margin-top: 15px;width: 150px;"
                           />
                       </div>
                   </div>
                   <!-- /Search -->
                   <div class="table-responsive text-nowrap">
                      <table class="table">
                          <thead>
                          <tr>
                             <th>번호</th>
                             <th>키워드</th>
                           </tr>
                           </thead>
                           <tbody class="table-border-bottom-0">
                           <tr>
                              <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>1</strong></td>
                              <td>담배</td>
                           </tr>  
                           <tr>
                              <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>2</strong></td>
                              <td>술</td>
                           </tr>  
                           </tbody>
                      </table>
                  </div>
             </div>            
             

			<form>
			<div class="input-group mb-3">
  				<input type="text" class="form-control" placeholder="게시글 작성 금지 키워드를 입력해주세요">
  				<button class="btn btn-outline-secondary" type="button" id="writeKey">입력</button>
			</div>
			</form>
          </div>
        </div>
      </div>
    </div>
  </div>

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

