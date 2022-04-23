<%@page import="kr.co.sist.badasaja.user.dao.EditCfourmDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="kr.co.sist.badasaja.vo.CImgVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.badasaja.vo.CForumVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="게시글 수정 페이지 데이터"%>
<%
String di="ss";
/* 아작스 써서 받아올값. */
String cfnum = request.getParameter("cfnum");
String topic = request.getParameter("topic");
String category = request.getParameter("category");
String main = request.getParameter("main");
String hash1 = request.getParameter("hash1");
String hash2 = request.getParameter("hash2");
String hash3 = request.getParameter("hash3");
String preview1 = request.getParameter("preview");
String preview2 = request.getParameter("preview1");
String preview3 = request.getParameter("preview2");

/* 이미지 부분은 추후 구현 */

CForumVO cfVO = new CForumVO();


JSONArray ja = new JSONArray();
JSONObject jso = null;
try{
EditCfourmDAO eDAO = new EditCfourmDAO();
List<CForumVO> list= eDAO.selectData1("cf1");

for(CForumVO vo : list){
	
	cfnum=vo.getCfNum();
	topic=vo.getCfTopic();
	main=vo.getCfMain(); 
	%>
	<%=cfnum %>
	<%=vo.getCfNum() %>
	<%
	//ja.put("제목", vo.getCfTopic());
	//jsonTemp.put("메인", vo.getCfMain());
	//jsonArr.add(jsonTemp);  
}

}catch(Exception e)
{
	%>
	에러입니다.
	<%=e %>
	<% }%>
<%
try{
EditCfourmDAO eDAO = new EditCfourmDAO();
List<CImgVO> list= eDAO.selectData2("cf1");

for(CImgVO cIVO : list){
	cIVO.getImg();
	cIVO.getHash();
	
	
	//jsonTemp.put("이미지", cIVO.getImg());
	//jsonTemp.put("해시",cIVO.getHash() ); 
	//jsonArr.add(jsonTemp);
}


}catch(Exception e)
{
%>
에러입니다.
<%=e %>
<% }%>



