<%--
  Created by IntelliJ IDEA.
  User: seohuisu
  Date: 2022/04/12
  Time: 10:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="수정"%><!-- rset=UTF-8" language="java" %> -->
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
<body onload="load()">
  <form action="settings3.jsp" id="frm" accept-charset="UTF-8">
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
                                            <input type="text" class="form-control" id="id" name="id" readonly="readonly">
                                            <span style="float: right;color: red;font-size: 12px;" id="red1"></span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>닉네임</label>
                                            <input type="text" class="form-control"  id="nick" name="nick">
                                            <span style="float: right;color: red;font-size: 12px" id="red2"></span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>이메일</label>
                                            <input type="text" class="form-control" id="email" name="email">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>휴대폰 번호</label>
                                            <input type="text" class="form-control" id="tel" maxlength="11" name="tel"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>주소</label>
                                            <select id="gu_code" class="form-control" name="gu_code">
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
                                    </div>

                                    <div class="password-group">
                                       <!--  <div class="col-md-7">
                                            <div class="form-group">
                                                <label>현재 비밀번호</label>
                                                <input type="password" class="form-control">
                                            </div>
                                        </div> -->
                                    
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>새 비밀번호</label>
                                                <input type="password" class="form-control" id="pass" name="pass">
                                                <span style="float: right;color: red;font-size: 12px; width: 340px;" id="red3"></span>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>비밀번호 확인</label>
                                                <input type="password" class="form-control" id="pass2">
                                                <span style="float: right;color: red;font-size: 12px" id="red4"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                    </div>
                                </div>
                                <div>
                                <input type="hidden" id="hid" name="hid" value="ok">
                                    <button class="btn btn-primary" id="btn">변경하기</button>
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
      <input type="checkbox" value="exit" id="check">
      탈퇴 확인 버튼을 누르시면 회원 복구가 불가능합니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="close">취소</button>
        <button type="button" class="btn btn-primary" id="del">탈퇴 확인</button>
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
let id ="";
let password ="";
let nick ="";
let flag = true;
 $(function () {
		  /* 회원 탈퇴  */
		  $('#exit').click(function(e){
				e.preventDefault();
				$('#exit_modal').modal("show");
			});
		  $('#close').click(function(e){
				e.preventDefault();
				$('#exit_modal').modal("hide");
			});
		  $('#del').click(function(e){
			  if(!$("#check").is(":checked")){
				  alert("탈퇴하실꺼면 체크주세요")
				  return false;
			  }
			  $('#exit_modal').modal("hide");
			  $("#hid").val("del");
			  $("#frm").submit()
			  
		  });
		  $("#id").keyup(function () {
			if($("#id").val()==""){
				$("#red1").html("id를 입력해주세요 ")
				flag=false;
					return;
				}//
			if($("#id").val()!=id){
				$("#hid").val("id");
				$.ajax({
					url:"settings3.jsp",
					type:"post",
					data:{"hid":$("#hid").val(),"id":$("#id").val() } ,
					dataType : "json",
					error:function(xhr){
						alert(xhr.status+"/"+xhr.status.text)
					},
					success:function(idFlag){
						 if(!idFlag.data){
							$("#red1").css("display","none");//중복안됨
							
							flag=true;
						}else{
							$("#red1").css("display","block");//중복됨
							$("#red1").html("아이디가 중복되었습니다.")
							flag=false;
						}   
					}//end success
				})//ajax
			  }else{
				  $("#red1").css("display","none");
				  flag=true;
			  }//end else
			})//id_keyup 
			
		 $("#nick").keyup(function () {
			if($("#nick").val()==""){
				$("#red2").html("닉네임일 입력해주세요 ")
				flag=false;
					return;
				}//
			if($("#nick").val()!=nick){
				$("#hid").val("nick");
				$.ajax({
					url:"settings3.jsp",
					type:"post",
					data:{"hid":$("#hid").val(),"nick":$("#nick").val() } ,
					dataType : "json",
					error:function(xhr){
						alert(xhr.status+"/"+xhr.status.text)
					},
					success:function(idFlag){
						 if(!idFlag.data){
							$("#red2").css("display","none");//중복안됨
							
							flag=true;
						}else{
							$("#red2").css("display","block");//중복됨
							$("#red2").html("닉네임이 중복되었습니다.")
							flag=false;
						}   
					}//end success
				})//ajax
			  }else{
				  $("#red2").css("display","none");
				  flag=true;
			  }//end else
			})//id_keyup 
			
		$("#pass").focusout(function () {
			var pass = $("#pass").val();
			if($("#pass").val()==""){
				$("#red3").css("display","none");
				flag=true;
				return;
			}//비밀번호를 변경하고 싶지않을떄
			if(pass!=password){
			//8이상16자 이하의 영 숫 기호 
			var passwordRule = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/
	 		if(!passwordRule.test(pass)){
	 			$("#red3").html("비밀번호는 영문, 숫자 조합 8~16자로 적어주세요.")
	 			flag=false;
			}else{
				$("#red3").css("width","340px");
				$("#red3").html("")
				flag=true;
			}//end else
			}else{
				$("#red3").html("과거 비밀번호와같습니다.")
				flag=false;
			}
		})
		
		
		$("#pass2").focusout(function () {
			var pass = $("#pass").val();
			var pass2 = $("#pass2").val();
			if(pass!=pass2){
				$("#red4").html("비밀번호 확인 문자가 다릅니다.")
				$("#red4").css("display","block");
				flag=false;
			}else{
				
				$("#red4").css("display","none");//중복안됨
				flag=true;
			}
		})//"#c_pass2"
		$("#btn").click(function () {
			
			
			if($("#tel").val().length<10){
				alert("전화번호는 '-'자를 뺴고 11자를 입력해주세요")
				return false;
			} 
			if($("#email").val()==""){
				alert("이메일을 입력해주세요")
				return false;
			}
		 	if($("#email").val().indexOf("@")==-1){
				alert("이메일 형식을 지켜주세요")
				return false;
			} 
			if($("#tel").val()==""){
				alert("전화번호를 입력해주세요")
				return false;
			}
			if($("#gu_code").val()=="0"){
				alert("지역을 선택해주세요")
				return false;
			}
			
			if(!flag){
				alert("수정을 똑바로해주세요");
				return false;
			}
			$("#hid").val("ok");
			$("#frm").submit()
		})	
	})//ready
    function load() {
	 $.ajax({
			url:"settings2.jsp",
			type:"post",
			dataType : "json",
			error:function(xhr){
				alert(xhr.status+"/"+xhr.status.text)
			},
			success:function(data){
				id = data.id;
				password = data.password;
				nick=data.nick;
				alert(password)
	
				$("#id").val(id);
				$("#nick").val(nick);
				$("#email").val(data.email);
				$("#tel").val(data.tel.replaceAll("-",""));
				$("#gu_code").val(data.gucode).attr("selected","selected")
				
			}
		})//ajax
	}//load
 
</script>
</body>
</html>