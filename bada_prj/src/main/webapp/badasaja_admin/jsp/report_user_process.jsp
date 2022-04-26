<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.badasaja.vo.CReportVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.badasaja.admin.dao.AdminReportDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String rID = request.getParameter("rID");
String ty = request.getParameter("ty"); 
String st = request.getParameter("st");

if (ty == null || ty.equals("신고사유")) {
	ty = "";
}
if (st == null || st.equals("상태")) {
	st = "";
} else if(st.equals("처리중")){
	st = "n";
} else if(st.equals("처리완료")){
	st = "y";
}

ty = ty.trim();

AdminReportDAO arDAO = AdminReportDAO.getInstance();

List<CReportVO> crList = arDAO.selectCReport(rID, ty, st);

JSONObject jsonObj = new JSONObject();

JSONArray jsonArr = new JSONArray();

JSONObject jsonTemp = null;
String status = "처리완료";
for (CReportVO crVO : crList) {
	jsonTemp = new JSONObject();
	
	jsonTemp.put("reportedID", crVO.getReportedID());
	jsonTemp.put("reportID", crVO.getReportID());
	jsonTemp.put("rCategory", crVO.getrCategory());
	jsonTemp.put("crMain", crVO.getCrMain());
	if( String.valueOf(crVO.getCrStatus()).equals("n")){
		status = "처리중";
	}
	jsonTemp.put("cfrStatus", status);
	jsonTemp.put("crDate", crVO.getCrDate());

	jsonArr.add(jsonTemp);
}

jsonObj.put("resultData", jsonArr);
%>
<%=jsonObj.toString()%>