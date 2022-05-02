
<%@page import="kr.co.sist.badasaja.user.dao.CommentDAO"%>
<%@page import="kr.co.sist.badasaja.vo.ComVO"%>
<%@page import="kr.co.sist.badasaja.user.dao.WriteCForumDAO"%>
<%@page import="kr.co.sist.badasaja.vo.HashTagVO"%>
<%@page import="kr.co.sist.badasaja.vo.CImgVO"%>
<%@page import="kr.co.sist.badasaja.vo.CForumVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

ComVO comVO = new ComVO();

request.setCharacterEncoding("UTF-8");

comVO.setCfNum(request.getParameter("cfNum"));
comVO.setcID((String)session.getAttribute("cId"));
comVO.setComMain(request.getParameter("com_main"));
CommentDAO cDAO = new CommentDAO();

cDAO.insertComment(comVO);
%>
