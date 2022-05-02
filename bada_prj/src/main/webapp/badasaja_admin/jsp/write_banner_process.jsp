<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.badasaja.admin.dao.AdminAdDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="kr.co.sist.badasaja.vo.BannerVO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="베너 광고 등록 process페이지"
    %>
<%
	boolean flag = (boolean) session.getAttribute("insertBannerFlag");

	if(!flag){
		
		try{
			
			File saveDirectory = new File("C:/Users/user/git/team_prj/bada_prj/src/main/webapp/badasaja_admin/banner_upload");
		
			int fileSize = 1024*1024*10;
			
			MultipartRequest mr = new MultipartRequest(request, saveDirectory.getPath(), fileSize, "UTF-8",
					 new DefaultFileRenamePolicy());
			
			String aID = mr.getParameter("aID");
			String bURL = mr.getParameter("bURL");
			String category = mr.getParameter("category");
			
			String originalName = mr.getOriginalFileName("bImg");
			String fileSystemName = mr.getFilesystemName("bImg");
			
			BannerVO bVO = new BannerVO();
			
			bVO.setaID(aID);
			bVO.setaURL(bURL);
			bVO.setpCode(category);
			bVO.setImg(fileSystemName);
			
			AdminAdDAO adDAO = AdminAdDAO.getInstance();
			
			adDAO.insertBanner(bVO);
		} catch(SQLException se){
			se.printStackTrace();
	%>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script type="text/javascript">
		alert("서비스가 원할하지 못합니다. /n 다시 시도 해주세요.")
		location.replace('write_banner.jsp');
		</script>
	<%
	 } catch(Exception e){
		 e.printStackTrace();
		%>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script type="text/javascript">
		alert("업로드에 실패하였습니다. \n 다시 시도 해주세요.")
		location.replace('write_banner.jsp');
		</script>
		<%		
	 } 
 		%>
 		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script type="text/javascript">
		alert("업로드 되었습니다.")
		</script>	
 		<%
 		response.sendRedirect("ad_banner_list.jsp");
	} else{
		%>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script type="text/javascript">
		alert("이미 업로드 되었습니다.")
		location.replace('ad_banner_list.jsp');
		</script>
		<%
	}
	session.setAttribute("insertBannerFlag", true);
%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script type="text/javascript">
		alert("업로드 되었습니다.")
		</script>		

