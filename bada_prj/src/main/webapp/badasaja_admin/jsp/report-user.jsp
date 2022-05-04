<%@page import="kr.co.sist.badasaja.vo.ReportVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.badasaja.admin.dao.AdminReportDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         info="유저신고 전체 조회 페이지"
         %>
         
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

    <title>Badasaja Admin</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../assets/img/favicon/badasaja.ico" />

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
        <script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript">
	$(function() {
		
		getSearchData()
		
		// ID 검색 event
		$("#idSearch").click(function(){
			
			getSearchData();
			
		}) // click 
		
		// 신고 유형 필터 검색 event
		$(".ty").click(function() {
			
			var ty = $(this).text();
			
			$("#type").attr("value", ty);
			$("#ty").html(ty);
			
			
			getSearchData();
		})
		
		// 상태 필터 검색 event
		$(".status").click(function(){
		var st = $(this).text();
		
		if(st == 'null'){
			st = "상태";
			
		}
		
		$("#st").attr("value", st);
		$("#status").html(st);
		
		getSearchData();
		
	})
		
	}) // ready
	
	// 유저 신고 조회 검색 ajax
	function getSearchData(){
		
		$.ajax({
			
			url:"http://211.63.89.157/bada_prj/badasaja_admin/jsp/report_user_process.jsp",
			data : {
				rID : $("#rID").val(),
				ty : $("#type").val(),
				st : $("#st").val(),
			},
			type:"get",
			dataType:"json",
			error:function( xhr ){
				alert( xhr.text + "/" + xhr.status);
			},
			success:function(jsonObj){
			 	 $("tbody").empty();
				if(jsonObj.resultData.length == 0){
					$("#tab > tbody").append("<tr><td colspan='5'><strong>조회결과 없음</strong></td></tr>"  )					
				}
				
				$.each(jsonObj.resultData, function(i, jsonObj){
				$("#tab > tbody").append("<tr><td class='redNum'>"+jsonObj.reportedID+"</td><td>"+jsonObj.reportID
						+"</td><td>"+jsonObj.crMain+"</td><td>"+jsonObj.rCategory+"</td><td>"+jsonObj.crDate
						+"</td><td>"+jsonObj.cfrStatus+"</td></tr>") 
				})	
					
					var tr = $("#tab tbody tr");
					var td = tr.children();
					var data = td.eq(0).text();
					if(data == '조회결과 없음'){
						$("#output").html("");
						return
					}
					var param = "redID=" + data
					
					printCrMain(param)
					
					$("tbody tr").click(function(e) {
							
							var tr = $(this);
							var td = tr.children();
							
							var data = td.eq(0).text();
							
							var param = "redID=" + data
							
							printCrMain(param)
						}) 
			},
			
		})
		
	} //getSearchData
	
	// 유저 신고 상세글 조회 ajax
	function printCrMain(param){
		
		$.ajax({
			url:"http://localhost/bada_prj/badasaja_admin/jsp/report_user_info_process.jsp",
			type:"get",
			data: param,
			async: true,
			dataType:"json",
			error:function( xhr ){
				alert( xhr.text + "/" + xhr.status);
			},
			success:function(jsonObj){
				$("#output").html(jsonObj.crMain);
			}
			
		}) // ajax
		
	}
	
	
	</script>
 </head>



<body>
<%
AdminReportDAO arDAO = AdminReportDAO.getInstance();

List<ReportVO> rList = arDAO.selectReport();

pageContext.setAttribute("rList", rList);
%>

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

          <div class="tab-content doc-example-content" id="tab-tabContent" data-label="Example">
            <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Report /</span>계정 신고 리스트</h4>
   				<div class="card" style="height:500px; overflow-y:scroll;">
                        <!-- Search -->
                        <div class="navbar-nav mb-3">
                            <div class="nav-item d-inline">
                                <input type="hidden" id="st" name="st">
                                <button type="button" id="status" name="status" class="btn btn-outline-primary dropdown-toggle float-end" data-bs-toggle="dropdown" style="margin:15px;" >상태</button>
                                <ul class="dropdown-menu">
                                    <li class="status"><a class="dropdown-item" href="javascript:void(0);">상태</a></li>
                                    <li class="status"><a class="dropdown-item" href="javascript:void(0);">처리중</a></li>
                                    <li class="status"><a class="dropdown-item" href="javascript:void(0);">처리완료</a></li>
                                </ul>
                                <input type="hidden" id="type" name="type"/>
                                <button type="button" id="ty" name="ty" class="btn btn-outline-primary dropdown-toggle float-end" data-bs-toggle="dropdown" style="margin-top:15px; margin-left:20px;" >
                                <c:choose>
												<c:when test="${ not empty param.type }">${ param.type }</c:when>
												<c:when test="${ empty param.type }">신고사유</c:when>
                                </c:choose>
                                </button>
                                <ul class="dropdown-menu">
                                    <li class="ty"><a class="dropdown-item" href="javascript:void(0);">신고사유</a></li>
                                    <c:forEach var="data" items="${rList }">
										<li class="ty"><a class="dropdown-item" href="javascript:void(0)"><c:out	value="${ data.rCategory }" /></a></li>
								  </c:forEach>
                                </ul>
                                <a href="javascript:void(0)" id="idSearch" class="btn btn-primary float-end shadow-none" style="margin-top:15px; margin-left:10px">검색</a>
                                <input
                                        type="text"
                                        id="rID"
                                        name="rID"
                                        class="form-control shadow-none float-end"
                                        placeholder="신고자_ID검색"
                                        style="margin-top: 15px;width: 150px;"
                                />
                            </div>
                        </div>
                   <!-- /Search -->
                    	<div class="table-responsive text-nowrap">
        					<table id="tab" class="table table-hover">
       							<thead>
        						  <tr>
				                   <th>원고_ID</th>
				                   <th>피고_ID</th>
				                   <th>본문</th>
				                   <th>카테고리</th>
				                   <th>작성일</th>
				                   <th>상태</th>
       							  </tr>
      						    </thead>
       						    <tbody class="table-border-bottom-0">
     						    </tbody>
    					  </table>
   						</div>
  					</div>
   				<!-- /Report -->		
   						<h5 class="card-header">상세보기</h5>
  						<div class="card">
     						<div id="output" class="card-body" >
      						</div>
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

