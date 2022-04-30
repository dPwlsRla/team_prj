<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="kr.co.sist.badasaja.vo.BannerVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.badasaja.admin.dao.AdminAdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
} else if( st.equals("게시중")){
	st = "y";
} else if( st.equals("게시종료")){
	st= "n";
}
/*String gu = "";
String st = ""; */

pr = pr.trim();

AdminAdDAO adDAO = AdminAdDAO.getInstance();
List<BannerVO> bannerList = adDAO.selectAllBanner(aID, gu, pr, st);

JSONObject jsonObj = new JSONObject();

JSONArray jsonArr = new JSONArray();

JSONObject jsonTemp = null;
for(BannerVO bVO : bannerList){
	jsonTemp = new JSONObject();
	jsonTemp.put("bNum", bVO.getbNum());
	jsonTemp.put("aID", bVO.getaID());
	jsonTemp.put("URL", bVO.getaURL());
	jsonTemp.put("local", bVO.getLocal());
	jsonTemp.put("category", bVO.getpCode());
	jsonTemp.put("status", String.valueOf(bVO.getbStatus()));
	jsonTemp.put("postedDate", bVO.getPostedDate());
	jsonTemp.put("expiryDate", bVO.getExpiryDate());
	
	jsonArr.add(jsonTemp);
}

jsonObj.put("resultData", jsonArr);

out.println(jsonObj.toString());



%>
