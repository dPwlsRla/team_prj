<%@page import="kr.co.sist.badasaja.vo.LocalVO"%>
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
    <!-- jQuery CDN -->
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript">
	$(function(){
		
		getSearchData();
		
		// ID??? ???????????? ???
		$("#idSearch").click(function(){
			getSearchData()
		}) // click
		
		// ???????????? ???????????? ???
		$(".local").click(function() {
			
			var gu = $(this).text();
			
			$("#gu").attr("value", gu);
			$("#local").html(gu);
			
			getSearchData()
			
		}) // click
		
		// ????????? ???????????? ???
		$(".status").click(function(){
			var st = $(this).text();
			
			if(st == 'null'){
				st = "??????";
				
			}
			
			$("#st").attr("value", st);
			$("#status").html(st);
			
			getSearchData()
		}) // click
		
		// ?????? ?????? ???????????? ???
		$(".ustatus").click(function(){
			var ust = $(this).text();
			var cID = $("#customer-id").html().substr(5);
			
			if(ust == 'null'){
				ust = "??????";
			}
			
			$("#ust").attr("value", ust);
			$("#ustatus").html(ust);
			
			var param = "cID="+cID+"&ust="+ust;
			
			 modifyStatus(param);
			 
			})
			
		
	}) //ready 
	
	// ?????? ?????? ajax
	function getSearchData(){
		
		$.ajax({
			url:"customer_process.jsp",
			data: {
				cID : $("#cID").val(),
				gu : $("#gu").val(),
				st : $("#st").val(),
			},
			type:"get",
			async: true,
			dataType:"json",
			error:function(xhr){
				alert( xhr.text + "/" + xhr.status);
			},
			success:function(jsonObj){
				 $("#tab tbody").empty();
					if(jsonObj.resultData.length == 0){
						$("#tab > tbody").append("<tr><td colspan='5'<strong>???????????? ??????</strong></td></tr>"  )					
					}
				$.each(jsonObj.resultData, function(i, jsonObj){
			 	$("#tab > tbody").append("<tr><td class='cID'>"+jsonObj.cID+"</td><td>"+jsonObj.nickname
			+"</td><td>"+jsonObj.status+"</td><td>"+jsonObj.local+"</td><td>"+jsonObj.signDate
			+"</td><td>"+jsonObj.accessDate+"</td></tr>") 
					}) 
						
						var tr = $("#tab tbody tr");
						var td = tr.children();
						var data = td.eq(0).text();
						if(data == '???????????? ??????'){
							return
						}
						var param = "cID=" + data
						
						 getInfoData(param)
					
						// ????????? ????????? ???????????? 
				 		$("tbody tr").click(function(evt) {
						
						 tr = $(this);
						 td = tr.children();
						 data = td.eq(0).text();
						 param = "cID=" + data
						
						 getInfoData(param)
					})// click
				},
							
		}) // ajax 
		
	}
	
	// ?????? ?????? ?????? ajax
	function getInfoData(param){
		$.ajax({
			url:"customer_info_process.jsp",
			type:"get",
			data: param,
			async: true,
			dataType:"json",
			error:function( xhr ){
				alert( xhr.text + "/" + xhr.status);
			},
			success:function(jsonObj){
				 printCustomerInfo(jsonObj)
			}
			
		}) // ajax
	}
	
	// ?????? ?????? ajax
	function modifyStatus(param){
		$.ajax({
			url:"customer_status_process.jsp",
			type:"get",
			data: param,
			async: true,
			error:function( xhr ){
				alert( xhr.text + "/" + xhr.status);
			},
			success:function(){
				alert("?????? ???????????????.")
				getSearchData();
			}
			
		}) // ajax
	}
	
	// ???????????? ?????? function
	function printCustomerInfo(jsonObj){
		
		$("#profile").attr("src","http://211.63.89.157/bada_prj/badasaja_user/user_all_3/profile/" + jsonObj.profile)
		$("#customer_nickcname").html(jsonObj.nickname);
		$("#customer-id").html('ID : ' + jsonObj.cID);
		$("#customer-gender").html('gender : ' + jsonObj.gender);
		$("#customer-writes").html('????????? ??? : ' + jsonObj.forumCount);
		$("#customer-register").html('????????? : ' + jsonObj.signDate);
		$("#customer-email").html('email : ' + jsonObj.email);
		$("#customer-score").html('??????????????? : ' + jsonObj.score);
		$("#customer-login").html('????????? : ' + jsonObj.accessDate);
		$("#phone").html('phone number : ' + jsonObj.tel);
		$("#reports").html('?????? ?????? ?????? : ' + jsonObj.reportCount);
		$("#ustatus").html(jsonObj.status)
	}
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
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
                    <!-- Basic Bootstrap Table -->
                    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">C_Forum /</span>?????? ?????? ??????</h4>
                    <div class="card" style="margin-bottom:100px; height: 600px; overflow-y:scroll;">
                        <!-- Search -->
                        <div class="navbar-nav mb-3">
                            <div class="nav-item d-inline">
                                <button type="button" id="status" name="status" class="btn btn-outline-primary dropdown-toggle float-end" data-bs-toggle="dropdown" style="margin:15px" >??????</button>
                                <input type="hidden" name="st" id="st"/>
                                <ul class="dropdown-menu">
                                <li class="status"><a class="dropdown-item" href="javascript:void(0);">??????</a></li>
                                    <li class="status"><a class="dropdown-item" href="javascript:void(0);">????????????</a></li>
                                    <li class="status"><a class="dropdown-item" href="javascript:void(0);">????????????</a></li>
                                    <li class="status"><a class="dropdown-item" href="javascript:void(0);">????????????</a></li>
                                    <li class="status"><a class="dropdown-item" href="javascript:void(0);">????????????</a></li>
                                </ul>
                                <button type="button" id="local" name="local" class="btn btn-outline-primary dropdown-toggle float-end" data-bs-toggle="dropdown" style="margin-top:15px; margin-left:15px; " >??????</button>
                                <input type="hidden" name="gu" id="gu"/>
                                <ul class="dropdown-menu">
                                	<li class="local"><a class="dropdown-item" href="javascript:void(0)">??????</a></li>
                                    <c:forEach var="data" items="${lList }">
										<li class="local"><a class="dropdown-item" href="javascript:void(0)"><c:out value="${ data.guName }" /> </a></li>
									</c:forEach>
                                </ul>
                                <a href="javascript:void(0)" id="idSearch" class="btn btn-primary float-end shadow-none" style="margin-top:15px; margin-left:10px">??????</a>
                                <input
                                        type="text"
                                        class="form-control shadow-none float-end"
                                        id="cID"
                                        name="cID"
                                        placeholder="Customer_ID??????"
                                        style="margin-top: 15px;width: 150px;"
                                />
                            </div>
                        </div>
                        <!-- /Search -->
                        <div class="table-responsive text-nowrap">
                            <table id="tab" class="table table-hover">
                                <thead>
                                <tr>
                                    <th>?????????</th>
                                    <th>?????????</th>
                                    <th>?????? ??????</th>
                                    <th>????????????</th>
                                    <th>?????????</th>
                                    <th>????????????</th>
                                </tr>
                                </thead>
                                <tbody class="table-border-bottom-0">
                                </tbody>
                            </table>

                        </div>
                    </div>
                    <div class="card">
                        <!-- Search -->
                        <div class="navbar-nav">
                            <div class="nav-item d-inline">
                                <h5 class="card-header" style="height:30px; display: inline-block">?????? ?????? ??????</h5>
                            </div>
                        </div>
                        <!-- /Search -->
                        <div class="user-grid">
                            <div class="user-avatar">
                                <img id="profile">
                                <a href="#" class="avatar-name">
                                    <span class="app-brand-text demo fw-bolder ms-2" id="customer_nickcname"></span>
                                </a>
                            </div>
                            <div>
                                <div class="customer-line">
                                    <div class = "customer-div4"><span class="customer-info" id="customer-id"></span></div>
                                    <div class = "customer-div4"><span class="customer-info" id="customer-gender"></span></div>
                                    <div class = "customer-div4"><span class="customer-info" id="customer-writes"></span></div>
                                    <div class = "customer-div4"><span class="customer-info" id="customer-register"></span></div>
                                </div>
                                <div class="customer-line">
                                    <div class = "customer-div3"><span class="customer-info" id="customer-email"></span></div>
                                    <div class = "customer-div3"><span class="customer-info" id="customer-score"></span></div>
                                    <div class = "customer-div3"><span class="customer-info" id="customer-login"></span></div>
                                </div>
                                <div class="customer-line">
                                    <div class = "customer-div3"><span class="customer-info" id="phone"></span></div>
                                    <div class = "customer-div3"><span class="customer-info" id="reports"></span></div>
                                    <div class = "customer-div3"><span class="customer-info">?????? ??????</span>
                                        <button type="button" class="btn btn-outline-secondary dropdown-toggle" id="ustatus" data-bs-toggle="dropdown" style="margin-left: 10px; padding:0px" >????????????</button>
                                         <input type="hidden" name="ust" id="ust"/>
                                        <ul class="dropdown-menu">
                                            <li class="ustatus"><a class="dropdown-item" href="javascript:void(0);">????????????</a></li>
                                            <li class="ustatus"><a class="dropdown-item" href="javascript:void(0);">????????????</a></li>
                                            <li class="ustatus"><a class="dropdown-item" href="javascript:void(0);">????????????</a></li>
                                            <li class="ustatus"><a class="dropdown-item" href="javascript:void(0);">????????????</a></li>
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
