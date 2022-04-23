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
                    <div class="card" style="margin-bottom:100px">
                        <!-- Search -->
                        <div class="navbar-nav mb-3">
                            <div class="nav-item d-inline">
                                <button type="button" class="btn btn-outline-primary dropdown-toggle float-end" data-bs-toggle="dropdown" style="margin:15px" >상태</button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="javascript:void(0);">게시중</a></li>
                                    <li><a class="dropdown-item" href="javascript:void(0);">게시종료</a></li>
                                </ul>
                                <button type="button" class="btn btn-outline-primary dropdown-toggle float-end" data-bs-toggle="dropdown" style="margin-top:15px; margin-left:15px; " >지역</button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="javascript:void(0);">종로구</a></li>
                                    <li><a class="dropdown-item" href="javascript:void(0);">서대문구</a></li>
                                    <li><a class="dropdown-item" href="javascript:void(0);">성동구</a></li>
                                </ul>
                                <a href="#" class="btn btn-primary float-end shadow-none" style="margin-top:15px; margin-left:10px">검색</a>
                                <input
                                        type="text"
                                        class="form-control shadow-none float-end"
                                        placeholder="Customer_ID검색"
                                        style="margin-top: 15px;width: 150px;"
                                />
                            </div>
                        </div>
                        <!-- /Search -->
                        <div class="table-responsive text-nowrap">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>아이디</th>
                                    <th>닉네임</th>
                                    <th>계정 상태</th>
                                    <th>지역코드</th>
                                    <th>가입일</th>
                                    <th>접속일자</th>
                                </tr>
                                </thead>
                                <tbody class="table-border-bottom-0">
                                <tr>
                                    <td>cok854</td>
                                    <td>하하하하</td>
                                    <td>휴면 계정</td>
                                    <td>종로구</td>
                                    <td>2022.04.01</td>
                                    <td>2022.04.01</td>
                                </tr>
                                </tbody>
                            </table>

                        </div>
                    </div>
                    <div class="card">
                        <!-- Search -->
                        <div class="navbar-nav">
                            <div class="nav-item d-inline">
                                <h5 class="card-header" style="height:30px; display: inline-block">회원 상세 정보</h5>
                            </div>
                        </div>
                        <!-- /Search -->
                        <div class="user-grid">
                            <div class="user-avatar">
                                <img id="avatar" src="../assets/img/avatars/1.png"/>
                                <a href="#" class="avatar-name">
                                    <span class="app-brand-text demo fw-bolder ms-2">User Name</span>
                                </a>
                            </div>
                            <div>
                                <div class="customer-line">
                                    <div class = "customer-div4"><span class="customer-info" id="customer-id">ID : cok854</span></div>
                                    <div class = "customer-div4"><span class="customer-info" id="customer-gender">gender : f</span></div>
                                    <div class = "customer-div4"><span class="customer-info" id="customer-writes">게시글 수 : 12</span></div>
                                    <div class = "customer-div4"><span class="customer-info" id="customer-register">가입일 : 2022.04.01</span></div>
                                </div>
                                <div class="customer-line">
                                    <div class = "customer-div3"><span class="customer-info" id="customer-email">email: cok854@naver.com</span></div>
                                    <div class = "customer-div3"><span class="customer-info" id="customer-score">거래만족도 : 4.2</span></div>
                                    <div class = "customer-div3"><span class="customer-info" id="customer-login">접속일 : 2022.04.01</span></div>
                                </div>
                                <div class="customer-line">
                                    <div class = "customer-div3"><span class="customer-info" id="phone">phone number : 010-3824-3932</span></div>
                                    <div class = "customer-div3"><span class="customer-info" id="reports">신고 받은 건수 : 1</span></div>
                                    <div class = "customer-div3"><span class="customer-info">계정 상태</span>
                                        <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" style="width: 50px; height: 30px;
    																																margin-left: 10px; padding:0px" >no</button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="javascript:void(0);">가전제품</a></li>
                                            <li><a class="dropdown-item" href="javascript:void(0);">의류</a></li>
                                            <li><a class="dropdown-item" href="javascript:void(0);">식품</a></li>
                                        </ul></div>
                                </div>
                            </div>
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
