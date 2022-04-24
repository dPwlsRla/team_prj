<%@page import="kr.co.sist.badasaja.vo.AdvertiserVO"%>
<%@page import="kr.co.sist.badasaja.admin.dao.AdminAdDAO"%>
<%@page import="kr.co.sist.badasaja.vo.LocalVO"%>
<%@page import="kr.co.sist.badasaja.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.badasaja.admin.dao.BaseDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      <!-- jQuery CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript">
    $(function(){
    	
		$("#idSearch").click(function() {
			
			 var local = '<%= request.getParameter("local") %>';
			 
			if(local == 'null'){
				pr="지역";
			} 
			
			$("#local").attr("value", local);
			$("#lc").html(local)
			$("#searchFrm").submit();
			
		})
		
		$(".lc").click(function(){
			var local = $(this).text();
			
			$("#local").attr("value", local);
			$("#lc").html(local)
			
			$("#searchFrm").submit();
		})
    	
    	
    }) // ready
    
    </script>
 </head>

<body>
<%
	BaseDAO bDAO = BaseDAO.getInstance();
	List<LocalVO> lList = bDAO.selectLocalList();
	
	String aID = request.getParameter("aID");
	String local = request.getParameter("local");
	
	if( local == null || local.equals("지역")){
		local="";
	}
	
	AdminAdDAO adDAO = AdminAdDAO.getInstance();
	List<AdvertiserVO> avList = adDAO.selectAllAdvertiser(aID, local);
	
	pageContext.setAttribute("lList", lList);
	pageContext.setAttribute("avList", avList);
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

                   	<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Advertiser /</span>광고주</h4>
                    <div class="card" style="height:800px; overflow-y:scroll">
                        <!-- Search -->
                       <form action="advertiser.jsp" id="searchFrm" name="searchFrm">
                        <div class="navbar-nav mb-3">
                            <div class="nav-item d-inline">
                                <a href="#void" id="idSearch" class="btn btn-primary float-end shadow-none" style="margin:15px">검색</a>
                                <input
                                        type="text"
                                        name="aID"
                                        value="${ param.aID }"
                                        class="form-control shadow-none float-end"
                                        placeholder="광고주_ID 검색"
                                        style="margin-top: 15px;width: 200px;"
                                />
                            	<button type="button" class="btn btn-outline-primary dropdown-toggle float-end" data-bs-toggle="dropdown" style="margin-top:15px; margin-right:15px;" >
                            	      <c:choose>
								 	<c:when test="${ not empty param.local }">${ param.local }</c:when>
									<c:when test="${ empty param.local }">지역</c:when>
								</c:choose>
                            	</button>
                            	<input type="hidden" name="local" id="local"/>
                                <ul class="dropdown-menu">
                                		<li class="lc"><a class="dropdown-item" href="javascript:void(0)">지역</a></li>
                                	<c:forEach var="data" items="${lList }">
										<li class="lc"><a class="dropdown-item" href="javascript:void(0)"><c:out value="${ data.guName }"/></a></li>
									</c:forEach>
                                </ul>
                            </div>
                        </div>
                       </form> 
                        <!-- /Search -->
                        <div class="table-responsive text-nowrap">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>광고주_ID</th>
                                    <th>광고주명</th>
                                    <th>지역</th>
                                    <th>계약일</th>
                                    <th>만료일</th>
                                </tr>
                                </thead>
                                <tbody class="table-border-bottom-0">
                                <c:choose>
										<c:when test="${ empty avList }">
											<tr>
												<td colspan="5"><strong>조회결과 없음</strong></td>
											</tr>
										</c:when>
									</c:choose>
										<c:forEach items="${ avList }" var="data">
											<tr>
												<td><i class="fab fa-angular fa-lg text-danger me-3"></i>
												<strong><c:out value="${ data.aID }" /></strong></td>
												<td><c:out value="${ data.aName }" /></td>
												<td><c:out value="${ data.guCode }" /></td>
												<td><c:out value="${ data.contractDate }" /></td>
												<td><c:out value="${ data.expiryDate }" /></td>
											</tr>
										</c:forEach>
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
    