<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>회원 가입 완료</title>
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
  #searchArea{margin-left: 30px;}
  .main_banner{margin-left: 30px;}
  #container{margin: 0px auto;}
  
   .banner_line{
	  border: 0px;
	  background-color: #fada95;
	  height: 25px;
	  }
	#btnLogin{
	  	border:0px;
	  	background-color: #fada95;
	  	width: 200px;
	  	height:30px;
	  	margin-top: 50px;
	  }
	  
	 #signUp{
	 color : #fada95;
	 font-weight: bold;
	 font-size: 40px;
	 }
	 
	 #seaLion{
	 color :  #2a90ab;
	 font-weight: bold;
	 font-size: 40px;
	 
	 }
	 
	 .span1{
	 		font-size: 20px;
	 		color: #333;
	 		font-weight: bold;
	 		}
	 		
	.site-section{
					font-family: 'NanumSquareRound';
	 			   }
	.container{
				  font-family: 'NanumSquareRound';
				  }
 #mainLogo{
 				width : 300px;
 				height: 100px;
 				}
 	#footer{
	  			height:200px;
	  			border-top: 1px solid #dfdfdf;
	  			text-align: center; 
	  			padding-top: 30px;"
	  			}
  </style>
  <body>
  
  <div class="site-wrap">
      <%@include file="components/header.jsp"%>

      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"> </div>
      </div>
    </div>  

    <div class="site-section">
    	<div style="text-align: center">
    	<img src="../images/sealion_logo.png" /><br/>
      <span id="signUp">회원가입</span><span class="span1">이 정상처리 되었습니다.</span><br/>
      	<span id="seaLion">바다사자</span><span class="span1">와 함께 해주셔서 감사합니다.</span><br/>
      	<a href="login.jsp"><input type="button" value="로그인 하러 가기" id="btnLogin"/></a>
      </div>
    </div>
  </div>

	<!--footer  -->
    	  <%@include file="components/footer.jsp"%>
    	
   <!--js 파일  --> 							
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