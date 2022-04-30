<%@page import="kr.co.sist.badasaja.admin.dao.ProhibitDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String iKey = request.getParameter("ikey");

	ProhibitDAO pDAO = ProhibitDAO.getInstance(); 
	pDAO.insertProhibit(iKey);

%>