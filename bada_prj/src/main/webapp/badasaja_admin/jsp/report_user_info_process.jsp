<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.badasaja.admin.dao.AdminReportDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="유저 신고 상세 조회 process 페이지"
    %>
<%

	String redID = request.getParameter("redID");
	AdminReportDAO arDAO = AdminReportDAO.getInstance(); 
	String main = arDAO.selectCrMain(redID);
	
	JSONObject jsonObj = new JSONObject();
	
	jsonObj.put("crMain", main);
	
	out.println(jsonObj.toJSONString());

%>