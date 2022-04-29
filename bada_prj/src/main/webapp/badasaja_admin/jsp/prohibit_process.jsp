<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.badasaja.vo.ProhibitVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.badasaja.admin.dao.ProhibitDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String keyword = request.getParameter("key");

	ProhibitDAO pDAO = ProhibitDAO.getInstance(); 

	List<ProhibitVO> pList = pDAO.selectProhibit(keyword);
	
	JSONObject jsonObj = new JSONObject();

	JSONArray jsonArr = new JSONArray();

	JSONObject jsonTemp = null;

	for(ProhibitVO pVO : pList){
		jsonTemp = new JSONObject();
		jsonTemp.put("keyNum", String.valueOf(pVO.getkNum()));
		jsonTemp.put("keyword", pVO.getKeyWord());
		
		jsonArr.add(jsonTemp);
	}

	jsonObj.put("resultData", jsonArr);	
	%>
	<%= jsonObj.toString() %>
	