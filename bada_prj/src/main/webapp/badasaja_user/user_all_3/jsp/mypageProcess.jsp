<%@page import="kr.co.sist.badasaja.vo.MyPostBoardVO"%>
<%@page import="kr.co.sist.badasaja.user.dao.MypageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    
    MypageDAO mpDAO = new MypageDAO();
    MyPostBoardVO mpbVO = new MyPostBoardVO();
    
    String process = request.getParameter("process");
    String cfNum = request.getParameter("cfNum");
    	
    mpbVO.setCfNum(request.getParameter("cfNum"));
    
    mpDAO.updateMyTransaction(request.getParameter("cfNum"));
    
    
    %>