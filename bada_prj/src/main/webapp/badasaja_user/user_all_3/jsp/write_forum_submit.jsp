

<%@page import="kr.co.sist.badasaja.user.dao.WriteForumDAO"%>
<%@page import="kr.co.sist.badasaja.vo.HashTagVO"%>
<%@page import="kr.co.sist.badasaja.vo.CImgVO"%>
<%@page import="kr.co.sist.badasaja.vo.CForumVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// !!!중요!!!!!! 절대경로 바꿔야함 !!!중요!!!
File saveDirectory=new File("D:/dev/workspace_new/jsp_prj/src/main/webapp/badasaja_user/user_all_3/images/c_img");

int fileSize=1024*1024*10;

MultipartRequest mr=new MultipartRequest(request, saveDirectory.getPath() , fileSize,"UTF-8",
		 new DefaultFileRenamePolicy()); // mr을 쓰면 request가 동작하지 않아서 request.getParameter를 다 mr.get...로 바꿈

String fileSystemName1=mr.getFilesystemName("upImg1");
String fileSystemName2=mr.getFilesystemName("upImg2");
String fileSystemName3=mr.getFilesystemName("upImg3");

CForumVO cForumVO = new CForumVO();
CImgVO[] cimgArr = new CImgVO[3]; 
HashTagVO[] htArr = new HashTagVO[3];

cimgArr[0] = new CImgVO("",mr.getFilesystemName("upImg1"));
cimgArr[1] = new CImgVO("",mr.getFilesystemName("upImg2"));
cimgArr[2] = new CImgVO("",mr.getFilesystemName("upImg3"));

htArr[0] = new HashTagVO("#" + mr.getParameter("upHash1"),"");
htArr[1] = new HashTagVO("#" + mr.getParameter("upHash2"),"");
htArr[2] = new HashTagVO("#" + mr.getParameter("upHash3"),"");

cForumVO.setCfTopic(mr.getParameter("board_title"));
cForumVO.setCfMain(mr.getParameter("board_content"));
cForumVO.setCfStatus("거래중");
cForumVO.setcID((String)session.getAttribute("cId"));
cForumVO.setMainImg(mr.getFilesystemName("upImg1"));
cForumVO.setpCode(mr.getParameter("category_select")); 

// 금칙어 + 이미지 하나만 올라가도 동작하게 +
WriteForumDAO wDAO = new WriteForumDAO();
boolean flag = wDAO.insertForum(cForumVO,cimgArr,htArr); // 금칙어 혹시 되면 나중에 쓸라고 만듦
	response.sendRedirect("trade.jsp");
%>
