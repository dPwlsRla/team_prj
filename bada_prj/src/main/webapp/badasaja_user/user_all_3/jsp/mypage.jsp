<%--
  Created by IntelliJ IDEA.
  User: seohuisu
  Date: 2022/04/12
  Time: 9:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="kr.co.sist.badasaja.vo.MyPostBoardVO"%>
<%@page import="kr.co.sist.badasaja.vo.CForumVO"%>

<%@page import="kr.co.sist.badasaja.user.dao.MypageDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>mypage</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
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
    
<script type="text/javascript">


function updateStatus(cfNum){
	alert("거래 완료로 설정하시겠습니까?");
	$.ajax({
		type: "POST",
		url: "mypageProcess.jsp",
		data:
			{
				"process":"update",
				"cfNum":cfNum,
			},
		success: function(resp){
		alert("거래가 완료되었습니다.");
		$("#completeBtn").hide();
		}
					
	})
} 

//내가 쓴 글 상세 조회
function goForum(cfNum){
	document.fFrm.cfNum.value = cfNum;
	$("#Frm").submit();
}

</script>

</head>
<%
	//VO객체화 
	MyPostBoardVO mpbVO = new MyPostBoardVO();
	
	List<MyPostBoardVO> mpbList = null;
	List<MyPostBoardVO> mpbList2 = null;
	List<MyPostBoardVO> mpbList3 = null;
	List<MyPostBoardVO> mpbList4 = null;
	
	
	//DAO 객체화 및 메소드에 사용자 id 받아오기
	MypageDAO mpDAO = new MypageDAO();
	
	//로그인 세션 받기
	mpbList= mpDAO.selectMyForum((String)session.getAttribute("cId"));
	mpbList2 = mpDAO.selectDoneForum((String)session.getAttribute("cId"));
	mpbList3 = mpDAO.selectMyTransaction((String)session.getAttribute("cId"));
	
	//cfNum 받기
	String cfNum = request.getParameter("cfNum");
	
	//저장
	pageContext.setAttribute("mpbList", mpbList);
	pageContext.setAttribute("mpbList2", mpbList2);
	pageContext.setAttribute("mpbList3", mpbList3 );
%>



<body >

<form action="forum.jsp" id="Frm" name="Frm" method="post">
	<input type="hidden" name="cfNum" value="<%= cfNum%>">
</form>


<div class="site-wrap">
    <%@include file="components/header.jsp"%>
    <div class="site-section">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md-9 order-2">
                    <h3>교환 목록</h3>
                    <div class="tabs">
                        <input id="my-promise" type="radio" name="tab_item" >
                        <label class="tab_item" for="my-promise"style="float: right;width:70px">거래약속</label>
                        <input id="my-trade" type="radio" name="tab_item">
                        <label class="tab_item" for="my-trade"style="float: right;width:70px">거래한글</label>
                        <input id="my-write" type="radio" name="tab_item"checked="checked">
                        <label class="tab_item" for="my-write" style="float: right;width:70px">내가쓴글</label>
						
						<!--내가 쓴글 -->
	                    <div class="tab_content" id="my-write_content">
                       	<c:forEach var="mpbVO"  items="${mpbList}">
	                            <div class="card-item" data-aos="fade-up">
	                                <div class="row align-items-center">
	                                    <h5>${mpbVO.writeDate}</h5>
	                                </div>
	                                <div class="row align-items-center">
	                                    <div class="image">
	                                        <a href="javascript:void(0);"  onclick="goForum('${mpbVO.cfNum}')" ><img src="${mpbVO.mainImg}" alt="Image placeholder" class="img"></a>
	                                    </div>
	                                    <div class="text">
	                                        <a href="javascript:void(0);"  onclick="goForum('${mpbVO.cfNum}')" ><h6>${mpbVO.cfTopic}</h6></a>
	                                        <h6>거래한 분 : ${mpbVO.nickname}</h6>
	                                    </div>
	                                    
	                                </div>
	                            </div>
                        </c:forEach >
                        </div>
                        <!-- 내가 쓴글 여기까지 -->
                        
                        <!-- 거래 한 글  -->
                        <div class="tab_content" id="my-trade_content">
                        <c:forEach var ="mpbVO" items="${mpbList2}">
                          <div class="card-item" data-aos="fade-up">
                                <div class="row align-items-center">
                                    <h5>${mpbVO.writeDate}</h5>
                                </div>
                                <div class="row align-items-center">
                                    <div class="image">
                                        <a href="#"><img src="" alt="Image placeholder" class="img"></a>
                                    </div>
                                    <div class="text">
                                        <h6>${mpbVO.cfTopic}</h6>
                                        <h6>거래한 분 : ${mpbVO.nickname}</h6>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                            </div>
							<!-- 거래 한 글 여기까지 -->
							
							<!-- 거래 약속  -->
                        <div class="tab_content" id="my-promise_content">
                        <c:forEach var="mpbVO" items="${mpbList3}">
                            <div class="card-item" data-aos="fade-up">
                                <div class="row align-items-center">
                                    <h5>${mpbVO.writeDate}</h5>
                                </div>
                                <div class="row align-items-center">
                                    <div class="image">
                                        <a href="#"><img src="${mpbVO.mainImg}" alt="Image placeholder" class="img"></a>
                                    </div>
                                    <div class="text">
                                    <input type="button" value="완료" style="
                                    width: 50px; height: 30px; float: right; margin-right: 50px; margin-bottom: 50px;color: white;background-color: #2a90ab"
                                 	id="completeBtn" onclick="updateStatus('${mpbVO.cfNum}')">
                                        <h6>${mpbVO.cfTopic}</h6>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        </div>
                        <!--거래약속 완료 -->
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