<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>게시글 상세보기</title>
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
						border: 1px solid #dfdfdf;
						width:700px;
						height:300px;
						margin: 0px auto;
						margin-bottom: 20px;
						color: #333;
						font-family: 'NanumSquareRound'';
						}
	#commentText{
					width:580px;
					height:30px;
					border: 1px solid #dfdfdf;
					}
	#commentBtn{
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
						}
	#parentCom{
					width: 700px;
					}
	#childCom{
					width: 700px;
					padding-left: 30px;
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
						
  </style>
  <body>
 
  <%@include file="components/header.jsp"%>
  
	<div style="margin: 0px auto; width: 700px; text-align: right; ">
	<input type="button" value="수정하기" class="editBtn">
	</div>
									<!--container1: 제목 및 작성일시 div-->
    <div class="container1"  >
    	<table style="width: 700px">
    	<tr>
    	<td style="font-size: 20px; font-weight: bold;">제목 : 바나나우유 딸기 우유</td>
    	<td></td>
    	<td style="text-align: right">2022-03-31 02:57AM</td>
    	</tr>
    	</table>
    </div>
    </div>
    									<!---container2 : 사진 div-->
  
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="nonloop-block-3 owl-carousel">
              <div class="item">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="../images/cloth_1.jpg" alt="Image placeholder" class="img-fluid">
                  </figure>
                </div>
              </div>
              <div class="item">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="../images/cloth_1.jpg" alt="Image placeholder" class="img-fluid">
                  </figure>
                </div>
              </div>
              <div class="item">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="../images/cloth_2.jpg" alt="Image placeholder" class="img-fluid">
                  </figure>
                </div>
              </div>
            
              
            </div>
          </div>
        </div>
      </div>
    
     
   									  <!--프로필 거래상태 div  -->
    <div class="container3" style="width: 700px;height: 40px;margin-bottom: 20px">
	    <table  style="width: 700px; height: 100%">
	    	<tr>
	    		<td ><img src="" style="width:50px; height:50px" onerror="this.src='../images/user.png'"></td>
	    		<td style="padding-left: 10px"><span id="nickname">닉네임: 바나나가 좋아<br/> 거래만족도: 4.5</span></td>
	    		<td style="width: 100px; padding: 10px; "><label id="lb1">#딸기우유</label></td>
	    		<td style="width: 100px; padding: 10px;"><label id="lb2">#딸기우유</label></td>
	    		<td style="width: 100px; padding: 10px;" ><label id="lb3">#딸기우유</label></td>
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
    	
    	</div>
    	<!--댓글 div-->
    	<div id= "commentDiv">
    	<div id="commentArea">
    	
    	<!--부모 댓글  -->
    	<div id="parentCom">
    	<table>
    	<tr>
    	<td width="600px;">작성자1 : 이거 교환 가능한가요?</td>
    	<td>2022.04.15.10:00AM</td>
    	<td><img src="../images/dots.png" style="width:20px; height:20px; vertical-align: middle; padding-bottom: 3px"></td>
    	</tr>
    	</table>
    	</div>
    	
    	<div id="childCom">
    	<table>
    	<tr>
    	<td width="600px;"><img id="replyArrow" src="../images/right-arrow.png">작성자2 : 가능합니다.</td>
    	<td>2022.04.15.10:00AM</td>
    	<td><img src="../images/dots.png" style="width:20px; height:20px; vertical-align: middle; padding-bottom: 3px"></td>
    	</tr>
    	</table>
    	</div>
    	<!--부모 댓글  -->
    	<div id="parentCom">
    	<table>
    	<tr>
    	<td>🔒</td>
    	<td width="600px;">작성자3 : 공짜로 받을 수 없나요?</td>
    	<td>2022.04.15.10:00AM</td>
    	<td><img src="../images/dots.png" style="width:20px; height:20px; vertical-align: middle; padding-bottom: 3px"></td>
    	</tr>
    	</table>
    	</div>
    	
    									<!--대댓글 구현  -->
    	<input type="text" placeholder="댓글을 입력해주세요." id="commentText">
    	🔒<input type="checkbox" class="checkbox">
    	<input type="button" value="댓글 달기" id="commentBtn">
    	</div>										
    	</div>
    	<div id="commentArea">
    	<!-- 댓글 달기 input & button -->
    	<input type="text" placeholder="댓글을 입력해주세요." id="commentText">
    	🔒<input type="checkbox" class="checkbox">
    	<input type="button" value="댓글 달기" id="commentBtn">
    	</div>											
    	
    	</div><!--container4/-->
    	
    	<!--footer  -->
    	<%@include file="components/footer.jsp"%>
    
    										
    <!-- js 파일  -->
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