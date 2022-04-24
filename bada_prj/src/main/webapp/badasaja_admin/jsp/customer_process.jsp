<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.badasaja.vo.CuVO"%>
<%@page import="kr.co.sist.badasaja.admin.dao.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String cID = request.getParameter("cID");
	String st = request.getParameter("st");
	String gu = request.getParameter("gu");
	
	AdminDAO aDAO = AdminDAO.getInstance();
	

    
    if(gu == null || gu.equals("지역")){
    	gu = "";
    }

    if(st == null || st.equals("상태")){
    	st = "";
    } else if( st.equals("정지 계정")){
    	st="";
    } else if( st.equals("휴면 계정")){
    	st="";
    } else if( st.equals("탈퇴 계정")){
    	st="";
    } else if( st.equals("정상 계정")){
    	st="";
    }
    
    cID = "";
    st = "";
    gu = "";
    
    List<CuVO> cuList = aDAO.selectAllCoustomer(cID, st, gu);
    
    JSONObject jsonObj = new JSONObject();

    JSONArray jsonArr = new JSONArray();

    JSONObject jsonTemp = null;

    for(CuVO cuVO : cuList){
    	jsonTemp = new JSONObject();
    	jsonTemp.put("cID", cuVO.getcID());
    	jsonTemp.put("local", cuVO.getGuName());
    	jsonTemp.put("nickname", cuVO.getNickName());
    	jsonTemp.put("birth", cuVO.getBirth());
    	jsonTemp.put("gender", cuVO.getGender());
    	jsonTemp.put("tel", cuVO.getTel());
    	jsonTemp.put("profile", cuVO.getProfile());
    	jsonTemp.put("email", cuVO.getEmail());
    	jsonTemp.put("status", cuVO.getcStatus());
    	jsonTemp.put("signDate", cuVO.getSignDate());
    	jsonTemp.put("accessDate", cuVO.getAccessDate());
    	jsonTemp.put("ipaddress", cuVO.getIpAddress());
    	
    	jsonArr.add(jsonTemp);
    }

    jsonObj.put("resultData", jsonArr);	
    %>
    <%= jsonObj.toString() %>
