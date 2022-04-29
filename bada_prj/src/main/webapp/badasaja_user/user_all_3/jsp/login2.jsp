<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.badasaja.user.dao.SMTPDAO"%>
<%@page import="kr.co.sist.badasaja.user.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String email =request.getParameter("mail");
MemberDAO uDAO = new MemberDAO();
String id = uDAO.selectEmail(email);
JSONObject jso = new JSONObject();
boolean flag=false;
if(id!="none"){
	//아이디있음
	SMTPDAO sm = new SMTPDAO();
	sm.smtId(email, id);
	flag=true;
	jso.put("flag", flag);
	out.println(jso.toJSONString());
	
}else{
	//아이디없음
	jso.put("flag", flag);
	out.println(jso.toJSONString());
}
%>