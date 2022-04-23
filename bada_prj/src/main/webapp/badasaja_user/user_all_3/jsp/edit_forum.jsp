<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <script type="text/javascript">
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
function readURL1(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview1').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview1').src = "";
	  }
	}
function readURL2(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview2').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview2').src = "";
	  }
	}

function name() {
	$("[name='frm']").submit();
}

</script>
  <body onload="name()">
  
  <%@include file="components/header.jsp"%>

 
	<form action="edit_fourm2.jsp" method="post" name="frm">
    <div class="container1" style="margin-top: 5px;">
    	<span id="title">게시글 수정</span>
    </div>
    <div class="container2">
    	<input type="text" placeholder="제목을 입력해주세요" id="topic" name="topic"style="width: 500px; border: 1px solid #dfdfdf;">
    	<select style="width:200px; border: 1px solid #dfdfdf; height: 30px;" id="category" name="category">
    	<option>카테고리</option>
    	<option>전자기기</option>
    	<option>생활용품</option>
    	<option>식품</option>
    	<option>반려동물용품</option>
    	<option>뷰티,미용</option>
    	<option>인테리어,가구</option>
    	<option>악기</option>
    	<option>기타물품</option>
    	</select>
    </div>
    <div class="container3">
    	<textarea placeholder="내용을 입력해주세요"  id="main" name="name"style="border: 1px solid #dfdfdf; width:700px; height:500px; margin-top: 10px;"></textarea>
    </div>
    <div class="container1" >
    	<p><span id="span2">바다 사자 </span>물물 교환은 <span id="span3">&nbsp;사진</span>&nbsp;이 필수입니다.</p>
    </div>
    	<table style="margin:0px auto; text-align: center;">
    	<tr>
		<td><img id="preview" />
		<br /><br/>
    	<input type="file" onchange="readURL(this);" class="btnAttach"></td>
    	<td><img id="preview1" />
		<br /><br />
    	<input type="file" onchange="readURL1(this);" class="btnAttach"></td>
    	<td><img id="preview2" />
		<br /><br />
    	<input type="file" onchange="readURL2(this);" class="btnAttach"></td>
    	</tr>
    	</table>
    	
    <div class="container4">
    	<label id="trans_obj">교환물품</label>
    	<input type="text" id="hash1" name="hash1" placeholder="#내용입력" style="width: 100px; height: 30px;">
    	<input type="text" id="hash2" name="hash2" placeholder="#내용입력" style="width: 100px; height: 30px;">
    	<input type="text" id="hash3" name="hash3" placeholder="#내용입력" style="width: 100px; height: 30px;">
    	<br/>
    	<input type="button" value="수정 완료"  style="background-color: #2a90ab; border: 0px; color:#ffffff; margin-top: 50px; margin-bottom: 50px">
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
    
  </body>
</html>