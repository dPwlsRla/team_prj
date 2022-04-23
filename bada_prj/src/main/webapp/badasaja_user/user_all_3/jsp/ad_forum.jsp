<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>광고게시글</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
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
  #btnSearch{
  				 background-color: #e0e0e0; 
  				 border: 0px; 
  				 border-radius:5px; 
  				 width:60px; 
  				 font-weight: bold;
  				 font-family: 'NanumSquareRound';
  				}
  #container{margin: 0px auto;}
  #span1{
  			font-style: bold; 
  			font-size: 15px; 
  			color: #333;
  			font-family: 'NanumSquareRound';
  			}
  
  #span2{text-align: right; }
  
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
  				  }
  .container3{
  				  margin: 0px auto;
  				  font-family: 'NanumSquareRound';
  				  color: #333;
  				  }
  .container4{text-align: center;
  				 font-family: 'NanumSquareRound';	
  				 color: #333;
  				 }
 
  .banner_line{
	  border: 0px;
	  background-color: #fada95;
	  height: 25px;
	  margin-bottom: 10px;
	  }

#nickname{ 
				font-weight: bold;
				color: #333;
				vertical-align: middle;

				}
#mainLogo{
 				width : 300px;
 				height: 100px;
 				}
 				
 #onBoard{
 				background-color: #fada95;
 				border-radius: 5px;
 				width:70px;
 				font-size: 20px;
 			  	text-align: center;
 			  	font-family: 'NanumSquareRoundB';
 			  }
 #profileTd{
 				width:60px; 
 				padding-top: 6px;
 				}
 				
 #footer{
	  			height:200px;
	  			border-top: 1px solid #dfdfdf;
	  			text-align: center; 
	  			padding-top: 30px;"
	  			}
#textDiv{
			width: 700px;
			height: 300px;
			
			border-bottom: 1px solid #dfdfdf;
			border-top: 1px solid #dfdfdf;
			
			margin: 0px auto;
			margin-bottom: 50px;
			}
#carouselExampleControls{
									width: 600px;
   									margin: 0px auto;
									}
  </style>
  <body>
  
<%@include file="components/header.jsp"%>

  
	<div style="margin: 0px auto; width: 700px; text-align: right; ">
	</div>
    <div class="container1"  >
    	<table style="width: 700px">
    	
    	<tr>
    	<td style="font-size: 20px; font-weight: bold; ">제목 : 광고게시글</td>
    	<td></td>
    	<td style="text-align: right">2022-03-31 02:57AM</td>
    	</tr>
    	</table>
    </div>
    
    	<!---container2 : 사진 div-->
 	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="../images/cloth_1.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="../images/cloth_2.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="../images/cloth_3.jpg" class="d-block w-100" alt="...">
    </div>
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
      
  
  	<!--프로필 거래 상태  -->
    <div class="container3" style="width: 700px">
    <table  style="width: 700px; height: 100%">
	    	<tr>
	    		<td id="profileTd" >
	    		<input type="image" style="width:50px; height:50px" src="../images/user.png"></td>
	    		<td ><span id="nickname">닉네임: 하남돼지집</span></td>
	   
	    		<td style="text-align: right">
		    		<label id="onBoard">광고중</label>
		    	</td>
	    	</tr>
    </table>
    </div>
    <div class="container4" >
    	<div id="textDiv"></div>
  </div>
  
  <!--footer  -->
    		<%@include file="components/footer.jsp"%>				
    				
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