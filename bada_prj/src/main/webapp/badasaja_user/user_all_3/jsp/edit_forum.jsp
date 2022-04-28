<%@page import="kr.co.sist.badasaja.vo.CuVO"%>
<%@page import="kr.co.sist.badasaja.vo.HashTagVO"%>
<%@page import="kr.co.sist.badasaja.vo.CImgVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.badasaja.vo.CForumVO"%>
<%@page import="kr.co.sist.badasaja.user.dao.CForumDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>게시글 수정하기</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="../fonts/icomoon/style.css">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
	
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">
    <link rel="stylesheet" href="../css/jquery-ui.css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">


    <link rel="stylesheet" href="../css/aos.css">

    <link rel="stylesheet" href="../css/style.css">
   
    
  </head>
  <style type="text/css">
  #searchArea{
  					margin-left: 30px;
  					font-family: 'NanumSquareRound';
  					}
  .main_banner{
  					 margin-left: 30px;
  					 font-family: 'NanumSquareRound';
  					 }
  	#btnSearch{
  				 background-color: #e0e0e0; 
  				 border: 0px; 
  				 border-radius:5px; 
  				 width:60px; 
  				 font-weight: bold;
  				 font-family: 'NanumSquareRound';
  				}
  #container{
  				 margin: 0px auto;
  				 font-family: 'NanumSquareRound';
  				 }
  span{
  		  font-style: bold;
  		  font-size: 35px;
  		  color: #333;
  		  font-family: 'NanumSquareRound';
  		  }
  .container1{
  				  text-align: center;
  				  font-family: 'NanumSquareRound';
  				  color: #333;
  				  margin-top: 100px;
  				  }
  .container2{
  				  text-align: center;
  				  font-family: 'NanumSquareRound';
  				  color: #333;
  				  }
  .container3{
  				  text-align: center;
  				  font-family: 'NanumSquareRound';
  				  color: #333;
  				  }
  
  .banner_line{
	  border: 0px;
	  background-color: #fada95;;
	  height: 25px;
	  margin-bottom: 10px;
	  }
	  
  #title{font-weight: bold;}
  
  #preview{
	 				 width:200px;
	 				 height:200px;
	 				}
	 	#preview1{
	 				 width:200px;
	 				 height:200px;
	 				}
	 	#preview2{
	 				 width:200px;
	 				 height:200px;
	 				}
	 				
	 	#trans_obj{
	 					font-weight: bold;
	 					color: #333;
	 					
	 				  }
	  .imageDiv{
					 width: 300px;
	  				}
	  				
	  .btnAttach{
	  				 font-family: 'NanumSquareRound';
   					 width: 200px;
	  				}
	 #mainLogo{
 						width : 300px;
 						height: 100px;
 		
 						}
 		td{
 			padding: 30px;
 			}
 			
 #span2{
      		font-weight: bold;
      		color:#0000ff;
      		font-family: 'NanumSquareRound';
      		}
  #span3{
  			 font-weight: bold;
  			 color:#ff0000;
  			 font-family: 'NanumSquareRound';
  			 }
 			
 	.container4{
  			      font-family: 'NanumSquareRound';
  			      margin-top: 30px;
  			      text-align: center;
  			      }
  
  #cautions{
  				
  				border-top: 1px solid #dfdfdf;
  				margin-top: 100px;
  				width: 600px;
  				height: 300px;
  				margin: 0px auto;
  				font-family: NanumSquareRound';
  				
  				}
  	#footer{
	  			height:200px;
	  			border-top: 1px solid #dfdfdf;
	  			text-align: center; 
	  			padding-top: 30px;"
	  			}
  </style>
  <%
  	CForumDAO cDAO = new CForumDAO();
  	String cfNum = request.getParameter("cfNum");
  	CForumVO cVO = cDAO.getCForumVO(cfNum);
  	List<CImgVO> cImgList = cDAO.getCImgVOList(cfNum);
  	List<HashTagVO> hashTagList = cDAO.getHashTagVOList(cfNum);
  	CuVO cuVO = cDAO.getCuVO(cfNum);
  	
	pageContext.setAttribute("cVO", cVO);
	pageContext.setAttribute("cuVO", cuVO);

	int i = 1;
	for (CImgVO cIVO : cImgList){
		pageContext.setAttribute("cImg"+ i,cIVO); // cImg1 : 첫번째 원소, cImg2 : 두번쨰 원소...
		i++;
	}
	pageContext.setAttribute("hashTagList", hashTagList);
	pageContext.setAttribute("cId",session.getAttribute("cId"));
	pageContext.setAttribute("cfNum", cfNum);

	

  %>
  <script type="text/javascript">

function name() {
	$("[name='frm']").submit();
}

