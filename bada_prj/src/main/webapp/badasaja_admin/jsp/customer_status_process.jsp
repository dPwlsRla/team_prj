<%@page import="kr.co.sist.badasaja.admin.dao.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="유저 상태변경 process 페이지"
    %>
    
<%

	String cID = request.getParameter("cID");
	String ust = request.getParameter("ust");
	
	if( ust.equals("정지계정")){
    	ust="st";
    } else if( ust.equals("휴면계정")){
    	ust="do";
    } else if( ust.equals("탈퇴계정")){
    	ust="se";
    } else if( ust.equals("정상계정")){
    	ust="no";
    }
	
	AdminDAO aDAO = AdminDAO.getInstance();
 	aDAO.updateStatus(cID, ust);

%>
