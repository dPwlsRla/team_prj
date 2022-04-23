<%--
  Created by IntelliJ IDEA.
  User: seohuisu
  Date: 2022/04/12
  Time: 10:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- rset=UTF-8" language="java" %> -->
<!DOCTYPE html>
<html lang="en">
<head>
    <title>settings</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
<%String password = (String)session.getAttribute("name");%>
<body onload="load()">
  <form action="settings2.jsp" id="frm">
<div class="site-wrap">
    <%@include file="components/header.jsp"%>

    <div class="site-section">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md-9 order-2">
                    <div class="bg-white shadow rounded-lg d-block d-sm-flex">
                        <div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
                            <div class="tab-pane fade show active" id="account" role="tabpanel" aria-labelledby="account-tab">
                                <h1 class="mb-4">계정 관리</h1>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>아이디</label>
                                            <input type="text" class="form-control" value="cok854">
                                            <span style="float: right;color: red;font-size: 12px">중복 아이디가 있습니다.</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>닉네임</label>
                                            <input type="text" class="form-control" >
                                            <span style="float: right;color: red;font-size: 12px">중복된 닉네임이 있습니다.</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>이메일</label>
                                            <input type="text" class="form-control" value="kiranacharya287@gmail.com">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>휴대폰 번호</label>
                                            <input type="text" class="form-control" value="010-1234-1234">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>주소</label>
                                            <select id="c_country" class="form-control" >
                                                <option value="1">구 선택</option>
                                                <option value="2">강남구</option>
                                                <option value="3">서초구</option>
                                                <option value="4">강동구</option>
                                                <option value="5">송파구</option>
                                                <option value="6">중랑구</option>
                                                <option value="7">중구</option>
                                                <option value="8">구로구</option>
                                                <option value="9">성동구</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="password-group">
                                        <div class="col-md-7">
                                            <div class="form-group">
                                                <label>현재 비밀번호</label>
                                                <input type="password" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-7">
                                            <div class="form-group">
                                                <label>새 비밀번호</label>
                                                <input type="password" class="form-control">
                                                <span style="float: right;color: red;font-size: 12px">영문, 숫자 조합 8~16자로 적어주세요.</span>
                                            </div>
                                        </div>
                                        <div class="col-md-7">
                                            <div class="form-group">
                                                <label>비밀번호 확인</label>
                                                <input type="password" class="form-control">
                                                <span style="float: right;color: red;font-size: 12px">비밀번호 확인 문자가 다릅니다.</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                    </div>
                                </div>
                                <div>
                                    <button class="btn btn-primary">변경하기</button>
                                    <button class="btn btn-danger" style="float:right" id="exit">탈퇴</button>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
                <%@include file="components/mypage_nav.jsp"%>
            </div>
        </div>
    </div>
</div>



<div class="modal fade" id="exit_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">회원 탈퇴</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <input type="checkbox" value="exit">
      탈퇴 확인 버튼을 누르시면 회원 복구가 불가능합니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="close">취소</button>
        <button type="button" class="btn btn-primary" id="search">탈퇴 확인</button>
      </div>
    </div>
  </div>
</div>

</form>
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
		  /* 게시글 작성 완료  */
		  $('#exit').click(function(e){
				e.preventDefault();
				$('#exit_modal').modal("show");
			});
		  $('#close').click(function(e){
				e.preventDefault();
				$('#exit_modal').modal("hide");
			});
    	
	})//ready
    function load() {
	 $.ajax({
			url:"settings2.jsp",
			type:"post",
			data:{"password":<%=password%>} ,
			dataType : "text",
			error:function(xhr){
				alert(xhr.status+"/"+xhr.status.text)
			},
			success:function(data){
				alert(data)
			}
		})//ajax
		
	}//load
 
</script>
</body>
</html>