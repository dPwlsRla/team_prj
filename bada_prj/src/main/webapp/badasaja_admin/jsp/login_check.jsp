<%@page import="kr.co.sist.badasaja.vo.OperatorVO"%>
<%@page import="kr.co.sist.badasaja.admin.dao.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
OperatorVO oVO = new OperatorVO();

 oVO.setoID(request.getParameter("admin_id"));
 oVO.setoPass(request.getParameter("admin_pass"));


AdminDAO aDAO = AdminDAO.getInstance();
boolean flag = aDAO.selectAdminLogin(oVO);

if(flag) {
	session.setAttribute("aId", oVO.getoID());
	session.setAttribute("aPass", oVO.getoPass());
	response.sendRedirect("index.jsp");
	%>
<%		

}else{
	%>
	out.println("<script>alert("존재하는 아이디가 없습니다.")</script>")
	out.println("<script>history.go(-1);</script>")
<%
}
%>