<%--
  Created by IntelliJ IDEA.
  User: seohuisu
  Date: 2022/04/12
  Time: 10:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>settings_password</title>
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
<body>

<form action="settings_password2.jsp" id="frm" method="post">
<div class="site-wrap">
    <%@include file="components/header.jsp"%>
    <div class="site-section">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md-9 order-2">
                    <div class="bg-white shadow rounded-lg d-block d-sm-flex" style="height: 500px">
                        <div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
                            <div class="tab-pane fade show active" id="account" role="tabpanel" aria-labelledby="account-tab">
                                <h1 class="mb-4">계정 관리</h1>
                                <h4 class="text-black"><a href="#">Name</a>님</h4>
                                <h6 class="text-black"><a href="#">Name</a>님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.</h6>
                                <div class="row" style="margin: 0 auto; margin-top:40px">
                                    <h5 class="text-black" style="margin-top:7px; margin-right:10px">비밀번호</h5>
                                    <input type="password" placeholder="내용을 입력해주세요" class="form-control" name="pass" style="width:60%; margin-right:20px ">
                                    <a href="settings.jsp"><button class="btn" id="btn">확인</button></a>
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
	$("#btn").click(function () {
		$("#frm").submit();
	})
})//ready
</script>
</body>
</html>