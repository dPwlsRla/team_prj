<%@page import="kr.co.sist.badasaja.admin.dao.ProhibitDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="금지목록 등록 process 페이지"
    %>
<%
	String iKey = request.getParameter("ikey");

	ProhibitDAO pDAO = ProhibitDAO.getInstance(); 
	pDAO.insertProhibit(iKey);

%>