</script>
  <body onload="name()">
  
  <%@include file="components/header.jsp"%>

 
	<form action="edit_forum_submit.jsp" id="edit_forum_frm" method="post" accept-charset="utf-8" enctype="application/x-www-form-urlencoded">
   	<input type="hidden" name="cfNum" value="${cfNum}">
    
    <div class="container1" style="margin-top: 5px;">
    	<span id="title">게시글 수정</span>
    </div>
    <div class="container2">
    	<input type="text" id="board_title" name="board_title" value="${cVO.cfTopic}" style="width: 500px; border: 1px solid #dfdfdf;">
    	<select style="width:200px; border: 1px solid #dfdfdf; height: 30px;" id="category_select" name="category_select" >
    	<option value="category"<c:if test="${cVO.pCode == 'category'}">selected</c:if>>카테고리</option>
    	<option value="el"<c:if test="${cVO.pCode == 'el'}">selected</c:if>>전자기기</option>
    	<option value="ho"<c:if test="${cVO.pCode == 'ho'}">selected</c:if>>생활용품</option>
    	<option value="fo"<c:if test="${cVO.pCode == 'fo'}">selected</c:if>>식품</option>
    	<option value="pe"<c:if test="${cVO.pCode == 'pe'}">selected</c:if>>반려동물용품</option>
    	<option value="be"<c:if test="${cVO.pCode == 'be'}">selected</c:if>>뷰티,미용</option>
    	<option value="fu"<c:if test="${cVO.pCode == 'fu'}">selected</c:if>>인테리어,가구</option>
    	<option value="in"<c:if test="${cVO.pCode == 'in'}">selected</c:if>>악기</option>
    	<option value="cl"<c:if test="${cVO.pCode == 'cl'}">selected</c:if>>의류</option>
    	<option value="wr"<c:if test="${cVO.pCode == 'wr'}">selected</c:if>>학용품</option>
    	</select>
    </div>
    <div class="container3">
    	<textarea id="board_content" name="board_content"style="border: 1px solid #dfdfdf; width:700px; height:500px; margin-top: 10px;">${cVO.cfMain}</textarea>
    </div>
    	
    	
    <div class="container4">
    	<label id="trans_obj">교환물품</label>
    	<input type="text" id="upHash1" name="upHash1" value="${fn:substring(hVO.hash,1,30)}" style="width: 100px; height: 30px;">
    	<input type="text" id="upHash2" name="upHash2" value="${fn:substring(hVO.hash,1,30)}" style="width: 100px; height: 30px;">
    	<input type="text" id="upHash3" name="upHash3" value="${fn:substring(hVO.hash,1,30)}" style="width: 100px; height: 30px;">
    	<br/>
    	<input type="button" value="취소"  style="background-color: #fada95; border: 0px; color:#ffffff; margin-top: 50px; margin-bottom: 50px">
    	<input type="button" id="btn_submit" value="수정 완료"  style="background-color: #2a90ab; border: 0px; color:#ffffff; margin-top: 50px; margin-bottom: 50px">
    </div>
    <div id="cautions">
    <br/>
   <h4 style="text-align: center; font-weight: bold; color:#ff0000">💥 게시글 작성 유의사항 💥</h4>
   <ul style="list-style: decimal;">
   <li>불법적인 광고 또는 홍보글 금지 (불법 온라인 모임 금지)</li>
   <li>여러 개의 아이디로 광고 게재 금지(한 분이 여러개의 아이디를 사용하시는 경우)</li>
   <li>비방글, 또는 비방 악플시 경고 조치후 활동정지 (캡쳐 하여 증거 자료 보관)</li>
   <li>상업적인 광고글 금지 (돈을 지불하는 형태의 모든 광고들은 상업적 광고로 간주)</li>
   <li>불법 만남관련 광고글 금지</li>
   <li>교환 금지 품목 : 주류, 담배</li>
   </ul>
   <br/>
    </div>
    
</form>
<!--footer  -->
   	<%@include file="components/footer.jsp"%>
   

  <script src="../js/jquery-3.3.1.min.js"></script>
  <script src="../js/jquery-ui.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/owl.carousel.min.js"></script>
  <script src="../js/jquery.magnific-popup.min.js"></script>
  <script src="../js/aos.js"></script>

  <script src="../js/main.js"></script>
  <script type="text/javascript">
    $(function(){
    	$('#btn_submit').click(function(e){
    		e.preventDefault();
    		if($("#board_title").val()==''||$("#board_content").val()==''){
    			alert("제목과 내용을 입력해주세요.");
    			return;
    		}
    		if($("#category_select").val() =="category"){
    			alert("카테고리를 선택해주세요."); 
    			return;
    		}
    		
    		$('#edit_forum_frm').submit();
    	})
    })
    
    </script>
    
  </body>
</html>