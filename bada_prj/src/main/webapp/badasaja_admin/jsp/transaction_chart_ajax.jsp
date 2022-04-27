<%@page import="kr.co.sist.badasaja.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.badasaja.admin.dao.BaseDAO"%>
<%@page import="kr.co.sist.badasaja.admin.dao.DashDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"
    %>
<%
BaseDAO bDAO = BaseDAO.getInstance();
List<ProductVO> pList = bDAO.selectProductList();

pageContext.setAttribute("pList", pList);	
String term = request.getParameter("term");
System.out.println(term+"불림");
if(term == null){
	return;
} 


JSONObject jsonObj = new JSONObject();
DashDAO dDAO = DashDAO.getInstance();


int tCnt = 0;
for(int i=0; i<pList.size();i++){
tCnt = dDAO.selectPcodeTransaction(pList.get(i).getpCode(),term);
jsonObj.put(pList.get(i).getpCode(),tCnt);
}

out.println(jsonObj.toJSONString());
%>