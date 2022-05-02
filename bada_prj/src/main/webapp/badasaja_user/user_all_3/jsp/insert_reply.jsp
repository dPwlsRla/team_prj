
<%@page import="kr.co.sist.badasaja.vo.ReplyVO"%>
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

ReplyVO rVO = new ReplyVO();

request.setCharacterEncoding("UTF-8");

rVO.setpCom(request.getParameter("comNum"));
rVO.setrID((String)session.getAttribute("cId"));
rVO.setReplyMain(request.getParameter("reply_main"));
CommentDAO cDAO = new CommentDAO();

cDAO.insertReply(rVO);
%>
