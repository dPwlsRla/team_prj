<%@page import="kr.co.sist.badasaja.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.badasaja.admin.dao.KyhNoticeDAO"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         info="관리자 전용 페이지"
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
		
		getSearchProhibit();
		getSearchNotice();
		 
		// 작성 금지 목록 검색 event 
		$("#keySearch").click(function(){
			
			getSearchProhibit();
			
		}) // click 
		
		// 금지 목록 등록 ajax
		$("#writeKey").click(function(){
			
			var iKey = $("#iKey").val();
			
			$.ajax({
				url:"http://211.63.89.157/bada_prj/badasaja_admin/jsp/prohibit_in_process.jsp",
				data : { ikey : iKey},
				type:"get",
				error:function( xhr ){
					alert( xhr.text + "/" + xhr.status);
				},
				success:function(){
					alert("추가 되었습니다.");
					$("#ikey").val("");
					getSearchProhibit();
				},
				
			})
			
		}) // click
		
		// 관리자 한줄 공지 등록 ajax
		$("#writeNotice").click(function(){
			
			var iNotice = $("#iNotice").val();
			var oID = $("#operID").text();
			
		 	$.ajax({
				url:"http://211.63.89.157/bada_prj/badasaja_admin/jsp/notice_in_process.jsp",
				data : { oID : oID, iNo : iNotice },
				type:"get",
				error:function( xhr ){
					alert( xhr.text + "/" + xhr.status);
				},
				success:function(){
					alert("추가 되었습니다.")
					$("#iNotice").val("");
					getSearchNotice();
				},
				
			}) 
			
		}) // click
		
	}) // ready
	
	// 금지 목록 조회 ajax
	function getSearchProhibit() {
		
		$.ajax({
			
			url:"http://211.63.89.157/bada_prj/badasaja_admin/jsp/prohibit_process.jsp",
			data : {
				key : $("#key").val(),
			},
			type:"get",
			dataType:"json",
			error:function( xhr ){
				alert( xhr.text + "/" + xhr.status);
			},
			success:function(jsonObj){
			 	 $("#ptab > tbody").empty();
				if(jsonObj.resultData.length == 0){
					$("#ptab > tbody").append("<tr><td colspan='2'><strong>조회결과 없음</strong></td></tr>"  )					
				}
				$.each(jsonObj.resultData, function(i, jsonObj){
					$("#ptab > tbody").append("<tr><td>"+ jsonObj.keyNum +"</td><td>"+jsonObj.keyword + "</td></tr>") 
				})	
			},
			
		})
		
	} //getSearchProhibit
	
// 관리자 한줄 공지 전체 조회 ajax
function getSearchNotice(){
		
		$.ajax({
			
			url:"http://211.63.89.157/bada_prj/badasaja_admin/jsp/notice_process.jsp",
			data : {
				key : $("#key").val(),
			},
			type:"get",
			dataType:"json",
			error:function( xhr ){
				alert( xhr.text + "/" + xhr.status);
			},
			success:function(jsonObj){
			 	 $("#ntab > tbody").empty();
				if(jsonObj.resultData.length == 0){
					$("#ntab > tbody").append("<tr><td colspan='4'><strong>조회결과 없음</strong></td></tr>"  )					
				}
				$.each(jsonObj.resultData, function(i, jsonObj){
					$("#ntab > tbody").append("<tr><td>"+jsonObj.nNum+"</td><td>"+jsonObj.oMain
							                 +"</td><td>"+jsonObj.oID+"</td><td>"+jsonObj.postedDate+"</td><td>" + "</td></tr>") 
				})	
			},
			
		})
		
	} //getSearchNotice
	
	</script>
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
                       </div>
                   </div>
                   <!-- /Search -->
                   <div class="table-responsive text-nowrap">
                      <table id="ntab" class="table">
                          <thead>
                          <tr>
                             <th>번호</th>
                             <th>내용</th>
                             <th>작성자</th>
                             <th>작성일</th>
                           </tr>
                           </thead>
                           <tbody class="table-border-bottom-0">
                           </tbody>
                      </table>
                  </div>
             </div>            
            <div class="input-group mb-3">
  				<input type="text" id="iNotice" name="iNotice" class="form-control" placeholder="게시글 작성 금지 키워드를 입력해주세요">
  				<button class="btn btn-outline-secondary" type="button" id="writeNotice">입력</button>
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
                           <a href="javascript:void(0)" id="keySearch" class="btn btn-primary float-end shadow-none" style="margin:15px;">검색</a>
                           <input
                                 type="text"
                                 id="key"
                                 name="key"
                                 class="form-control shadow-none float-end"
                                 placeholder="단어 검색"
                                 style="margin-top: 15px;width: 150px;"
                           />
                       </div>
                   </div>
                   <!-- /Search -->
                   <div class="table-responsive text-nowrap">
                      <table id="ptab" class="table">
                          <thead>
                          <tr>
                             <th>번호</th>
                             <th>키워드</th>
                           </tr>
                           </thead>
                           <tbody class="table-border-bottom-0">
                           </tbody>
                      </table>
                  </div>
             </div>            
             

			<form>
			<div class="input-group mb-3">
  				<input type="text" id="iKey" name="iKey" class="form-control" placeholder="게시글 작성 금지 키워드를 입력해주세요">
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

