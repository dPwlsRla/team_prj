<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int num = Integer.parseInt(request.getParameter("hid"));
session.setAttribute("count",num );
out.println("<script>location.href='favorites.jsp'</script>");
%>
