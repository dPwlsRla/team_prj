<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<!-- https://getbootstrap.com/docs/4.0/components/modal/
부트스트랩 모달 주소 -->
<html>
<head>
<style type="text/css">

#myform fieldset{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    border: 0; /* 필드셋 테두리 제거 */
}
#myform input[type=radio]{
    display: none; /* 라디오박스 감춤 */
}
#myform label{
    font-size: 3em; /* 이모지 크기 */
    color: transparent; /* 기존 이모지 컬러 제거 */
    text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
}

#myform label:hover{
    text-shadow: 0 0 0 #FFD400; /* 마우스 호버 */
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 #FFD400; /* 마우스 호버 뒤에오는 이모지들 */
}

#myform fieldset{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    direction: rtl; /* 이모지 순서 반전 */
    border: 0; /* 필드셋 테두리 제거 */
}

#myform fieldset legend{
    text-align: left;
}

#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 #FFD400; /* 마우스 클릭 체크 */
}

#profilePhoto{
					width:50px; 
 					height:50px;
 					float : left;
 					margin-right: 10px;
 					margin-left: 100px;
 					margin-top: 20px;
				   }


</style>
<!-- jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- boot Strap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script type="text/javascript">

$(function () {

	$('#testBtn').click(function(e){
		e.preventDefault();
		$('#testModal').modal("show");
	});
	
	$('#ss').click(function(e){
		e.preventDefault();
		$('#testModal').modal("hide");
	});
	
	$('#testBtn2').click(function(e){
		e.preventDefault();
		$('#testModal2').modal("show");
	});
	
	$('#testBtn3').click(function(e){
		e.preventDefault();
		$('#testModal3').modal("show");
	});
	
	$('#testBtn4').click(function(e){
		e.preventDefault();
		$('#testModal4').modal("show");
	});
	
	$('#search').click(function(e){
		e.preventDefault();
		$('#testModal4_1').modal("show");
	});
	
	$('#testBtn5').click(function(e){
		e.preventDefault();
		$('#testModal5').modal("show");
	});
	
	$('#testBtn6').click(function(e){
		e.preventDefault();
		$('#testModal6').modal("show");
	});
	$('#testBtn7').click(function(e){
		e.preventDefault();
		$('#testModal7').modal("show");
	});
	$('#testBtn8').click(function(e){
		e.preventDefault();
		$('#testModal8').modal("show");
	});
	
	$('#testBtn9').click(function(e){
		e.preventDefault();
		$('#testModal9').modal("show");
	});
	
	$('#testBtn10').click(function(e){
		e.preventDefault();
		$('#testModal10').modal("show");
	});
})//ready
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <button id="testBtn" class="btn">로그인이 필요한 서비스입니다.</button>
  <!-- 회원가입 확인 Modal-->
<!-- Modal -->
<div class="modal fade" id="testModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="ss">CANCEL</button>
        <button type="button" class="btn btn-primary">LOGIN</button>
      </div>
    </div>
  </div>
</div>

  <button id="testBtn2" class="btn">아이디찾기</button>
<div class="modal fade" id="testModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send message</button>
      </div>
    </div>
  </div>
</div>

  <button id="testBtn3" class="btn">로그인 실패</button>
  <!-- 회원가입 확인 Modal-->
<!-- Modal -->
<div class="modal fade" id="testModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">로그인 실패</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="color: #ff0000;">
        실패이유
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">OK</button>

      </div>
    </div>
  </div>
</div>

  <button id="testBtn4" class="btn">비밀번호찾기</button>
<div class="modal fade" id="testModal4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
        <button type="button" class="btn btn-secondary" data-dismiss="modal">CANCEL</button>
        <button type="button" class="btn btn-primary" id="search">SEARCH</button>
      </div>
    </div>
  </div>
</div>

<!--  -->
<div class="modal fade" id="testModal4_1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
        <button type="button" class="btn btn-primary">OK</button>
      </div>
    </div>
  </div>
</div>

<!--  -->
<button id="testBtn5" class="btn">게시글 업로드 실패</button>

<div class="modal fade" id="testModal5" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">게시글 업로드 실패</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       게시글 제목 혹은 내용에 금지 단어가 있습니다.<br>
       관리자가 확인 후 게시글이 업로드 혹은 삭제됩니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">OK</button>
      </div>
    </div>
  </div>
</div>

<!--  -->
<button id="testBtn6" class="btn">게시글 작성 완료</button>

<div class="modal fade" id="testModal6" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">게시글 작성 완료</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <span style="font-weight: bold;">게시글 작성이 완료되었습니다.</span><br/>
      다른 분들의 게시글을 구경하러 가볼까요?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">OK</button>
      </div>
    </div>
  </div>
</div>

<button id="testBtn7" class="btn">회원 탈퇴</button>

<div class="modal fade" id="testModal7" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="search">탈퇴 확인</button>
      </div>
    </div>
  </div>
</div>

<button id="testBtn8" class="btn">게시글 신고</button>
<div class="modal fade" id="testModal8" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">게시글 신고</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">
				 <span style="float: left;">게시글 신고</span>
            </label>
             
             <select name="language" style=" float: right; margin-bottom: 1px;">
				    <option value="none">사유선택</option>
				    <option value="korean" >부적합 사진</option>
				    <option value="english">사기 매매</option>
				    <option value="chinese">광고</option>
			</select>
            <input type="text" class="form-control" id="recipient-name" placeholder="제목">
          </div>
          <div class="form-group">
          <label for="recipient-name" class="col-form-label"> </label>
            <textarea class="form-control" style="height: 300px;" id="message-text" placeholder="신고 내용을 입력해주세요"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">CANCEL</button>
        <button type="button" class="btn btn-primary">SEND</button>
      </div>
    </div>
  </div>
</div>

<button id="testBtn9" class="btn">계정 신고</button>
<div class="modal fade" id="testModal9" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">계정 신고</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">
				 <span style="float: left;">계정 신고</span>
            </label>
             
             <select name="language" style=" float: right; margin-bottom: 1px;">
				    <option value="none">사유선택</option>
				    <option value="korean" >욕설</option>
				    <option value="english">비방</option>
				    <option value="chinese">사기</option>
			</select>
            <input type="text" class="form-control" id="recipient-name" placeholder="제목">
          </div>
          <div class="form-group">
          <label for="recipient-name" class="col-form-label"> </label>
            <textarea class="form-control" style="height: 300px;" id="message-text" placeholder="신고 내용을 입력해주세요"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">CANCEL</button>
        <button type="button" class="btn btn-primary">SEND</button>
      </div>
    </div>
  </div>
</div>

<button id="testBtn10" class="btn">친절도</button>
<div class="modal fade" id="testModal10" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">친절도</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="form-group" style="text-align: center">
				 <span style="font-weight: bold; font-size: 25px; font-family: ">친절도 점수</span><br/>
				 <img src="" onerror="this.src='../images/user.png'" id="profilePhoto"/>
				 <div style="float: left; margin-top: 20px;">
				 <label>닉네임 : </label><br/>
				 <label>거래만족도 :</label><br/>
				 </div>
				 <form name="myform" id="myform" method="post" action="./save">
				    <fieldset>
				        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
				        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
				        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
				        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
				        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
				    </fieldset>
				</form>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">CANCEL</button>
        <button type="button" class="btn btn-primary">SEND</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>
