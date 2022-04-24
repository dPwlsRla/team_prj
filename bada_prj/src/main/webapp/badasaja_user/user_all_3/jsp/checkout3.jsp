<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="oracle.sql.CHAR"%>
<%@page import="kr.co.sist.badasaja.user.dao.MemberDAO"%>
<%@page import="kr.co.sist.badasaja.vo.CuVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="수정"%>
    
 <%
 String hid = request.getParameter("hid");
 if("id".equals(hid)){
	 
/* 아이디 중복 체크 */
CuVO cuVO = new CuVO();

cuVO.setcID(request.getParameter("id"));

MemberDAO mDAO = new MemberDAO();
boolean id = mDAO.selectid(cuVO);
JSONObject jso = new JSONObject();

jso.put("data", id);
out.println(jso.toJSONString());


}//hid
 if("nick".equals(hid)){
		/* 아이디 중복 체크 */
		CuVO cuVO2 = new CuVO();

		cuVO2.setNickName(request.getParameter("nick"));

		MemberDAO mDAO2 = new MemberDAO();
		boolean nick = mDAO2.selectNick(cuVO2);
		JSONObject jso2 = new JSONObject();

		jso2.put("data2", nick);
		out.println(jso2.toJSONString());
} //hid
 
 if("ok".equals(hid)){
		/*  중복 체크 */
		StringBuilder tel = new StringBuilder();
		tel.append(request.getParameter("tel1")).append("-").append(request.getParameter("tel2"))
		.append("-").append(request.getParameter("tel3"));
		
		
		StringBuilder mail = new StringBuilder();
		mail.append(request.getParameter("c_email_address")).append("@")
		.append(request.getParameter("c_domain"));
		

		CuVO cuVO2 = new CuVO();
		
		DataEncrypt de = new DataEncrypt("abcefghijklmn1234");//키가 안맞아서 에러 났어요
		
		
		cuVO2.setcID(request.getParameter("c_id"));
		cuVO2.setcPass(de.encryption(request.getParameter("c_pass")));
		cuVO2.setNickName(request.getParameter("c_nickname"));
		cuVO2.setGender(request.getParameter("gender"));
		cuVO2.setTel(tel.toString());
		cuVO2.setBirth(request.getParameter("date"));
		cuVO2.setEmail(mail.toString());
		cuVO2.setGuCode(Integer.parseInt(request.getParameter("c_country"))); 

		cuVO2.setIpAddress(request.getRemoteAddr());
		MemberDAO uDAO2 = new MemberDAO();
		uDAO2.insertMember(cuVO2); 
		out.println("<script>location.href='index.jsp'</script>");
}//end if
%>
