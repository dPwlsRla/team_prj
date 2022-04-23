<%@page import="kr.co.sist.badasaja.user.dao.EntireForumDAO"%>
<%@page import="kr.co.sist.badasaja.vo.WishListVO"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	EntireForumDAO efDAO = new EntireForumDAO();
	WishListVO wVO = new WishListVO();
	
	wVO.setCfNum(request.getParameter("cfNum"));
	wVO.setcID("test");
	
	
	//if(request.getParameter("cfNum")==wVO.getCfNum()){
		%>
		<!--  out.println("<script>alert("찜목록을 취소하시겠습니까?")</script>")-->
		<%
	//}
	
	//로그인 페이지 연결 후 세션 ID값 가져오기 주석 해제
	//wVO.setcID(session.getAttribute("cId").toString());
	efDAO.insertWishList(wVO);
	
	response.sendRedirect("trade.jsp");
	
%>