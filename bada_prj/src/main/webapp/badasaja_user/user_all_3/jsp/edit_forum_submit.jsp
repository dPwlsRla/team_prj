
<%@page import="kr.co.sist.badasaja.user.dao.EditCForumDAO"%>
<%@page import="kr.co.sist.badasaja.user.dao.WriteCForumDAO"%>
<%@page import="kr.co.sist.badasaja.vo.HashTagVO"%>
<%@page import="kr.co.sist.badasaja.vo.CImgVO"%>
<%@page import="kr.co.sist.badasaja.vo.CForumVO"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


CForumVO cForumVO = new CForumVO();
HashTagVO[] htVOarr = new HashTagVO[3];
request.setCharacterEncoding("UTF-8");
String cfNum = request.getParameter("cfNum");
htVOarr[0] = new HashTagVO("#" + request.getParameter("upHash1"),"");
htVOarr[1] = new HashTagVO("#" + request.getParameter("upHash2"),"");
htVOarr[2] = new HashTagVO("#" + request.getParameter("upHash3"),"");

cForumVO.setCfTopic(request.getParameter("board_title"));
cForumVO.setCfMain(request.getParameter("board_content"));
cForumVO.setpCode(request.getParameter("category_select")); 
System.out.println(cfNum + " : cfN");
System.out.println(request.getParameter("category_select"));
System.out.println(request.getParameter("board_content"));
EditCForumDAO eDAO = new EditCForumDAO();
boolean flag = eDAO.editForum(cForumVO, htVOarr, cfNum); // 금칙어 혹시 되면 나중에 쓸라고 만듦
response.sendRedirect("trade.jsp");
%>

