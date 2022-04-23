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
                    <div class="card" style="margin-bottom:30px">
                        <!-- Search -->
                        <div class="navbar-nav">
                            <div class="nav-item d-inline">
                                <a href="#" class="btn-sm btn-secondary float-end shadow-none" style="margin:20px">글쓰기</a>
                                <h5 class="card-header" style="height:30px; display: inline-block">광고 게시글 리스트</h5>
                                <button type="button" class="btn btn-outline-secondary dropdown-toggle float-end" data-bs-toggle="dropdown" style="margin-top:15px; margin-left:10px; " >카테고리 필터</button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="javascript:void(0);">가전제품</a></li>
                                    <li><a class="dropdown-item" href="javascript:void(0);">의류</a></li>
                                    <li><a class="dropdown-item" href="javascript:void(0);">식품</a></li>
                                </ul>
                                <a href="#" class="btn btn-secondary float-end shadow-none" style="margin-top:15px; margin-left:10px">검색</a>
                                <input
                                        type="text"
                                        class="form-control shadow-none float-end"
                                        placeholder="조회 키워드"
                                        aria-label="조회 키워드"
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
                                    <th>제목</th>
                                    <th>지역</th>
                                    <th>상태</th>
                                    <th>상품카테고리</th>
                                    <th>작성일</th>
                                    <th>작성자ID</th>
                                    <th>광고주ID</th>
                                </tr>
                                </thead>
                                <tbody class="table-border-bottom-0">
                                <tr>
                                    <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>1</strong></td>
                                    <td>바나나우유 딸기...</td>
                                    <td>종로구</td>
                                    <td>거래완료</td>
                                    <td>생필품</td>
                                    <td>2022.04.01</td>
                                    <td>cok893</td>
                                    <td>cok893</td>

                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!--/ Basic Bootstrap Table -->

                    <div class="card" style="margin-bottom:30px">
                        <!-- Search -->
                        <div class="navbar-nav">
                            <div class="nav-item d-inline">
                                <a href="#" class="btn-sm btn-secondary float-end shadow-none" style="margin:20px">글쓰기</a>
                                <h5 class="card-header" style="height:30px; display: inline-block">광고 배너 리스트</h5>
                                <button type="button" class="btn btn-outline-secondary dropdown-toggle float-end" data-bs-toggle="dropdown" style="margin-top:15px; margin-left:10px; " >카테고리 필터</button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="javascript:void(0);">가전제품</a></li>
                                    <li><a class="dropdown-item" href="javascript:void(0);">의류</a></li>
                                    <li><a class="dropdown-item" href="javascript:void(0);">식품</a></li>
                                </ul>
                                <a href="#" class="btn btn-secondary float-end shadow-none" style="margin-top:15px; margin-left:10px">검색</a>
                                <input
                                        type="text"
                                        class="form-control shadow-none float-end"
                                        placeholder="조회 키워드"
                                        aria-label="조회 키워드"
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
                                    <th>제목</th>
                                    <th>지역</th>
                                    <th>상태</th>
                                    <th>상품카테고리</th>
                                    <th>작성일</th>
                                    <th>작성자ID</th>
                                    <th>광고주ID</th>
                                </tr>
                                </thead>
                                <tbody class="table-border-bottom-0">
                                <tr>
                                    <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>1</strong></td>
                                    <td>바나나우유 딸기...</td>
                                    <td>종로구</td>
                                    <td>거래완료</td>
                                    <td>생필품</td>
                                    <td>2022.04.01</td>
                                    <td>cok893</td>
                                    <td>cok893</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="card">
                        <!-- Search -->
                        <div class="navbar-nav">
                            <div class="nav-item d-inline">
                                <h5 class="card-header" style="height:30px; display: inline-block">광고주</h5>
                                <a href="#" class="btn btn-secondary float-end shadow-none" style="margin:15px">검색</a>
                                <input
                                        type="text"
                                        class="form-control shadow-none float-end"
                                        style="margin-top: 15px;width: 200px;"
                                />
                            </div>
                        </div>
                        <!-- /Search -->
                        <div class="table-responsive text-nowrap">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>광고주코드</th>
                                    <th>광고주명</th>
                                    <th>지역</th>
                                    <th>계약일</th>
                                    <th>만료일</th>
                                </tr>
                                </thead>
                                <tbody class="table-border-bottom-0">
                                <tr>
                                    <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>1</strong></td>
                                    <td>fed</td>
                                    <td>종로돼지</td>
                                    <td>종로구</td>
                                    <td>2022.04.01</td>
                                    <td>2022.04.01</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
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
    