<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.badasaja.vo.CuVO"%>
<%@page import="kr.co.sist.badasaja.admin.dao.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="유저 전체 조회, 검색 process 페이지"
    %>
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
    } else if( st.equals("정지계정")){
    	st="st";
    } else if( st.equals("휴면계정")){
    	st="do";
    } else if( st.equals("탈퇴계정")){
    	st="se";
    } else if( st.equals("정상계정")){
    	st="no";
    }
    
    //cID = "t";
   // gu = "강남구";
    //st = "ne";
    
    gu = gu.trim();
   // gu ="강남구";
    List<CuVO> cuList = aDAO.selectAllCoustomer(cID, gu, st);
    
    JSONObject jsonObj = new JSONObject();

    JSONArray jsonArr = new JSONArray();

    JSONObject jsonTemp = null;
	String status = "";
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
    	if(  cuVO.getcStatus().equals("st")){
    		status="정지계정";
        } else if( cuVO.getcStatus().equals("do")){
        	status="휴면계정";
        } else if( cuVO.getcStatus().equals("se")){
        	status="탈퇴계정";
        } else if( cuVO.getcStatus().equals("no")){
        	status="정상계정";
        }
    	jsonTemp.put("status", status);
    	jsonTemp.put("signDate", cuVO.getSignDate());
    	jsonTemp.put("accessDate", cuVO.getAccessDate());
    	jsonTemp.put("ipaddress", cuVO.getIpAddress());
    	
    	jsonArr.add(jsonTemp);
    }

    jsonObj.put("resultData", jsonArr);	
    %>
    <%= jsonObj.toString() %>
