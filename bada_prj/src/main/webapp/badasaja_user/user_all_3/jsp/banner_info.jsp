<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.badasaja.vo.BannerVO"%>
<%@page import="kr.co.sist.badasaja.user.dao.EntireForumDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"
    %>
<%
String cId = request.getParameter("cId");
String product = request.getParameter("product");
if(cId == null || product == null){
	return;
}


EntireForumDAO efDAO = new EntireForumDAO();
BannerVO bVO = efDAO.selectBanner(cId,product);

JSONObject jsonObj = new JSONObject();
jsonObj.put("url", bVO.getaURL());	
jsonObj.put("img", bVO.getImg());	
jsonObj.put("bFlag", bVO.getBFlag());	
out.println(jsonObj.toJSONString());

%>