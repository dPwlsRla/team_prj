<%@page import="kr.co.sist.badasaja.vo.ProductVO"%>
<%@page import="kr.co.sist.badasaja.vo.HashTagVO"%>
<%@page import="kr.co.sist.badasaja.vo.CForumVO"%>
<%@page import="kr.co.sist.badasaja.vo.WishListVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.sist.badasaja.user.dao.EntireForumDAO"%>
<%@page import="kr.co.sist.badasaja.vo.EntireForumVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
info ="물물교환 게시판 메인"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>trade</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
    <link rel="stylesheet" href="../fonts/icomoon/style.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">
    <link rel="stylesheet" href="../css/jquery-ui.css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../css/aos.css">
    <link rel="stylesheet" href="../css/style.css">
<%
	
	
	//DAO 불러오기
	EntireForumDAO efDAO = new EntireForumDAO();
	List<ProductVO> pList = efDAO.selectProductList();
	
	// TODO
	pageContext.setAttribute("pList", pList);
	
	String id = (String)session.getAttribute("cId");
	String cfNum = request.getParameter("fFrm");

 	if(id==null) {
		response.sendRedirect("login.jsp");
		return;
	}//end if 

%>

<script type="text/javascript">
 	
	// 게시물 상세 조회
 	function goForum(cfNum){
		var forumType = cfNum.substr(0,2);
		document.fFrm.cfNum.value=cfNum;
		
		//case 1. 일반 게시글일 경우
		if(forumType=="cf"){
			document.fFrm.action="forum.jsp";
		}//case 2. 광고 게시글일 경우
		else if(forumType=="ad"){
			document.fFrm.action = "ad_forum.jsp";
		}
		$("#fFrm").submit();
	}   
	
	function activeA(){
		$(".nav-link").css("background-color","white");
		$(".nav-link").css("color","gray");
		let dv = event.currentTarget;
		dv.style.backgroundColor="#2A90AB";
		dv.style.color="white";
		
		pName = dv.innerText;
		id = '<%=(String)session.getAttribute("cId")%>';
		
		
		$.ajax({
			url:"http://localhost/bada_prj/badasaja_user/user_all_3/jsp/entire_forum_table.jsp",
			 data: {
				   cId : id,
				   product : pName,
			},
			type:"get",
			dataType:"html",
			error:function( xhr ){
				alert( xhr.text + "/" + xhr.status);
			},
			success:function(data){
				$("#includeAjax").html(data);
			}
		}) //ajax
		
		$.ajax({
			url:"http://localhost/bada_prj/badasaja_user/user_all_3/jsp/banner_info.jsp",
			 data: {
				   cId : id,
				   product : pName,
			},
			type:"get",
			dataType:"json",
			error:function( xhr ){
				alert( xhr.text + "/" + xhr.status);
			},
			success:function(json){
				
				if(!json.bFlag){

					$("#banner").html("<div style='background-color:lightgray; color:black; height:200px;margin-bottom: 20px; text-align:center; padding:75px;'>"
			          +"<h5>앗! 현재 카테고리에 배너 광고가 없습니다.</h5>"+"<h5>광고 문의 : 02-XXXX-XXXX</h5></div>");
					
				}else{
					$("#banner").html("<div style='height:200px;margin-bottom: 20px;'>"+
			          "<a href='http://"+json.url+"'><img src='../../../badasaja_admin/banner_upload/"+json.img+"'"
			          +"style='width:100%; height:100%;'></a></div>");
				}//end else
			}
		}) //ajax
	}
	
	
		function activeLoad(){
		
		id = '<%=(String)session.getAttribute("cId")%>';
		pName = "기타 물품";
		if('<%=request.getParameter("product")%>'!=null){
			pName = '<%=request.getParameter("product")%>';
		}
		
		$.ajax({
			url:"http://localhost/bada_prj/badasaja_user/user_all_3/jsp/entire_forum_table.jsp",
			 data: {
				   cId : id,
				   product : pName,
			},
			type:"get",
			dataType:"html",
			error:function( xhr ){
				alert( xhr.text + "/" + xhr.status);
			},
			success:function(data){
				$("#includeAjax").html(data);
			}
		}) //ajax
		
		$.ajax({
			url:"http://localhost/bada_prj/badasaja_user/user_all_3/jsp/banner_info.jsp",
			 data: {
				   cId : id,
				   product : pName,
			},
			type:"get",
			dataType:"json",
			error:function( xhr ){
				alert( xhr.text + "/" + xhr.status);
			},
			success:function(json){
				
				if(!json.bFlag){

					$("#banner").html("<div style='background-color:lightgray; color:black; height:200px;margin-bottom: 20px; text-align:center; padding:75px;'>"
			          +"<h5>앗! 현재 카테고리에 배너 광고가 없습니다.</h5>"+"<h5>광고 문의 : 02-XXXX-XXXX</h5></div>");
					
				}else{
					$("#banner").html("<div style='height:200px;margin-bottom: 20px;'>"+
			          "<a href='http://"+json.url+"'><img src='../../../badasaja_admin/banner_upload/"+json.img+"'"
			          +"style='width:100%; height:100%;'></a></div>");
				}//end else
			}
		}) //ajax
	}
	 
	
	

</script>
<style type="text/css">
.img-fluid{
			  width : 250px;
			  height: 250px; 
				}
.nav-link{
	color:gray;
	cursor:pointer
}

.nav-link:hover{
	color:black;
}

.nav-item{
	width:20%;
}

</style>

</head>

<body onload="activeLoad()">

<div class="site-wrap">
    <%@include file="components/header.jsp"%>
	<form action="forum.jsp" id="fFrm" name="fFrm" method="post">
	<input type="hidden" name="cfNum" value="">
	</form>

    <div class="site-section">
        <div class="container">
        	<div>
				<ul class="nav nav-pills nav-fill">
				<c:forEach var="data" items="${ pList }" varStatus="vs" end="4">
				 <li class="nav-item">
				 	<div class="nav-link" onclick="activeA()">
				 		<c:out value="${ data.product }" /> 
				 	</div>
				 </li>
				 </c:forEach>
				</ul>
			</div>
        	<div>
				<ul class="nav nav-pills nav-fill">
				<c:forEach var="data" items="${ pList }" varStatus="vs" begin="5" end="9">
				 <li class="nav-item">
				 	<div class="nav-link" onclick="activeA()">
				 		<c:out value="${ data.product }" /> 
				 	</div>
				 </li>
				 </c:forEach>
				</ul>
			</div>
            <div class="row mt-4 mb-4">
                <div class="col">
                	<div id="banner">
          <!--  배너가 표시되는 div -->
          			</div>
          			<div id="includeAjax">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
 <%@include file="components/footer.jsp"%>


<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/jquery-ui.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/owl.carousel.min.js"></script>
<script src="../js/jquery.magnific-popup.min.js"></script>
<script src="../js/aos.js"></script>

<script src="../js/main.js"></script>

</body>
</html>