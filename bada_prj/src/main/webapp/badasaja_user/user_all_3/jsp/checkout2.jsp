<%--
  Created by IntelliJ IDEA.
  User: seohuisu
  Date: 2022/04/12
  Time: 9:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="신유철 수정중"%>
    <%request.setCharacterEncoding("UTF-8"); %>
  
   <!-- 닉네임 중복 플래그  -->
<!DOCTYPE html>
<html lang="en">
<head>
    <title>checkout2</title>
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
<body style="text-align: center">

<div class="site-wrap">
    <%@include file="components/header.jsp"%>
</div>
<h2 class="h3 mb-3 text-black">회원가입</h2>
<div style="width: 500px;border: 1px solid #333;display: inline-block;text-align: left">
 <form action="checkout3.jsp" method="post" id="checkout2Frm" name="checkout2Frm">
    <div class="p-3 p-lg-5">
        <div class="form-group row">
            <div class="col-md-12">
                <label for="c_companyname" class="text-black">아이디<span class="text-danger">*</span> </label>
                <input type="text" class="form-control" id="c_id" name="c_id">
                <span style="float: right;color: red;font-size: 12px;display: none;" id="red1">중복 아이디가 있습니다.</span>
            </div>
            <div class="col-md-12">
                <label for="c_companyname" class="text-black">비밀번호<span class="text-danger">*</span> </label>
                <input type="password" class="form-control" name="c_pass" id="c_pass" >
                <span style="float: right;color: red;font-size: 12px;display: none;" id="red2">영문, 숫자 조합 8~16자로 적어주세요.</span>
            </div>
            <div class="col-md-12">
                <label for="c_companyname" class="text-black">비밀번호 확인<span class="text-danger">*</span> </label>
                <input type="password" class="form-control" name="c_pass2" id="c_pass2" >
                <span style="float: right;color: red;font-size: 12px;display: none;" id="red3">비밀번호 확인 문자가 다릅니다.</span>
            </div>
            <div class="col-md-12">
                <label for="c_companyname" class="text-black">닉네임<span class="text-danger">*</span> </label>
                <input type="text" class="form-control" name="c_nickname"  id="c_nickname"/>
                <span style="float: right;color: red;font-size: 12px; display: none;" id="red4">중복된 닉네임이 있습니다.</span>
            </div>
            <div style="margin: 18px">
                <label for="c_companyname" class="text-black">성별<span class="text-danger">*</span></label>
               
                    <label><input type="radio" name="gender" value="m"> 남</label>
                    <label><input type="radio" name="gender" value="f"> 여</label>
               
            </div>
        </div>
        <div class="form-group row">
            <div style="text-align: left;margin: 18px">
                <label class="text-black">휴대폰 번호 <span class="text-danger">*</span></label><br/>
                <input type="text" class="form-control" id="tel1" name="tel1"  maxlength="3" name="tel1" style="width: 100px" value="010"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> - 
                <input type="text" class="form-control"id="tel2" name="tel2" maxlength="4" name="tel2" style="width: 100px"   oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> - 
                <input type="text" class="form-control" id="tel3" name="tel3" maxlength="4" name="tel3" style="width: 100px"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
            </div>
        </div>
        <div class="form-group row">
            <div style="text-align: left;margin: 18px">
                <label class="text-black">생년월일 <span class="text-danger">*</span></label><br/>
                <input type="date" name="date"class="form-control"  style="width: 250px"> 
            </div>
        </div>
        
        <div class="form-group">
            <label for="c_country" class="text-black">주소 <span class="text-danger">*</span></label><br/>
            <label for="c_country" class="text-black">서울특별시</label>
            <select id="c_country" name="c_country" class="form-control" style="width: 200px">
                <option value="0">구 선택</option>
                <option value="1">강남구</option>
                <option value="2">강동구</option>
                <option value="3">강북구</option>
                <option value="4">강서구</option>
                <option value="5">관악구</option>
                <option value="6">광진구</option>
                <option value="7">구로구</option>
                <option value="8">금천구</option>
                <option value="9">노원구</option>
                <option value="10">도봉구</option>
                <option value="11">동대문구</option>
                <option value="12">동작구</option>
                <option value="13">마포구</option>
                <option value="14">서대문구</option>
                <option value="15">서초구</option>
                <option value="16">성동구</option>
                <option value="17">성북구</option>
                <option value="18">송파구</option>
                <option value="19">양천구</option>
                <option value="20">영등포구</option>
                <option value="21">용산구</option>
                <option value="22">은평구</option>
                <option value="23">종로구</option>
                <option value="24">중구</option>
                <option value="25">중랑구</option>
            </select>
        </div>


        <div class="form-group row mb-5"style="display: inline;width: 500px">
            <label for="c_email_address" class="text-black"style="margin: 18px">이메일 <span class="text-danger">*</span></label><br/>
            <input type="text" class="form-control" id="c_email_address"  name="c_email_address"style="width: 200px">
            @
            <select id="c_domain" name="c_domain" class="form-control"  style="width: 180px">
                <option value="none">도메인 선택</option>
                <option value="naver.com">naver.com</option>
                <option value="google.com">google.com</option>
                <option value="daum.net">daum.net</option>
                <option value="hotmail.com">hotmail.com</option>
            </select>
        </div>

        <!-- </form> -->
        <ul class="footBtwrap clearfix">
            <li><button class="fpmgBt1" >취소</button></li>
            <li><button class="fpmgBt2"><!-- <a href="signupComplete.jsp"> -->가입</button></li>
        </ul>
    </div>
