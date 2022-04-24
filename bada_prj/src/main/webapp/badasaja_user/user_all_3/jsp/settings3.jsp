<%@page import="kr.co.sist.badasaja.user.dao.MypageDAO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.badasaja.user.dao.MemberDAO"%>
<%@page import="kr.co.sist.badasaja.vo.CuVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 request.setCharacterEncoding("UTF-8");
 String hid = request.getParameter("hid");
 JSONObject jso = new JSONObject();
if("id".equals(hid)){
	 
/* 아이디 중복 체크 */
CuVO cuVO = new CuVO();

cuVO.setcID(request.getParameter("id"));

MemberDAO mDAO = new MemberDAO();
boolean id = mDAO.selectid(cuVO);


jso.put("data", id);
out.println(jso.toJSONString()); 

}else if("nick".equals(hid)){
	/* 아이디 중복 체크 */
	CuVO cuVO2 = new CuVO();

	cuVO2.setNickName(request.getParameter("nick"));

	MemberDAO mDAO2 = new MemberDAO();
	boolean nick = mDAO2.selectNick(cuVO2);

	jso.put("data", nick);
	out.println(jso.toJSONString());
} //hid

if("ok".equals(hid)){
	/*  중복 체크 */
	String password="";
	CuVO cuVO3 = new CuVO();
	if(request.getParameter("pass")!=null){
		DataEncrypt de = new DataEncrypt("abcefghijklmn1234");//키가 안맞아서 에러 났어요
		password=de.encryption(request.getParameter("pass"));
	}else{
		password="none";
	}

 	String telData =request.getParameter("tel");
	StringBuilder tel = new StringBuilder();
	tel.append(telData.substring(0,3)).append("-").append(telData.substring(3,7))
	.append("-").append(telData.substring(7,11));
	

	cuVO3.setcID(request.getParameter("id"));
	cuVO3.setcPass(password);
	cuVO3.setNickName(request.getParameter("nick"));
	cuVO3.setTel(tel.toString());
	cuVO3.setEmail(request.getParameter("email"));
	cuVO3.setGuCode(Integer.parseInt(request.getParameter("gu_code"))); 

	MypageDAO uDAO2 = new MypageDAO();
	uDAO2.updateCustomer(cuVO3);  
	
	out.println("<script>location.href='index.jsp'</script>"); 
	
}//end if
%>

