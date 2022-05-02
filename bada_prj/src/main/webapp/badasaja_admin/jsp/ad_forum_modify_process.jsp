<%@page import="kr.co.sist.badasaja.admin.dao.AdminAdDAO"%>
<%@page import="kr.co.sist.badasaja.vo.AdForumVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="광고게시글 수정 process 페이지"
    %>
<%
	String afNum = request.getParameter("afNum");
	String topic = request.getParameter("topic");
	String main = request.getParameter("main");
	String pr = request.getParameter("pr");
	String st = request.getParameter("st");
	
	AdForumVO afVO = new AdForumVO();
	afVO.setAfNum(afNum);
	afVO.setAfTopic(topic);
	afVO.setAfMain(main);
	afVO.setpCode(pr);
	afVO.setAfStatus(st);
	
	AdminAdDAO adDAO = AdminAdDAO.getInstance();
	
	adDAO.updateAdForum(afVO);
%>