<input type="hidden" value="ok" id="hid" name="hid">
     </form>
</div>

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
	let flag = false;
	$(".fpmgBt2").click(function () {
		
		if($("#c_id").val()==""){
			alert("아이디를 입력하세요");
			return false;
		} 
		if($("[name='c_pass']").val()==""){
			alert("비밀번호를 입력하세요");
			return false;
		}
		if($("[name='c_pass2']").val()==""){
			alert("비밀번호확인 창이 비어있습니다.");
			return false;
		}
		
		if($("[name='c_nickname']").val()==""){
			alert("닉네임을 입력하세요");
			return false;
		}

		if(!$("[name='gender']").is(":checked")){
			alert("성별을 체크해주세요");
			return false;
		}
		
		if($("#tel1").val()=="" || $("#tel2").val()=="" || $("#tel3").val()==""){
			alert("휴대폰 번호를 입력하세요");
			return false;
		}
		if($("#c_country").val()=="0"){
			alert("지역을선택해주세요");
			return false;
		}
		if($("[type='date']").val()==""){
			alert("생년월일을 기입해주세요");
			return false;
		}
		if($("#c_email_address").val()=="" || $("#c_domain").val()=="none"){
			alert("이메일을 기입해주세요");
			return false;
		}
		if(!flag){
			alert("회원가입이 불가능입니다.")
			return false;
		}
		$("#hid").val("ok");
		$("#checkout2Frm").submit()
		
	})//버튼클릭
	
	$("#c_pass").focusout(function () {
		var pass = $("#c_pass").val();
		//8이상16자 이하의 영 숫 기호 
		var passwordRule = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/
 		if(!passwordRule.test(pass)){
 			document.getElementById('red2').style.display="block";
 			flag=false;
		}else{
		
			document.getElementById('red2').style.display="none";
			flag=true;
		}

	})
	
	$("#c_pass2").focusout(function () {
		var pass = $("#c_pass").val();
		var pass2 = $("#c_pass2").val();
		if(pass!=pass2){
			document.getElementById('red3').style.display="block";
			flag=false;
		}else{
			document.getElementById('red3').style.display="none";
			flag=true;
		}
	})//"#c_pass2"
	
	
	$("#c_id").keyup(function () {
		$("#hid").val("id");
	
		$.ajax({
			url:"checkout3.jsp",
			type:"post",
			data:{"hid":$("#hid").val(),"id":$("#c_id").val() } ,
			dataType : "json",
			error:function(xhr){
				alert(xhr.status+"/"+xhr.status.text)
			},
			success:function(id){
				if(!id.data){
					$("#red1").css("display","none");
					flag=true;
				}else{
					$("#red1").css("display","block");
					flag=false;
				}
			}
		})//ajax

	})//c_id
	
	$("#c_nickname").keyup(function () {
		$("#hid").val("nick");
		$.ajax({
			url:"checkout3.jsp",
			type:"post",
			data:{"hid":$("#hid").val(),"nick":$("#c_nickname").val() } ,
			dataType : "json",
			error:function(xhr){
				alert(xhr.status+"/"+xhr.status.text)
			},
			success:function(nick){
			if(!nick.data2){
					$("#red4").css("display","none");
					flag=true;
				}else{
					$("#red4").css("display","block");
					flag=false;
				} 
			}
		})//ajax
		
	})//c_nickname 
	
	$(".fpmgBt1").click(function () {
		document.checkout2Frm.action="index.jsp";
	})
	
})


</script>
</body>
</html>
