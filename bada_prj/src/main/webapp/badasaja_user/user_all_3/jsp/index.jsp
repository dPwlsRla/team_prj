<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="수정"%>
<%
String id="null";
if(session.getAttribute("cId")!=null){
	id="exist";
}

%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>바다사자</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
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

    
   

  <style type="text/css">
  
  .carousel-inner > .carousel-item > img{ width: 500px; height: 400px;}

  
  #searchArea{
  					margin-left: 30px;
  					font-family: 'NanumSquareRound';
  					}
  .main_banner{
  					margin-left: 30px;
  					font-family: 'NanumSquareRoundB';
  					}
  	#btnSearch{
  					 background-color: #e0e0e0;
  					 border: 0px; 
  					 border-radius:5px;
  					 width:60px;
  					 font-weight: bold;
            		 font-family: 'NanumSquareRound';
  					}
  	
  #div1{
  			height: 400px; 
  			border: 1px solid #333; 
  			background-image: url("../images/main_header.png");
  			background-repeat: no-repeat;  
  			background-position: center; 
  			background-color: #fbd896;
  			border: 0px
  			}
  #div2{
  			height: 400px; 
  			border: 0px;
  			font-family: 'NanumSquareRound';}
  #div3{
  			
  		   height: 400px; 
  		   border: 1px solid #333; 
  		   border: 0px; 
  		   background-color: #2a90ab;
  		   font-family: 'NanumSquareRound';
  		   }
  		   
  #category{
  				width: 1000px; 
  				height:400px;
  				margin: 0px auto;
  				text-align: center;
  				font-family: 'NanumSquareRound';
  				font-size:20px;
  				margin-top: 100px;
  				color: #333;
  				}
  				
  #h2{
  		margin-left: 400px;
  		margin-top: 40px;
  		color: #000000;
  		font-family: 'NanumSquareRoundB';
  		}
  
  #textDiv{ 
  			  float:left;
  			  margin-left: 500px;
  			  margin-top: 70px;
  			  }
  #slideDiv{
  			  float:right;
  			  margin-right: 500px;
  			  margin-top: 70px;
  			  }
  			  
 		ul{	
 			color:#333;	
 			}
 	 .info{
 	 		font-size: 20px;
 	 		}
 	 		
 	 #cardDiv{
 	 			  width:600px;
 	 			  margin: 0px auto;
 	 			 }
 	 			 
 	.carousel-inner{
 						margin: 0px auto;
 						margin-top:50px;
 						width: 600px;
 						height:400px;
 						}
 		#mainLogo{
 						width : 300px;
 						height: 100px;
 		
 						}
 		.emoji{
 				font-size: 60px;
 				}
 				
 		.container{
 					  font-family: 'NanumSquareRound';
 					  color:#000000;
 					 }
.carousel-control-prev {
							    height: 30px;
							    margin-top: 190px;
							    margin-left: 530px;
							    }
.carousel-control-next{
 		 						height: 30px;
 		 						margin-top: 190px;
    							margin-right: 530px;
 							  }
 							  
 #footer{
	  		height:200px;
	  		border-top: 1px solid #dfdfdf;
	  		text-align: center; 
	  		padding-top: 30px;
	  		}
	  		
#howtouse{
				border-top: 1px solid #dfdfdf;
				padding-bottom: 50px;
				}
 

  </style>
<script type="text/javascript">
$(function () {
	$('#cancel').click(function(e){
		e.preventDefault();
		$('#Modal').modal("hide");
	});
	
	$('#login').click(function(e){
		e.preventDefault();
		$('#Modal').modal("hide");
		location.href="login.jsp";
	});

})//ready

</script>
  </head>
  <body>
  
  <div class="site-wrap">
  <%@include file="components/header.jsp"%>
     <input type="hidden" id="hid" value="<%=id%>">

    <div id="div1" style="margin-top: -10px">
    </div>
    <div id="div2" >
   <!--<h2 id="h2">상품카테고리</h2>  -->
   <%if(id=="null"){ %>
   	<table  id="category">
   	<tr>
   	<td><a href="javascript:void(0)" class="emoji" onclick="load2()">📱</a><br/>전자기기</td>
   	<td><a href="javascript:void(0)" class="emoji" onclick="load2()">🛍️</a><br/>생활용품</td>
   	<td><a href="javascript:void(0)" class="emoji" onclick="load2()">🍎</a><br/>식품</td>
   	<td><a href="javascript:void(0)" class="emoji" onclick="load2()">🐶</a><br/>반려동물 용품</td>   	
   	<td><a href="javascript:void(0)" class="emoji" onclick="load2()">🧥</a><br/>의류</td>   	
   	</tr>
   	<tr>
   	<td><a href="javascript:void(0)" class="emoji" onclick="load2()">💄</a><br/>뷰티/미용</td>   	
   	<td><a href="javascript:void(0)" class="emoji" onclick="load2()">🛏️</a><br/>인테리어/가구</td>
   	<td><a href="javascript:void(0)" class="emoji" onclick="load2()">✏️</a><br/>학용품</td>
   	<td><a href="javascript:void(0)" class="emoji" onclick="load2()">🎻</a><br/>악기</td>
   	<td><a href="javascript:void(0)" class="emoji" onclick="load2()">🙋</a><br/>기타물품</td>   	
   	</tr>
   	</table>
   	<%}else{ %>

   	<table  id="category">
   	<tr>
   	<td><a href="trade.jsp?product=전자기기" class="emoji" >📱</a><br/>전자기기</td>
   	<td><a href="trade.jsp?product=생활용품" class="emoji" >🛍️</a><br/>생활용품</td>
   	<td><a href="trade.jsp?product=식품" class="emoji" >🍎</a><br/>식품</td>
   	<td><a href="trade.jsp?product=반려 동물 용품" class="emoji" >🐶</a><br/>반려동물 용품</td>   	
   	<td><a href="trade.jsp?product=의류" class="emoji" >🧥</a><br/>의류</td>   	
   	</tr>
   	<tr>
   	<td><a href="trade.jsp?product=뷰티,미용" class="emoji" >💄</a><br/>뷰티/미용</td>   	
   	<td><a href="trade.jsp?product=인테리어,가구" class="emoji" >🛏️</a><br/>인테리어/가구</td>
   	<td><a href="trade.jsp?product=학용품" class="emoji" >✏️</a><br/>학용품</td>
   	<td><a href="trade.jsp?product=악기" class="emoji" >🎻</a><br/>악기</td>
   	<td><a href="trade.jsp?product=기타 물품" class="emoji" >🙋</a><br/>기타물품</td>   	
   	</tr>
   	</table>
   	
   	<%} %>
    </div>
    <div id="howtouse">
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
  </div><!--howtouse  -->
  
   </div><!--site-wrap  -->
  
    <!-- 로그인이 필요한 서비스입니다. -->
<div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">앗 바다사자 회원이 아니시군요!</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        로그인이 필요한 서비스입니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="cancel">CANCEL</button>
        <button type="button" class="btn btn-primary" id="login">LOGIN</button>
      </div>
    </div>
  </div>
</div>

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