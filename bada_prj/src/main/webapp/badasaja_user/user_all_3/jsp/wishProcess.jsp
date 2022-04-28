<%@page import="kr.co.sist.badasaja.user.dao.EntireForumDAO"%>
<%@page import="kr.co.sist.badasaja.vo.WishListVO"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	EntireForumDAO efDAO = new EntireForumDAO();
	WishListVO wVO = new WishListVO();

	String id=(String) session.getAttribute("cId");
	 if( id == null){
		response.sendRedirect("로그인페이지로 이동");
		 return;
	} 
	
	String process = request.getParameter("process");
	wVO.setCfNum(request.getParameter("cfNum"));
	wVO.setcID( id );	
	
	if(process.equals("insert")){
		efDAO.insertWishList(wVO);
	}
	
	if(process.equals("delete")){
		//System.out.println( "delete ==== "+ wVO);
		efDAO.deleteWishList(wVO);
		
	}
		
%>