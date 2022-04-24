<%@page import="kr.co.sist.badasaja.user.dao.MemberDAO"%>
<%@page import="kr.co.sist.badasaja.vo.CuVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="수정"%>

<%
CuVO cuVO = new CuVO();

cuVO.setcID(request.getParameter("id"));
cuVO.setcPass(request.getParameter("passWd"));

MemberDAO uDAO = new MemberDAO();
boolean flag = uDAO.selectMember(cuVO);

if(flag) {
	session.setAttribute("cId", cuVO.getcID());
	//session.setAttribute("cPass", cuVO.getcPass());
	response.sendRedirect("index.jsp");
	
}else{
	
	out.println("<script>alert('존재하는 아이디가 없습니다.')</script>");
	out.println("<script>history.go(-1);</script>");

}
%>
