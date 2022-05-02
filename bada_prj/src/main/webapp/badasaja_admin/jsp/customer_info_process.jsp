<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.badasaja.vo.CuVO"%>
<%@page import="kr.co.sist.badasaja.admin.dao.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="유저 상세조회 process 페이지"
    %>
<%
	String cID = request.getParameter("cID");
	
	AdminDAO aDAO = AdminDAO.getInstance();
	
	CuVO cVO = aDAO.selectCostomerInfo(cID);
 	String status = cVO.getcStatus();
	
	if(status.equals("no")){
		status = "정상계정";
	} else if(status.equals("do")){
		status = "휴면계정";
	} else if(status.equals("st")){
		status = "정지계정";
	} else if(status.equals("se")){
		status = "탈퇴계정";
	 }
	
	JSONObject jsonObj = new JSONObject();
	
 	jsonObj.put("cID", cVO.getcID());
 	jsonObj.put("forumCount", String.valueOf(cVO.getForumCount()) );
 	jsonObj.put("reportCount", String.valueOf(cVO.getReportCount()));
	jsonObj.put("local", cVO.getGuName());
	jsonObj.put("score", cVO.getScore());
	jsonObj.put("nickname", cVO.getNickName());
	jsonObj.put("birth", cVO.getBirth());
	jsonObj.put("gender", cVO.getGender());
	jsonObj.put("tel", cVO.getTel());
	jsonObj.put("profile", cVO.getProfile());
	jsonObj.put("email", cVO.getEmail());
	jsonObj.put("status", cVO.getcStatus());
	jsonObj.put("signDate", cVO.getSignDate());
	jsonObj.put("accessDate", cVO.getAccessDate());
	jsonObj.put("ipaddress", cVO.getIpAddress());
	
	out.println(jsonObj.toJSONString());
	
%>