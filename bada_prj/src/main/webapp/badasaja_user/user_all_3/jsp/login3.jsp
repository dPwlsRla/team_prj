<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.badasaja.user.dao.SMTPDAO"%>
<%@page import="kr.co.sist.badasaja.user.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String email = request.getParameter("mail");
String id = request.getParameter("id");
JSONObject jso = new JSONObject();
MemberDAO uDAO = new MemberDAO();
boolean flag = uDAO.selectPass(id, email);
if(flag){
	//아이디 이메일 일치 메일 보내고 업데이트 해야함
	SMTPDAO sm = new SMTPDAO();
	String pass =sm.tempPass();
	sm.smtpPass(email, pass);
	//나중에 이메일 보내기 입셉션 처리로 실패 처리
	uDAO.updatePass(id, email,pass);
	jso.put("flag", flag);
	out.println(jso.toJSONString());
	
}else{
	jso.put("flag", flag);
	out.println(jso.toJSONString());
}

%>