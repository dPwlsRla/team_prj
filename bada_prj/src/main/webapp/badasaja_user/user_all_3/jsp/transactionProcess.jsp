<%@page import="kr.co.sist.badasaja.user.dao.DetailCForumDAO"%>
<%@page import="kr.co.sist.badasaja.vo.TransactionVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.co.sist.badasaja.user.dao.MypageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
TransactionVO trVO = new TransactionVO();
String id=(String)session.getAttribute("cId");

trVO.setcID(request.getParameter("cId"));
trVO.setCfNum(request.getParameter("cfNum"));

DetailCForumDAO dcfDAO = new DetailCForumDAO();

dcfDAO.insertTstatus(trVO);
	


%>