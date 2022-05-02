<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.badasaja.admin.dao.AdminAdDAO"%>
<%@page import="kr.co.sist.badasaja.vo.AdvertiserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="광고주 등록 process 페이지"
    %>
<%
	
	boolean flag = (boolean)session.getAttribute("insertAdvertiserFlag");

	
	if(!flag){
	
	try{
	request.setCharacterEncoding("UTF-8");
	String aID = request.getParameter("aID");
	String aName = request.getParameter("aName");
	String local = request.getParameter("local");
	
	AdvertiserVO aVO = new AdvertiserVO();
	
	aVO.setaID(aID);
	aVO.setaName(aName);
	aVO.setGuCode(local);
	
	AdminAdDAO adDAO = AdminAdDAO.getInstance();
	adDAO.insertAdvertiser(aVO);
	} catch(SQLException se){
		se.printStackTrace();
	%>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script type="text/javascript">
		alert("서비스가 원할하지 못합니다. \n 다시 시도 해주세요.")
		location.replace('advertiser_registeration.jsp');
		</script>
	<%
	} catch(Exception e){
		e.printStackTrace();
	%>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script type="text/javascript">
		alert("업로드에 실패하였습니다. \n 다시 시도 해주세요.")
		location.replace('advertiser_registeration.jsp');
		</script>
	<%
	}
	
	} else {
	%>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script type="text/javascript">
		alert("이미 업로드 되었습니다.")
		location.replace('advertiser.jsp');
		</script>
	<%	
	}
%>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script type="text/javascript">
		alert("등록 되었습니다.")
		location.replace('advertiser.jsp');
		</script>		

