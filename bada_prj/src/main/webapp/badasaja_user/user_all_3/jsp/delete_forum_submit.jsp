
<%@page import="kr.co.sist.badasaja.user.dao.DeleteCForumDAO"%>
<%@page import="kr.co.sist.badasaja.user.dao.EditCForumDAO"%>
<%@page import="kr.co.sist.badasaja.user.dao.WriteCForumDAO"%>
<%@page import="kr.co.sist.badasaja.vo.HashTagVO"%>
<%@page import="kr.co.sist.badasaja.vo.CImgVO"%>
<%@page import="kr.co.sist.badasaja.vo.CForumVO"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String cfNum = request.getParameter("cfNum");

DeleteCForumDAO dDAO = new DeleteCForumDAO();
dDAO.editForum(cfNum);
response.sendRedirect("trade.jsp");
%>

