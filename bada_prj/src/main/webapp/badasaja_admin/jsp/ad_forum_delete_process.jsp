<%@page import="kr.co.sist.badasaja.admin.dao.AdminAdDAO"%>
<%@page import="kr.co.sist.badasaja.admin.dao.AdminForumDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="광고 게시글 삭제 process 페이지"
    %>
<%
	String afNum = request.getParameter("afNum");

	AdminAdDAO adDAO = AdminAdDAO.getInstance();
	
	adDAO.updateAfStatus(afNum);
%>
