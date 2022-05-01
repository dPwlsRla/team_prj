<%@page import="kr.co.sist.badasaja.vo.CReportVO"%>
<%@page import="kr.co.sist.badasaja.user.dao.DetailCForumDAO"%>
<%@page import="kr.co.sist.badasaja.vo.FReportVO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
//제이슨으로 결과 반납
String result="";
String id=(String)session.getAttribute("cId");
String crMain=request.getParameter("cr_main");
String reportedID=request.getParameter("reportedID");
int rCode= Integer.parseInt(request.getParameter("r_code")); 
if(id==null){
	result="신고는 로그인하고 가능합니다.";
}
 if(rCode==0){
	result="신고 카테고리를 선택해주세요";//이거는 위에서 막자
} 
if(request.getParameter("reportedID")==null){
	result="비정상적인 접근입니다.";
} 

if(id!=null && rCode!=0){
	CReportVO crVO = new CReportVO();
	crVO.setReportID(id);
	crVO.setReportedID(reportedID);
	crVO.setCrMain(crMain);
	crVO.setrCode(rCode);
	
	DetailCForumDAO dfDAO = new DetailCForumDAO();
	dfDAO.insertCReport(crVO);
	result="신고가 접수되었습니다.";
	
} 
out.print(result);
/* out.println(id);
out.println(crMain);
out.println(rCode);
out.println(reportedID); */

%>
