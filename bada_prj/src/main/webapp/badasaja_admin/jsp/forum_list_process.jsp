<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.badasaja.vo.CForumVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.badasaja.admin.dao.AdminForumDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"
    info="유저 게시글 전체 조회 검색 process 페이지"
    %>
<%
	
String cID = request.getParameter("cID");
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
List<CForumVO> cfList = afDAO.selectAllCforum(cID, gu, pr, st);

JSONObject jsonObj = new JSONObject();

JSONArray jsonArr = new JSONArray();

JSONObject jsonTemp = null;

for(CForumVO cfVO : cfList){
	jsonTemp = new JSONObject();
	jsonTemp.put("cfNum", cfVO.getCfNum());
	jsonTemp.put("cID", cfVO.getcID());
	jsonTemp.put("topic", cfVO.getCfTopic());
	jsonTemp.put("local", cfVO.getLocal());
	jsonTemp.put("category", cfVO.getpCode());
	jsonTemp.put("status", cfVO.getCfStatus());
	jsonTemp.put("writeDate", cfVO.getWriteDate());
	
	jsonArr.add(jsonTemp);
}

jsonObj.put("resultData", jsonArr);	
%>
<%= jsonObj.toString() %>