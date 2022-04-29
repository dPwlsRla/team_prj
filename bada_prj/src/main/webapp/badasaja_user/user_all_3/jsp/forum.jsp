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
	#commentProfile{
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
 #FReportDiv{
 				text-align: right; 
 				width:700px; 
 				margin: 0px auto;
 				}
 				
 	#FReportBtn{
 					 font-weight: bold;
 					  color: #333;"
 					 }
 	#profilePhoto{
 						width:50px; 
 						height:50px; 
 						position: relative;
 	
 					   }
 	#dropboxDiv{
 						  display :none;
 						  position: absolute;
						  width: 225px;
						  padding: 10px 0;
						  background-color: #fff;
						  font-size: 16px;
						  border: 1px solid #dbdbdb;
						  border-radius: 5px;
						  font-size: 14px;
 					  }
 	.deleteBtn{
 					background-color: #ff6961;
					border: 0px;
				 	font-family: 'NanumSquareRoundB';
				 	margin-bottom: 10px;
 					}
 					
 .dropbtn {
    border: none;
    cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
    background-color: #ffffff;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    overflow: auto;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown a:hover {background-color: #f1f1f1}
 
 .show {display:block;}
 
 #myform fieldset{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    border: 0; /* 필드셋 테두리 제거 */
}
#myform input[type=radio]{
    display: none; /* 라디오박스 감춤 */
}
#myform label{
    font-size: 3em; /* 이모지 크기 */
    color: transparent; /* 기존 이모지 컬러 제거 */
    text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
}

#myform label:hover{
    text-shadow: 0 0 0 #FFD400; /* 마우스 호버 */
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 #FFD400; /* 마우스 호버 뒤에오는 이모지들 */
}

#myform fieldset{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    direction: rtl; /* 이모지 순서 반전 */
    border: 0; /* 필드셋 테두리 제거 */
}

#myform fieldset legend{
    text-align: left;
}

#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 #FFD400; /* 마우스 클릭 체크 */
}

#profilePhoto2{
					width:50px; 
 					height:50px;
 					float : left;
 					margin-right: 10px;
 					margin-left: 100px;
 					margin-top: 20px;
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
	
	//게시물 신고 버튼을 눌렀을 때 모달 띄우기
	$("#FReportBtn").click(function(e) {
		e.preventDefault();
		$('#testModal8').modal("show");
		
		$('#sendBtn').click(function(e) {
			$('#testModal8').modal("hide");	
		//전송 버튼을 눌렀을 때 데이터 보내기
		
		})//sendBtnclick
		
		$("#cancelBtn").click(function(e){
			$('#testModal8').modal("hide");	
		})//cancelBtn
		
		$(".close").click(function(e) {
			$('#testModal8').modal("hide");	
		});//closeClick
		
	});//Freportclick
	
	//게시글 삭제버튼을 눌렀을 때 모달 띄우기
	$(".deleteBtn").click(function(e) {
		e.preventDefault();
		$('#testModal7').modal("show");
		
		//게시글 삭제확인
		$("#search").click(function(e) {
			$("#testModal7").modal("hide");
		});
		//게시글 삭제 취소
		$("#cancel").click(function() {
			$("#testModal7").modal("hide");
		});
		
		$(".close").click(function(e) {
			$('#testModal7').modal("hide");	
		});//closeClick
	})//deleteBtnClick
	
	
	
	$("#Creport").click(function(e) {
		e.preventDefault();
		$('#testModal9').modal("show");
		
		//계정 신고 제출
		$("#sendBtn2").click(function(e) {
			$("#testModal9").modal("hide");
		});
		//계정 삭제 취소
		$("#cancelBtn2").click(function(e) {
			$("#testModal9").modal("hide");
		});
		//닫기 누르기
		$(".close").click(function(e) {
			e.preventDefault();
			$('#testModal9').modal("hide");	
		});//closeClick
		
	});//CreportClick
	
	$("#score").click(function(e){
		$("#testModal10").modal("show");
		//별점 제출
		$("#sendBtn3").click(function(e) {
			$("#testModal10").modal("hide");
		});
		//별점 취소
		$("#cancelBtn3").click(function(e) {
			$("#testModal10").modal("hide");
		});
		//닫기 누르기
		$(".close").click(function(e) {
			e.preventDefault();
			$('#testModal10').modal("hide");	
		});//closeClick
	});//scoreClick
	
	$("#CReport2").click(function(e) {
		e.preventDefault();
		$('#testModal9').modal("show");
		
		//계정 신고 제출
		$("#sendBtn2").click(function(e) {
			$("#testModal9").modal("hide");
		});
		//계정 삭제 취소
		$("#cancelBtn2").click(function(e) {
			$("#testModal9").modal("hide");
		});
		//닫기 누르기
		$(".close").click(function(e) {
			e.preventDefault();
			$('#testModal9').modal("hide");	
		});//closeClick
		
	});//CreportClick2
	
	$("#score2").click(function(e){
		e.preventDefault();
		$("#testModal10").modal("show");
		//별점 제출
		$("#sendBtn3").click(function(e) {
			$("#testModal10").modal("hide");
		});
		//별점 취소
		$("#cancelBtn3").click(function(e) {
			$("#testModal10").modal("hide");
		});
		//닫기 누르기
		$(".close").click(function(e) {
			e.preventDefault();
			$('#testModal10').modal("hide");	
		});//closeClick
	});//scoreClick2
	
	$("#Trans").click(function(e) {
		e.preventDefault();
		$("#testModal5").modal("show");
		
		$("#okBtn").click(function(e) {
			$("#testModal5").modal("hide");
		});
	
	$(".close").click(function(e) {
		e.preventDefault();
		$("#testModal5").modal("hide");	
	});
	});//transClick

	
	 
});//ready 

