
<%@page import="kr.co.sist.badasaja.user.dao.WriteCForumDAO"%>
<%@page import="kr.co.sist.badasaja.vo.HashTagVO"%>
<%@page import="kr.co.sist.badasaja.vo.CImgVO"%>
<%@page import="kr.co.sist.badasaja.vo.CForumVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


// File saveDirectory=new File("D:/dev/workspace_new/team_prj/team_prj/bada_prj/src/main/webapp/badasaja_user/user_all_3/forum_img");
File saveDirectory=new File("C:/Users/user/git/team_prj/bada_prj/src/main/webapp/badasaja_user/user_all_3/forum_img");
int fileSize=1024*1024*10;

MultipartRequest mr=new MultipartRequest(request, saveDirectory.getPath() , fileSize,"UTF-8",
		 new DefaultFileRenamePolicy()); // mr을 쓰면 request가 동작하지 않아서 request.getParameter를 다 mr.get...로 바꿈
String fileSystemName1=mr.getFilesystemName("upImg1");
String fileSystemName2=mr.getFilesystemName("upImg2");
String fileSystemName3=mr.getFilesystemName("upImg3");

CForumVO cForumVO = new CForumVO();
HashTagVO[] htArr = new HashTagVO[3];

String[] imgArr = {fileSystemName1, fileSystemName2, fileSystemName3};

int cnt = 0;
for(int i = 0; i < imgArr.length; i++){
	if(imgArr[i] != null){
	imgArr[cnt] = imgArr[i];	
	cnt++;					
	}
}

htArr[0] = new HashTagVO("#" + mr.getParameter("upHash1"),"");
htArr[1] = new HashTagVO("#" + mr.getParameter("upHash2"),"");
htArr[2] = new HashTagVO("#" + mr.getParameter("upHash3"),"");

CImgVO cimgVO = new CImgVO(); 
cForumVO.setCfTopic(mr.getParameter("board_title"));
cForumVO.setCfMain(mr.getParameter("board_content"));
cForumVO.setCfStatus("거래중");
cForumVO.setcID((String)session.getAttribute("cId"));
cForumVO.setpCode(mr.getParameter("category_select")); 
cForumVO.setMainImg(imgArr[0]);

WriteCForumDAO wDAO = WriteCForumDAO.getInstance();
wDAO.insertForum(cForumVO,htArr);
String imgs = "";
if( cnt >= 1){
	if(cnt == 1){
		imgs = imgArr[0];
	}else if(cnt == 2){
		imgs = imgArr[0] + "," + imgArr[1];		
	} else if( cnt == 3){
	  	imgs = imgArr[0] + "," + imgArr[1] +"," + imgArr[2];
	}
	wDAO.inserFImg(imgs);
}
	
response.sendRedirect("trade.jsp");
%>
