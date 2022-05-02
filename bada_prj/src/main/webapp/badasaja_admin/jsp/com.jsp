
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
스타일 부분입니다. 
63번쨰 줄정도에 넣어주시면 될꺼같아요
#commentProfile{
							width: 30px;
    						height: 30px; 
    						border-radius: 70%;
    						overflow: hidden;
    						border: 1px solid #dfdfdf;
    						margin-right: 5px;
    						display: inline-block;
							}
	
	.nicknameCom{
			font-weight: bold;
			font-size: 20px;
		   }
 	.addr{
 			font-size: 12px;
 			display: inline-block;
 			margin-left: 5px;
 		   }
 	.writerLabel{
					border: 1px solid #868e96;
					border-radius:5px;
					color: #868e96;
					font-size: 10px;
					display: inline-block;
 					}
 	.replyMark{
 					width: 9px;
   				    height: 9px;
    				border-bottom: 1px solid #adb5bd;
    				border-left: 1px solid #adb5bd;
    				display: inline-block;
    				margin-right: 16px;
    				vertical-align: top;
 				  }
 	.date{
 			font-size: 12px;
 			color:#868e96;
 			display: inline-block;
 			width:630px;
 		   }
 	.commentContent{
 							border-bottom:  1px solid #dfdfdf;
 							margin-bottom: 10px;
 							}
 	.replyDiv{
 				border: 1px solid #adb5bd;
 				border-radius:3px;
 				font-size: 13px;
 				display: inline-block;
 				text-decoration: none;
 				color: #333;
 				width: 60px;
 				}
 				
 				
 	댓글 div입니다. 322번쨰 줄에 넣으시면될꺼같아요			
		<!--댓글 div-->
    	<div id= "commentDiv">
    	<div style=" font-family: 'NanumSquareRoundB'; font-size: 20px; margin-bottom: 20px; border-bottom: 1px solid #dfdfdf;">댓글</div>
    	<div id="oneComment">
    	
    	<!--부모 댓글  -->
    	<div class="parent">
    	<div style=" font-weight: bold; ">
    	
	    <img id="commentProfile" src="../images/person_1.jpg" alt=""  id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false"/>닉네임
	
    	
    	<div class="addr" >안산시 단원구 초지동</div>
    	</div>
    	<div class="commentContent">
    	<p>댓글 1</p>
    	</div>
    	</div>
    	</div>
    	</div> 				