<%@page import="kr.co.sist.badasaja.user.dao.DetailCForumDAO"%>
<%@page import="kr.co.sist.badasaja.vo.TransactionVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.co.sist.badasaja.user.dao.MypageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//String id= request.getParameter("id");
TransactionVO trVO = new TransactionVO();

trVO.setcID(request.getParameter("cId"));
trVO.setCfNum(request.getParameter("cfNum"));

DetailCForumDAO dcfDAO = new DetailCForumDAO();
boolean result=false;

result = dcfDAO.insertTstatus(trVO);

	


%>