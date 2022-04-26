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
</head>




<%
	//VO객체화 
	List<EntireForumVO> efList = new ArrayList<EntireForumVO>();
	
	//DAO 불러오기
	EntireForumDAO efDAO = new EntireForumDAO();
	efList = efDAO.selectEntireForum((String)session.getAttribute("cId"));
	
	// TODO
	pageContext.setAttribute("efList", efList);

%>

<script type="text/javascript">

	// 위시 리스트 추가
	function wishProcess(cfNum){
		var cId = '<%=(String)session.getAttribute("cId")%>';
		console.log(cId);
		if (cId == null) {
			alert("login plz");
			return;
		}
		if($("#like_"+cfNum)[0].src.includes('unlike')){
			$("#like_"+cfNum)[0].src = "../images/like.png";
			$.ajax({
				type: "POST",
				url: "wishProcess.jsp",
				data:
					{
						"process":"insert",
						"cfNum":cfNum,
						"cId":cId,
					},
				success: function(resp){alert("찜목록에 추가되었습니다");},
			})
		}
		else{
			$("#like_"+cfNum)[0].src = "../images/unlike.png";
			$.ajax({
				type: "POST",
				url: "wishProcess.jsp",
				data:
					{
						"process":"delete",
						"cfNum":cfNum,
						"cId":cId,
					},
				success: function(resp){alert("찜목록에서 삭제되었습니다");},
			})
		}
	}
	
	// 게시물 상세 조회
	function goForum(cfNum){
		document.fFrm.cfNum.value = cfNum;
		$("#fFrm").submit();
	}

</script>
<style type="text/css">
.img-fluid{
			  width : 250px;
			  height: 250px; 
				}


</style>

<body>

<form action="forum.jsp" id="fFrm" name="fFrm" method="post">
	<input type="hidden" name="cfNum" value="">
</form>

<div class="site-wrap">
    <%@include file="components/header.jsp"%>
    <div class="site-section">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md-9 order-2">
                    <div style="border: 1px solid #333;height: 200px;margin-bottom: 20px">
                        광고
                    </div>
                    <div class="row mb-5">
						<c:forEach var="efVO"  items="${efList}" > <!-- pageContext.setattribute한 efList 에서 for문 돔. 원소 하나하나를 efVO로 보겠다. -->
							<div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
	                            <div class="block-4 text-center">
	                                <div class="block-4-text p-4">
	                                    <a href="javascript:void(0);"  onclick="goForum('${efVO.cfNum}')" ><h3>${efVO.title}</h3></a>
	                                    <c:choose>
	                                    	<c:when test="${efVO.isWish}"><img src = "../images/like.png" id="like_${efVO.cfNum}" onclick="wishProcess('${efVO.cfNum}')"></c:when>
      										<c:when test="${!efVO.isWish}"><img src = "../images/unlike.png" id="like_${efVO.cfNum}" onclick="wishProcess('${efVO.cfNum}')"></c:when>	
	                                    </c:choose>
	                                </div>
	                                <figure class="block-4-image">
	                                    <a href="javascript:void(0);"  onclick="goForum('${efVO.cfNum}')"><img src="../images/c_img/${efVO.img}" alt="Image placeholder" class="img-fluid"></a>
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
                    <div class="row" data-aos="fade-up">
                        <div class="col-md-12 text-center">
                            <div class="site-block-27">
                                <ul>
                                    <li><a href="#">&lt;</a></li>
                                    <li class="active"><span>1</span></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#">&gt;</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3 order-1 mb-5 mb-md-0" style="border: 1px solid #333;height: 800px;display: inline;text-align: left;background-color: #2a90ab
                    ;color: white;font-weight: bold;font-size: 20px;max-width: 180px">
                    <ul style="margin-top: 50px;display: inline-block; ">
                    <li>전자기기</li><br/>
                    <li>생활용품</li><br/>
                    <li>식품</li><br/>
                    <li>반려 동물 용품</li><br/>
                    <li>의류</li><br/>
                    <li>뷰티, 미용</li><br/>
                    <li>인테리어, 가구</li><br/>
                    <li>필기구</li><br/>
                    <li>악기</li><br/>
                    <li>기타 용품</li><br/>
                    </ul>
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