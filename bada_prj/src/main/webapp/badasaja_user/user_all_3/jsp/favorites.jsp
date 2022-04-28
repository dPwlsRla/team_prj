<%--
  Created by IntelliJ IDEA.
  User: seohuisu
  Date: 2022/04/12
  Time: 9:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="kr.co.sist.badasaja.user.dao.MypageDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.sist.badasaja.vo.EntireForumVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>favorites</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">

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
 	if(session.getAttribute("count")==null){
		session.setAttribute("count", 1);
	}
	int count = (int)session.getAttribute("count"); 
	//VO객체화 
	List<EntireForumVO> efList = new ArrayList<EntireForumVO>();
	
	//DAO 불러오기
	MypageDAO MpDAO = new MypageDAO();
	efList = MpDAO.selectWishList((String)session.getAttribute("cId"),count);
	//efList = MpDAO.selectWishList("test",count);
	int rownum = MpDAO.selectRowNum("test");
 	if(rownum/9<1){
		rownum=1;
	}else{
		rownum=rownum/9;
	}

	pageContext.setAttribute("efList", efList);

%>
<script type="text/javascript">
function goForum(cfNum){
	document.fFrm.cfNum.value = cfNum;
	$("#MFrm").submit();
}
 function wishProcess(cfNum,flagNum) {
	var cId = '<%=(String)session.getAttribute("cId")%>';
	if (cId == null) {
		alert("login plz");
		return;
	}
	alert( cfNum )
	$.ajax({
		type: "POST",
		url: "wishProcess.jsp",
		data:
			{
				"process":"delete",
				"cfNum":cfNum				
			},
			error:function( xhr){
				alert("에러"+ xhr.status+" / " + xhr.statusText )
			},
		success: function(resp){
			alert("찜목록이 삭제되었습니다.");

			location.reload();
			}
	})

}// 

// 위시 리스트 추가

<%-- function backward() {
	<%if(rownum<count && rownum>2){
		session.setAttribute("count", --count);
	}
	%>
	
	location.reload();
}
function forward() {

	<%if(rownum>count){
		session.setAttribute("count", ++count);
	}
	%>
	
	location.reload();
} --%>
function load() {
	$("#li<%=count%>").addClass('active');
}
function test(text) {
	$("#hid").val($(text).text())
	$("#li").submit();
}
</script>
</head>
<body onload="load()">
<%=count %>
<form action="forum.jsp" id="MFrm" name="MFrm" method="post">
	<input type="hidden" name="cfNum" value="">
</form>
<div class="site-wrap">
    <%@include file="components/header.jsp"%>
    <div class="site-section">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md-9 order-2">
                    <h3>관심 목록</h3>
                    <div class="col-md-9 order-2">
                        <div class="row mb-5">
                        
                        <c:forEach var="efVO"  items="${efList}">
                            <div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up" >
                                <div class="block-4 text-center">
                                    <div class="block-4-text p-4">
                                        <a href="javascript:void(0);"  onclick="goForum('${efVO.cfNum}')" > <h3>${efVO.title}</h3></a>
 
	                                    	<img src = "../images/like.png" id="like_${efVO.cfNum}" style="cursor:pointer;"  onclick="wishProcess('${efVO.cfNum}')">
   
                                    </div>
                             		<figure class="block-4-image">
	                                    <a href="javascript:void(0);"  onclick="goForum('${efVO.cfNum}')"><img src="${efVO.img}" alt="Image placeholder" class="img-fluid"></a>
	                                </figure>
                                    <div class="block-4-text">
                                        <ul>
                                        <c:forEach var="htVO"  items="${efVO.list}" >
                                        		<li>${htVO.hash}</li>
                         
                                        </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                
                           </c:forEach>

                        </div>
                        <form action="favorites2.jsp"id="li" method="get">
                        <div class="row" data-aos="fade-up">
                            <div class="col-md-12 text-center">
                                <div class="site-block-27">
                                <input type="hidden" id="hid" name="hid"/>
                                    <ul>
                                   
                                  <!--   <li><a href="javascript:void(0)" onclick="backward()">&lt;</a></li> -->
                                    <%for(int i=0;i<rownum;i++){ %>
                                       <!-- <li class="active"><span>1</span></li>  -->
                                      
                                        <li id="li<%=i+1%>"><a href="javascript:void(0)" onclick="test(this)"><%=i+1 %></a></li> 
                                     	
                                        <%} %>
                                        <!-- <li><a href="javascript:void(0)" onclick="forward()">&gt;</a></li> -->
                                    </ul>
                                </div>
                            </div>
                        </div>
                        </form>
                        
                        
                    </div>
                </div>
                <%@include file="components/mypage_nav.jsp"%>
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