<%@page import="kr.co.sist.badasaja.admin.dao.KyhNoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="관리자 한줄 공지 등록 process 페이지"
	%>

<%
String oID = request.getParameter("oID");
String iNo = request.getParameter("iNo");

KyhNoticeDAO knDAO = KyhNoticeDAO.getInstance();
knDAO.insertNotice(oID, iNo);  
%>
