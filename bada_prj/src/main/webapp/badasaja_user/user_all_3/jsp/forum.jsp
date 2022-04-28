<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="kr.co.sist.badasaja.user.dao.CForumDAO"%>
<%@page import="kr.co.sist.badasaja.vo.CForumVO" %>
<%@page import="kr.co.sist.badasaja.vo.CImgVO" %>
<%@page import="kr.co.sist.badasaja.vo.HashTagVO" %>
<%@page import="kr.co.sist.badasaja.vo.CuVO" %>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <title>게시글 상세보기</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <link rel="stylesheet" href="../fonts/icomoon/style.css">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
  					 
  #mainLogo{
 				width : 300px;
 				height: 100px;
 				}
 				
 #btnSearch{
  				 background-color: #e0e0e0; 
  				 border: 0px; 
  				 border-radius:5px; 
  				 width:60px; 
  				 font-weight: bold;
  				 font-family: 'NanumSquareRound';
  				 }
  #container0{
	 			 margin-left: 0px auto;
				 margin-right: 0px auto;
	  			font-family: 'NanumSquareRound';
  				}
  #span1{
  			font-style: bold;
  			font-size: 15px; 
  			color: #333; }
  #span2{
  			text-align: right; }
  
  .container1{
  				  width: 700px; 
  				  height:70px;
  				  margin: 0px auto;
  				  font-family: 'NanumSquareRound';
  				  color: #333;
  				  }
  .container2{
  				  margin: 0px auto;
  				  font-family: 'NanumSquareRound';
  				  color: #333;
  				  height:700px;
  				 border:1px solid #333;
  				   }
  .container3{
  				  margin: 0px auto;
  				  font-family: 'NanumSquareRound';
  				  color: #333;
   				 }
  .container4{
  				 height:1200px;
  				 font-family: 'NanumSquareRound';
  				 color: #333;
  				 border:1px solid #333;
  				 }
 
  .banner_line{
	  border: 0px;
	  background-color: #fada95;
	  height: 25px;
	  margin-bottom: 10px;
	  }
  
  #lb1{
  		background-color:  #fada95;
  		border: 0px;
  		border-radius: 10px;
  		font-weight: bold;
  		}
  #lb2{
  		background-color:  #fada95;
  		border: 0px;
  		border-radius: 10px;
  		font-weight: bold;
  		}
  #lb3{
  		background-color:  #fada95;
  		border: 0px;
  		border-radius: 10px;
  		font-weight: bold;
  		}
  		
  	#nickname{
 					font-weight: bold;
 					color: #333; 	
  				   }
 	.bg-light{
 				background-color: #ffffff;
				}
	.editBtn{
				background-color: #dfdfdf;
				border: 0px;
				 font-family: 'NanumSquareRoundB';
				 margin-bottom: 10px;
			   }
	#onBoard{
 				background-color: #fada95;
 				border-radius: 5px;
 				font-size: 20px;
 			  	text-align: center;
 			  	font-family: 'NanumSquareRoundB';
 			  	}
	#textDiv{
				border-top:1px solid #dfdfdf;
				border-bottom:1px solid #dfdfdf;
							
				width:700px;
				height:300px;
				margin: 0px auto;
				margin-bottom: 50px;
				}
	#commentDiv{
						border-bottom: 1px solid #dfdfdf;
						width:700px;
						height:300px;
						margin: 0px auto;
						margin-bottom: 20px;
						color: #333;
						font-family: 'NanumSquareRound'';
						overflow: scroll;
						}
	.commentText{
					width:580px;
					height:30px;
					border: 1px solid #dfdfdf;
					font-family: 'NanumSquareRound'';
					}
	.commentBtn{
						background-color: #5e5e5e;
						border: 0px;
						border-radius: 3px;
						color: #ffffff;
						font-family: 'NanumSquareRoundB';
						margin-right: 0px;
						}
	#commentArea{
						width: 700px;
						margin: 0px auto;
						font-family: 'NanumSquareRound'';
						}
	.oneComment{
						width: 700px;
						margin: 0px auto;
						font-family: 'NanumSquareRound'';
						}
	#parentCom{
					width: 700px;
					border-bottom: 1px solid #dfdfdf;
					font-family: 'NanumSquareRound'';
					}
	#childCom{
					width: 700px;
					padding-left: 30px;
					font-family: 'NanumSquareRound'';
					}
					
	.checkbox{	
					width:15px;
					height:15px;
					vertical-align: middle;
	 				}
	 #replyArrow{
	 					width: 15px;
	 					height: 15px;
	 				  }
	  #footer{
	  			height:200px;
	  			border-top: 1px solid #dfdfdf;
	  			text-align: center; 
	  			padding-top: 30px;"
	  			}
	 #carouselExampleControls{
									width: 600px;
   									margin: 0px auto;
									}
	.commentProfile{
							width: 30px;
    						height: 30px; 
    						border-radius: 70%;
    						overflow: hidden;
    						border: 1px solid #dfdfdf;
    						margin-right: 5px;
    						display: inline-block;
							}
	
	.nicknameCom{
			font-weight: bold;
			font-size: 20px;
		   }
 	.addr{
 			font-size: 12px;
 			display: inline-block;
 			margin-left: 5px;
 		   }
 	.writerLabel{
					border: 1px solid #868e96;
					border-radius:5px;
					color: #868e96;
					font-size: 10px;
					display: inline-block;
 					}
 	.replyMark{
 					width: 9px;
   				    height: 9px;
    				border-bottom: 1px solid #adb5bd;
    				border-left: 1px solid #adb5bd;
    				display: inline-block;
    				margin-right: 16px;
    				vertical-align: top;
 				  }
 	.date{
 			font-size: 12px;
 			color:#868e96;
 			display: inline-block;
 			width:630px;
 		   }
 	.commentContent{
 							border-bottom:  1px solid #dfdfdf;
 							margin-bottom: 10px;
 							}
 	.replyDiv{
 				border: 1px solid #adb5bd;
 				border-radius:3px;
 				font-size: 13px;
 				display: inline-block;
 				text-decoration: none;
 				color: #333;
 				width: 60px;
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

	
	

  %>
  
  <script type="text/javascript">
  console.log();
$(function(){
	$(".replyDiv").click(function() {
		alert("댓글을 입력하시겠습니까");
		var reply =   "<div style='font-weight: bold;'><div class='replyMark'></div>"+
		 						"<img class='commentProfile' src='http://localhost/html_prj/badasaja/images/person_1.jpg'/>바나나가좋아"+
    							"<div class='addr'>안산시 상록구 사동</div>"+
    							"<label class='writerLabel'>작성자</label>"+
    							"</div>"+
    							"<div class='commentContent' >"+
    							"<input type='text' style='width:620px'/><input type='button' value='댓글 달기' class='commentBtn'>"+
    							"<div>" +
    							"<div class='date'>2022-04-17</div>"+
    							
    							"</div></div></div>"
     $("#oneComment").append(reply);
	});//click
	
	
	 
});//ready 

function goEditForum(){
	$("#fFrm").submit();
}

  </script>
  
  
  <body>
 
  <%@include file="components/header.jsp"%>
  
  <form action="edit_forum.jsp" id="fFrm" name="fFrm" method="post">
	<input type="hidden" name="cfNum" value="<%=cfNum%>">
</form>
  
	<div style="margin: 0px auto; width: 700px; text-align: right; ">
	<c:if test = "${cVO.cID eq cId}"><a href="javascript:void(0);" onclick="goEditForum()"><input type="button" value="수정하기" class="editBtn"></a></c:if>
	</div>
									<!--container1: 제목 및 작성일시 div-->
    <div class="container1"  >
    	<table style="width: 700px">
    	<tr>
    	<td style="font-size: 20px; font-weight: bold;">제목 : ${cVO.cfTopic}</td>
    	<td></td>
    	<td style="text-align: right">${cVO.writeDate}</td>
    	</tr>
    	</table>
    </div>
    									<!---container2 : 사진 div-->
  <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
  	
    <div class="carousel-item active">
      <img src="../images/c_img/${cImg1.img}" class="d-block w-100" alt="...">
    </div>
    <c:if test="${cImg2.img!=null}">
    <div class="carousel-item">
      <img src="../images/c_img/${cImg2.img}" class="d-block w-100" alt="...">
    </div>
    </c:if>
    <c:if test="${cImg3.img!=null}">
    <div class="carousel-item">
      <img src="../images/c_img/${cImg3.img}" class="d-block w-100" alt="...">
    </div>
    </c:if>
    
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
     
    
     
   									  <!--프로필 거래상태 div  -->
    <div class="container3" style="width: 700px;height: 40px;margin-bottom: 20px">
	    <table  style="width: 700px; height: 100%">
	    	<tr>
	    		<td ><img src="" style="width:50px; height:50px" onerror="this.src='../images/user.png'"></td>
	    		<td style="padding-left: 10px"><span id="nickname">닉네임: ${cuVO.nickName}<br/> 거래만족도: ${cuVO.score}</span></td>
	    		<!-- for(HashTagVO hashTagVO : hashTagList){
	    				System.out.println(hashTagVO.getHash());
	    			} -->
	    		<c:forEach var="hVO" items="${hashTagList}" varStatus="idx">
		    		<td style="width: 100px; padding: 10px; "><label id="lb${idx.count}">${hVO.hash}</label></td>
	    		</c:forEach>
	    		<td style="text-align: right">
		    			<label id="onBoard">거래가능</label>
		    	</td>
	    	</tr>
    </table>
    </div>
    
    									<!--게시글 전문~댓글포함 div-->	
    	<div id="container4">
    	<!--게시글 전문  -->
    	<div id="textDiv">
    	${cVO.cfMain}
    	</div>
    	
    	<!--댓글 div-->
    	<div id= "commentDiv">
    	<div style=" font-family: 'NanumSquareRoundB'; font-size: 20px; margin-bottom: 20px; border-bottom: 1px solid #dfdfdf;">댓글</div>
    	<div id="oneComment">
    	
    	<!--부모 댓글  -->
    	<div class="parent">
    	<div style=" font-weight: bold; "><img class="commentProfile"src="../images/person_1.jpg" alt=""/>닉네임
    	<div class="addr" >안산시 단원구 초지동</div>
    	</div>
    	<div class="commentContent">
    	<p>지금 교환 가능한가요?</p>
    	<div>
    	<div>
    	<div class="date">2022-04-17</div>
    	<a href="#" class="replyDiv">답글 쓰기</a>
    	</div>
    	</div>
    	</div>
    	</div>
    
    	<!--자식 댓글-->
    	<!-- <div>
    	
    	<div style=" font-weight: bold; "><div class="replyMark"></div><img class="commentProfile"src="http://localhost/html_prj/badasaja/images/person_1.jpg" alt=""/>바나나가좋아
    	<div class="addr">안산시 상록구 사동</div>
    	<label class="writerLabel">작성자</label>
    	</div>
    	<div class="commentContent" >
    	<p>가능합니다</p>
    	<div>
    	<div class="date">2022-04-17</div>
    	<a href="#" class="replyDiv">답글 쓰기</a>
    	</div>
    	</div>
    	</div> -->
    	
    	</div>
    	</div>
    	</div>	
    	<div id="commentArea">
    	<!-- 댓글 달기 input & button -->
    	<input type="text" placeholder="댓글을 입력해주세요." class="commentText">
    	🔒<input type="checkbox" class="checkbox">
    	<input type="button" value="댓글 달기" class="commentBtn">
    	</div>											
    	
    	
    	<!--footer  -->
    	<%@include file="components/footer.jsp"%>
    
    										
    <!-- js 파일  -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

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