function goEditForum(){
	$("#fFrm").submit();
}

//드롭다운 
function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}//myFunction()



  </script>
  
  
  <body>
 
  <%@include file="components/header.jsp"%>
  
  <form action="edit_forum.jsp" id="fFrm" name="fFrm" method="post">
	<input type="hidden" name="cfNum" value="<%=cfNum%>">
</form>
  
	<div style="margin: 0px auto; width: 700px; text-align: right; ">
	<c:if test = "${cVO.cID eq cId}"><a href="javascript:void(0);" onclick="goEditForum()"><input type="button" value="수정하기" class="editBtn"></a></c:if>
	<a href="javascript:void(0);" onclick=""><button id="testBtn7" class="deleteBtn">삭제 하기</button></a>
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
	    		<td >
	    		<div class="dropdown">
	    		<img id="profilePhoto" src="" onerror="this.src='../images/user.png'" class="dropbtn" onclick="myFunction()">
				  <div id="myDropdown" class="dropdown-content">
				    <a href="#score" id="score">친절 점수 주기</a>
				    <a href="#Creport" id="Creport">계정 신고</a>
				  </div>
				</div>
	    		</td>
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
    
    									<!--거래약속 모달  -->
    									
 <div class="modal fade" id="testModal5" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">거래 약속</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       거래를 확정하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="okBtn">OK</button>
      </div>
    </div>
  </div>
</div>
										<!--계정 신고 모달-->
<div class="modal fade" id="testModal9" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">계정 신고</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">
				 <span style="float: left;">계정 신고</span>
            </label>
             
             <select name="language" style=" float: right; margin-bottom: 1px;">
				    <option value="none">사유선택</option>
				    <option value="korean" >욕설</option>
				    <option value="english">비방</option>
				    <option value="chinese">사기</option>
			</select>
            <input type="text" class="form-control" id="recipient-name" placeholder="제목">
          </div>
          <div class="form-group">
          <label for="recipient-name" class="col-form-label"> </label>
            <textarea class="form-control" style="height: 300px;" id="message-text" placeholder="신고 내용을 입력해주세요"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="cancelBtn2">CANCEL</button>
        <button type="button" class="btn btn-primary" id="sendBtn2">SEND</button>
      </div>
    </div>
  </div>
