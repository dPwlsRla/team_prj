<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.badasaja.admin.dao.AdminReportDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="광고 게시글 신고 사유 상세 조회 process 페이지"
    %>
<%

	String cfrNum = request.getParameter("cfrNum");
	AdminReportDAO arDAO = AdminReportDAO.getInstance(); 
	String main = arDAO.selectFrMain(cfrNum);
	
	JSONObject jsonObj = new JSONObject();
	
	jsonObj.put("cfrMain", main);
	
	out.println(jsonObj.toJSONString());

%>