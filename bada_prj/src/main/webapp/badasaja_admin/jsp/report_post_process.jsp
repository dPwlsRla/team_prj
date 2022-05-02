<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.badasaja.vo.FReportVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.badasaja.admin.dao.AdminReportDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="게시글 신고 조회 검색 process페이지"
	%>
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

List<FReportVO> frList = arDAO.selectFReport(rID, ty, st);

JSONObject jsonObj = new JSONObject();

JSONArray jsonArr = new JSONArray();

JSONObject jsonTemp = null;
String status = "처리완료";
for (FReportVO frVO : frList) {
	jsonTemp = new JSONObject();
	
	jsonTemp.put("cfrNum", frVO.getCfrNum());
	jsonTemp.put("cfNum", frVO.getCfNum());
	jsonTemp.put("cID", frVO.getcID());
	jsonTemp.put("rCategory", frVO.getrCategory());
	jsonTemp.put("cfrMain", frVO.getCfrMain());
	if( String.valueOf(frVO.getCfrStatus()).equals("n")){
		status = "처리중";
	}
	jsonTemp.put("cfrStatus", status);
	jsonTemp.put("cfrDate", frVO.getCfrDate());
	jsonTemp.put("cfrReport", frVO.getCfrReport());

	jsonArr.add(jsonTemp);
}

jsonObj.put("resultData", jsonArr);
%>
<%=jsonObj.toString()%>

