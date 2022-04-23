
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>로그인</title>
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
	  #container{
	  	margin: 0px auto;
	  	font-family: 'NanumSquareRound';
	  }
	  input{
	 	margin: 5px;
	 	padding-left: 10px;
	 	font-family: 'NanumSquareRound';
	  }
	 
	  #loginChk{
	  	font-size: 5px;
	  	font-family: 'NanumSquareRound';
	  }
	  
	  .banner_line{
	  border: 0px;
	  background-color: #fada95;
	  height: 25px;
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
  
  
  <%@include file="components/header.jsp"%>

      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"> </div>
        </div>
    </div>  

    <div class="site-section">
    	<div style="text-align: center; font-family: 'NanumSquareRoundB'; ">
    	<h3>로그인</h3>
   
    	<div style="text-align: center;">
    	
    	<form action="login_check.jsp" id="frm" method="post">
    	<table style="margin: 0px auto;">
    	<tr>
	    	<td colspan="3" class="loginInput"><input type="text" id="id" name="id" placeholder="아이디" style="width: 250px"/></td>
    	</tr>
    	<tr>
    		<td colspan="3" class="loginInput"><input type="password" id="passWd" name="passWd" placeholder="패스워드" style="width: 250px"/></td>
    	</tr>
  
    	<tr id="loginChk">
	    	<td style="text-align: left"><input type="checkbox" id="chk"/>아이디 저장</td>
	    	<td></td>
	    	<td style="text-align: right"><a href="#" id="search_id">아이디 찾기</a> | <a href="#" id="search_pass">비밀번호 찾기</a></td>
    	</tr>
    	</table>
  
    	</form>
    	<br>
    	</div>

      	<!-- <a href="index.jsp"> -->
      	<input type="button" value="로그인" id="login_btn" style="width: 250px; height: 35px; font-weight: bold; background-color: #fada95;  border: 0px;" /><br/>
      	<a href="checkout1.jsp"><input type="button" value="회원 가입" style="width: 250px; height: 35px; background-color: #2a90ab; font-weight: bold; color:#ffffff; border: 0px;"/></a>
      </div>
    </div>

<!-- 기능부분 -->
<% %>

  <!--모달  -->
  
  
  <!-- 아이디 찾기 -->
  <div style="z-index: 10;">
  <div class="modal fade" id="search_id_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">아이디 찾기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">E-Mail입력</label>
            <input type="text" class="form-control" id="recipient-name" placeholder="가입시 입력하신 이메일을 적어주세요.">
            <span style="font-size: 5px; color: #ff0000;">일치하는 이메일이 없습니다.</span>
          </div>
			 <div class="modal-body">
        		입력하신 메일로 전송되었습니다.
      		</div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="close1">CLOSE</button>
        <button type="button" class="btn btn-primary">SEND</button>
      </div>
    </div>
  </div>
</div>
</div>


<!-- 로그인 실패 -->
<!-- 나중에 담당자가 함수처리해야함 -->
<div style="z-index: 10;">
<div class="modal fade" id="fail" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">로그인 실패</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="color: #ff0000;">
        아이디 비밀번호를 다시 입력해주세요
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="close2">OK</button>

      </div>
    </div>
  </div>
</div>
</div>

<!-- 비밀번호 찾기 -->
<div style="z-index: 10;">
<div class="modal fade" id="search_pass_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">비밀번호 찾기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">아이디 입력</label>
            <input type="text" class="form-control" id="recipient-name" placeholder="아이디를 입력해주세요">
            <span style="font-size: 5px; color: #ff0000;">일치하는 회원이 없습니다.</span>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">가입시 입력하신 이메일을 적어주세요.</label>
            <input type="text" class="form-control" id="recipient-name" placeholder="가입시 입력하신 이메일을 적어주세요.">
            <span style="font-size: 5px; color: #ff0000;">일치하는 이메일이 없습니다.</span>
          </div>          

        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="close3">CANCEL</button>
        <button type="button" class="btn btn-primary" id="search_pass2">SEARCH</button>
      </div>
    </div>
  </div>
</div>
</div>

<!-- 비밀번호 찾기 2 -->
<div style="z-index: 15;">
<div class="modal fade" id="search_pass_modal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">비밀번호 찾기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Name님의 임시 비밀번호가 이메일로 전송되었습니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="close4">OK</button>
      </div>
    </div>
  </div>
</div>
</div>
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
  
  $(function () {
		$('#login_btn').click(function () {
			if($("#id").val()=='' || $("#passWd").val()==''){
				$('#fail').modal("show");
				return;
			}
			$("#frm").submit();		
		})
	  
	  /* 아이디 찾기  */
	  $('#search_id').click(function(e){
			e.preventDefault();
			$('#search_id_modal').modal("show");
		});
	  
		$('#close1').click(function(e){
			e.preventDefault();
			$('#search_id_modal').modal("hide");
		});
		
		/* 비밀번호 찾기  */
		$('#search_pass').click(function(e){
				e.preventDefault();
				$('#search_pass_modal').modal("show");
			});
		  
		$('#close2').click(function(e){
				e.preventDefault();
				$('#search_pass_modal').modal("hide");
		});
		
		/* 비밀번호 찾기2  */
		$('#search_pass2').click(function(e){
				e.preventDefault();
				$('#search_pass_modal2').modal("show");
			});
		  
		$('#close4').click(function(e){
				e.preventDefault();
				$('#search_pass_modal2').modal("hide");
				$('#search_pass_modal').modal("hide");
		});

	  
})
  </script>

   
  </body>
</html>