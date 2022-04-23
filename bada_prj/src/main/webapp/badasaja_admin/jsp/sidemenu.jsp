<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

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

       <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <a href="index.jsp" class="app-brand-link">
              <span class="app-brand-text demo menu-text fw-bolder ms-2">BaDaSaJa</span>
            </a>

            <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
              <i class="bx bx-chevron-left bx-sm align-middle"></i>
            </a>
          </div>

          <div class="menu-inner-shadow"></div>

          <ul class="menu-inner py-1">
            <!-- Dashboard -->
            <li class="menu-item">
              <a href="index.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Analytics">Dashboard</div>
              </a>
            </li>

            <!-- 광고부분 -->
            <li class="menu-header small text-uppercase">
              <span class="menu-header-text">profitability</span>
            </li>
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                <div data-i18n="Account Settings">Advertisement</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="ad_forum_list.jsp" class="menu-link">
                    <div data-i18n="Account">Ad Forum List</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="ad_banner_list.jsp" class="menu-link">
                    <div data-i18n="Notifications">Ad Banner List</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="advertiser.jsp" class="menu-link">
                    <div data-i18n="Connections">Advertiser</div>
                  </a>
                </li>
                   <li class="menu-item">
                  <a href="advertiser_registeration.jsp" class="menu-link">
                    <div data-i18n="Connections">Advertiser Registration</div>
                  </a>
                </li>
              </ul>
            </li>
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                <div data-i18n="Account Settings">Write Ads</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="write_ad_forum.jsp" class="menu-link">
                    <div data-i18n="Account">Write Ad Forum</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="write_banner.jsp" class="menu-link">
                    <div data-i18n="Notifications">Write Ad Banner </div>
                  </a>
                </li>
              </ul>
            </li>
            <!-- 회원부분 -->
            <li class="menu-header small text-uppercase">
              <span class="menu-header-text">customer</span>
            </li>
            <li class="menu-item">
              <a href="customer.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-cube-alt"></i>
                <div data-i18n="Misc">Customer List</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="forum.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-cube-alt"></i>
                <div data-i18n="Misc">CForum List</div>
              </a>
            </li>
            <li class="menu-header small text-uppercase">
              <span class="menu-header-text">management</span>
            </li>
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-lock-open-alt"></i>
                <div data-i18n="Authentications">Report</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="report-post.jsp" class="menu-link">
                    <div data-i18n="Basic">CForum_Report</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="report-user.jsp" class="menu-link">
                    <div data-i18n="Basic">Customer_Report</div>
                  </a>
                </li>
              </ul>
            </li>
            <!-- 운영부분 -->
            <li class="menu-header small text-uppercase">
            <span class="menu-header-text">Operation</span>
            </li>
            <li class="menu-item">
              <a href="operation.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-collection"></i>
                <div data-i18n="Basic">Operate</div>
              </a>
            </li>
          </ul>
	</aside>