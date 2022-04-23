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
	
String aID = request.getParameter("aID");
String gu = request.getParameter("gu");
String pr = request.getParameter("pr"); 
String st = request.getParameter("st");

/* if(aID == null){
aID="";
} */
if(pr == null || pr.equals("카테고리 선택")){
pr="";
} 

if(gu == null || gu.equals("지역")){
gu = "";
}

if(st == null || st.equals("상태")){
st = "";
}
/*String gu = "";
String st = ""; */

pr = pr.trim();
gu = gu.trim();


AdminForumDAO afDAO = AdminForumDAO.getInstance();
List<AdForumVO> afList = afDAO.selectAllFforum(aID, gu, pr, st);

JSONObject jsonObj = new JSONObject();

JSONArray jsonArr = new JSONArray();

JSONObject jsonTemp = null;

for(AdForumVO afVO : afList){
	jsonTemp = new JSONObject();
	jsonTemp.put("afNum", afVO.getAfNum());
	jsonTemp.put("aID", afVO.getaID());
	jsonTemp.put("topic", afVO.getAfTopic());
	jsonTemp.put("local", afVO.getLocal());
	jsonTemp.put("category", afVO.getpCode());
	jsonTemp.put("status", afVO.getAfStatus());
	jsonTemp.put("postedDate", afVO.getPostedDate());
	jsonTemp.put("expiryDate", afVO.getExpiryDate());
	
	jsonArr.add(jsonTemp);
}

jsonObj.put("resultData", jsonArr);	
%>
<%= jsonObj.toString() %>