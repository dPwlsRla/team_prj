<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.badasaja.vo.EntireForumVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.badasaja.user.dao.EntireForumDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"
    %>
<%
String cId = request.getParameter("cId");
String product = request.getParameter("product");
if(cId != null || product != null){
  
EntireForumDAO efDAO = new EntireForumDAO();
List<EntireForumVO> fList = efDAO.selectEntireForum(cId,product);

JSONObject jsonObj = new JSONObject();
JSONArray jsonArr = new JSONArray();
JSONObject jsonTemp = null;

for(int i=0; i<fList.size();i++){
jsonTemp = new JSONObject();
jsonTemp.put("cfNum",fList.get(i).getCfNum());
jsonTemp.put("img",fList.get(i).getImg());
jsonTemp.put("isWish",fList.get(i).getIsWish());
jsonTemp.put("list",fList.get(i).getList());
jsonTemp.put("title",fList.get(i).getTitle());
jsonArr.add(jsonTemp);
}

jsonObj.put("resultData", jsonArr);	
out.println(jsonObj.toJSONString());
}
%>

