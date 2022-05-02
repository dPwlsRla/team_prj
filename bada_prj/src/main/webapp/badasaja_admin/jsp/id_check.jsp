<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.badasaja.admin.dao.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="id check 페이지"
    %>
<%

AdminDAO aDAO = AdminDAO.getInstance();

String aID = request.getParameter("aID");

boolean checkID = aDAO.checkAID(aID);

JSONObject jsonObj = new JSONObject();

jsonObj.put("flag", checkID);

out.println(jsonObj.toJSONString());



%>