</div>
 									  <!--친절도 점수 주기 모달  -->
<div class="modal fade" id="testModal10" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">친절도</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="form-group" style="text-align: center">
				 <span style="font-weight: bold; font-size: 25px; font-family: ">친절도 점수</span><br/>
				 <img src="" onerror="this.src='../images/user.png'" id="profilePhoto2"/>
				 <div style="float: left; margin-top: 20px;">
				 <label>닉네임 : </label><br/>
				 <label>거래만족도 :</label><br/>
				 </div>
				 <form name="myform" id="myform" method="post" action="./save">
				    <fieldset>
				        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
				        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
				        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
				        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
				        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
				    </fieldset>
				</form>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="cancelBtn3">CANCEL</button>
        <button type="button" class="btn btn-primary" id="sendBtn3">SEND</button>
      </div>
    </div>
  </div>
</div>
   


    		
    		
   										<!--게시물 삭제하기 모달-->
  
  <div class="modal fade" id="testModal7" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">게시글 삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      확인 버튼을 누르면 게시글이 영구적으로 삭제 됩니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="cancel">취소</button>
        <button type="button" class="btn btn-primary" id="search">확인</button>
      </div>
    </div>
  </div>
</div>
    					
    		
    
    
    									<!--게시글 전문~댓글포함 div-->	
    	<div id="container4">
    	<!--게시글 전문  -->
    	<div id="textDiv">
    	${cVO.cfMain}
    	</div>
    	
    	<!--게시글 신고하기 버튼 -->
    	<div id="FReportDiv"><label id="FReportBtn" >🚨 게시글 신고</label></div>
    	
    	<!--게시글 신고하기 modal -->
    	<div class="modal fade" id="testModal8" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">게시글 신고</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">
				 <span style="float: left;">게시글 신고</span>
            </label>
             
             <select name="language" style=" float: right; margin-bottom: 1px;">
				    <option value="none">사유선택</option>
				    <option value="korean" >부적합 사진</option>
				    <option value="english">사기 매매</option>
				    <option value="chinese">광고</option>
			</select>
            <input type="text" class="form-control" id="recipient-name" placeholder="제목">
          </div>
          <div class="form-group">
          <label for="recipient-name" class="col-form-label"> </label>
            <textarea class="form-control" style="height: 300px;" id="message-text" placeholder="신고 내용을 입력해주세요"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button id="cancelBtn" type="button" class="btn btn-secondary" data-dismiss="modal">CANCEL</button>
        <button id="sendBtn" type="button" class="btn btn-primary">SEND</button>
      </div>
    </div>
  </div>
</div>
    	<!--댓글 div-->
    	<div id= "commentDiv">
    	<div style=" font-family: 'NanumSquareRoundB'; font-size: 20px; margin-bottom: 20px; border-bottom: 1px solid #dfdfdf;">댓글</div>
    	<div id="oneComment">
    	
    	<!--부모 댓글  -->
    	<div class="parent">
    	<div style=" font-weight: bold; ">
    	<div class="dropdown">
	    <img id="commentProfile" src="../images/person_1.jpg" alt=""  id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false"/>닉네임
	  <!--드롭다운 메뉴 -->
  	<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    	<li><a class="dropdown-item" href="#score" id="score2">친절 점수 주기</a></li>
    	<li><a class="dropdown-item" href="#CReport" id="CReport2">계정 신고</a></li>
    	<li><a class="dropdown-item" href="#goTransaction" id="Trans">거래 약속 신청</a></li>
  	</ul>
	</div>
    	
    	
    	
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
    	</div>
    	</div>
    	</div>	
    	
    	
    	
    	<!-- 댓글 달기 input & button -->
    	<div id="commentArea">
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