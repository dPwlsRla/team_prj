<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="로그아웃 페이지"%>
<%
session.invalidate();
%>
<script>
	location.href = 'login.jsp';
</script>