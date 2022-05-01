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
String cfNum = request.getParameter("cfNum");
String cfrMain=request.getParameter("cfr_main");
int rCode= Integer.parseInt(request.getParameter("r_code")); 
if(id==null){
	result="신고는 로그인하고 가능합니다.";
}
 if(rCode==0){
	result="신고 카테고리를 선택해주세요";//이거는 위에서 막자
} 
if(request.getParameter("cfNum")==null){
	result="비정상적인 접근입니다.";
}
if(id!=null && rCode!=0 && cfNum!=null){
	FReportVO frVO = new FReportVO();
	frVO.setCfNum(cfNum);
	frVO.setcID(id);
	frVO.setCfrMain(cfrMain);
	frVO.setrCode(rCode);
	DetailCForumDAO dfDAO = new DetailCForumDAO();
	result="신고가 접수되었습니다.";
	dfDAO.insertFreport(frVO);	
}

out.print(result);


%>
