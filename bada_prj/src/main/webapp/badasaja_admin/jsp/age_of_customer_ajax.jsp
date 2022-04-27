<%@page import="kr.co.sist.badasaja.admin.dao.DashDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="kr.co.sist.badasaja.vo.AdForumVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.badasaja.admin.dao.AdminForumDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"
    %>
<%
	
String term = request.getParameter("term");
String local = request.getParameter("local");
String gender = request.getParameter("gender");
if(term == null || local == null || gender == null){
	return;
} 


JSONObject jsonObj = new JSONObject();
DashDAO dDAO = DashDAO.getInstance();

int ageCusCnt = 0;
ageCusCnt = dDAO.selectAgeCus(term, local, gender, 1 );
jsonObj.put("teens",ageCusCnt);
ageCusCnt = dDAO.selectAgeCus(term, local, gender, 2 );
jsonObj.put("twenties",ageCusCnt);
ageCusCnt = dDAO.selectAgeCus(term, local, gender, 3 );
jsonObj.put("thirties",ageCusCnt);
ageCusCnt = dDAO.selectAgeCus(term, local, gender, 4 );
jsonObj.put("forties",ageCusCnt);
ageCusCnt = dDAO.selectAgeCus(term, local, gender, 5 );
jsonObj.put("fifties",ageCusCnt);
ageCusCnt = dDAO.selectAgeCus(term, local, gender, 6 );
jsonObj.put("sixties",ageCusCnt); 
out.println(jsonObj.toJSONString());

%>
