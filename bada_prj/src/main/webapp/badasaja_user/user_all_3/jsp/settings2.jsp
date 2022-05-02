<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.badasaja.user.dao.MypageDAO"%>
<%@page import="kr.co.sist.badasaja.vo.CuVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="수정"%>
<%
request.setCharacterEncoding("UTF-8");
JSONArray jsonArr = new JSONArray();
MypageDAO mDAO = new MypageDAO();

List<CuVO> list = mDAO.selectCustomer((String)session.getAttribute("cId"));
//List<CuVO> list = mDAO.selectCustomer("qwer");
JSONObject jso = new JSONObject();
for(CuVO cu : list){

	jso.put("id", cu.getcID());
	jso.put("password", cu.getcPass());
	jso.put("nick", cu.getNickName());
	jso.put("email", cu.getEmail());
	jso.put("tel", cu.getTel());
	jso.put("gucode", cu.getGuCode());
	
} 
out.print(jso.toJSONString());


%>
