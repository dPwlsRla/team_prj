<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="관리자 exit 클릭시 세션 초기화 후 사용자 페이지로 이동"%>
<%
session.invalidate();
%>

<script>
	location.replace('http://localhost/bada_prj/badasaja_user/user_all_3/jsp/index.jsp');
</script>