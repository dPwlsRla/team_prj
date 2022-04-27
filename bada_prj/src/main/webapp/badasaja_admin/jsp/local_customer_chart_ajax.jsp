<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.badasaja.admin.dao.DashDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"
    %>
<%
//구에 해당하는 컬러값을 가진 배열 생성
String[] localColor = {"#B01B43","#FFC84A","#FBE338","#36514D","#335280","#657BB7","#513A9B","#155DA5",
						"#A6568C","#533A9B","#4F6963","#027D5E","#7D314D","#3C8090","#E4E3E2","#E67FAA",
						"#CDC4D9","#BFCFDC","#53463E","#947563","#34373C","#EACCD8","#77787A","#76AA4B",
						"#0095C2"};

//구코드를 받음 data:{"localCode":localCode}
String localCode = request.getParameter("localCode");
if(localCode!=null){
	int code = Integer.parseInt(localCode);
	//db에 조회작업 수행
	String localCusCnt = DashDAO.getInstance().selectLocalCusCnt(localCode); 
	//결과를 JSONObject으로 생성 응답
	JSONObject jsonObj = new JSONObject();
	jsonObj.put("color",localColor[code-1]);
	jsonObj.put("cusCnt",localCusCnt);
	out.println(jsonObj.toJSONString());
}
%>