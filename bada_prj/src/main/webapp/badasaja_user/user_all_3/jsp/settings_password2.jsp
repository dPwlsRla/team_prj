<%@page import="kr.co.sist.badasaja.user.dao.MypageDAO"%>
<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="kr.co.sist.badasaja.vo.CuVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
CuVO cuvo = new CuVO();
cuvo.setcPass(request.getParameter("pass"));


MypageDAO mDAO = new MypageDAO();
String flag = mDAO.selectAccount(cuvo); 



if(flag=="none"){
	out.println("<script>alert('패스워드가 틀립니다.')</script>");
	out.println("<script>history.go(-1);</script>");
}else{
	DataDecrypt de= new DataDecrypt("abcefghijklmn1234");

	String data = de.decryption(flag);
	session.setMaxInactiveInterval(60*2); //세션에 생존시간
	session.setAttribute("name", data);
	out.println("<script>location.href='settings.jsp'</script>");
}

%>