<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.badasaja.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.badasaja.admin.dao.KyhNoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="관리자 한줄공지 조회 process 페이지"
    %>
<%

KyhNoticeDAO knDAO = KyhNoticeDAO.getInstance();

List<NoticeVO> nList = knDAO.selectAllNotice();

JSONObject jsonObj = new JSONObject();

JSONArray jsonArr = new JSONArray();

JSONObject jsonTemp = null;

for(NoticeVO nVO : nList){
	jsonTemp = new JSONObject();
	jsonTemp.put("nNum", nVO.getnNum() );
	jsonTemp.put("oMain", nVO.getoMain() );
	jsonTemp.put("oID", nVO.getoID() );
	jsonTemp.put("postedDate", nVO.getPostedDate() );
	
	jsonArr.add(jsonTemp);
}

jsonObj.put("resultData", jsonArr);	

%>
<%= jsonObj.toString() %>