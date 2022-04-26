<%@page import="kr.co.sist.badasaja.user.dao.EntireForumDAO"%>
<%@page import="kr.co.sist.badasaja.vo.WishListVO"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	EntireForumDAO efDAO = new EntireForumDAO();
	WishListVO wVO = new WishListVO();
	String process = request.getParameter("process");
	wVO.setCfNum(request.getParameter("cfNum"));
	wVO.setcID(request.getParameter("cId"));
	if(process.equals("insert")){
		efDAO.insertWishList(wVO);
	}
	
	else if(process.equals("delete")){
		efDAO.deleteWishList(wVO);
	}
		
%>