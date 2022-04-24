<%@page import="kr.co.sist.badasaja.admin.dao.AdminAdDAO"%>
<%@page import="kr.co.sist.badasaja.vo.AdImgVO"%>
<%@page import="kr.co.sist.badasaja.vo.AdForumVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	boolean flag = (boolean)session.getAttribute("insertAdForumFlag");
	
		if(!flag){
		
 		try{ 
			
			File saveDirectory = new File("C:/Users/user/git/team_prj/bada_prj/src/main/webapp/badasaja_admin/upload");
			
			int fileSize = 1024*1024*10; 
			
			MultipartRequest mr = new MultipartRequest(request, saveDirectory.getPath(), fileSize, "UTF-8",
					 new DefaultFileRenamePolicy());
			
			String topic = mr.getParameter("topic");
			String originalName1 = mr.getOriginalFileName("upImg1"); 
			String fileSystemName1 = mr.getFilesystemName("upImg1");
			
			String originalName2 = mr.getOriginalFileName("upImg2"); 
			String fileSystemName2 = mr.getFilesystemName("upImg2");
			
			String originalName3 = mr.getOriginalFileName("upImg3"); 
			String fileSystemName3 = mr.getFilesystemName("upImg3");
			
			String aID = mr.getParameter("aID");
			String category = mr.getParameter("category");
			String status = mr.getParameter("status");
			String forumMain = mr.getParameter("forumMain");
			
			String[] imgArr = {fileSystemName1,fileSystemName2,fileSystemName3};
			
			
			int cnt = 0;
			for(int i = 0; i < imgArr.length; i++){
				if(imgArr[i] != null){
				imgArr[cnt] = imgArr[i];	
				cnt++;					
				}
			}
			
			AdImgVO aiVO = new AdImgVO();
			AdForumVO afVO = new AdForumVO();
			afVO.setAfTopic(topic);
			afVO.setMainImg(imgArr[0]);
			afVO.setaID(aID);
			afVO.setpCode(category);
			afVO.setAfStatus(status);
			afVO.setAfMain(forumMain);
			
			AdminAdDAO adDAO = AdminAdDAO.getInstance();
			adDAO.insertAdForum(afVO);
			
			
			String imgs = "";
			if( cnt > 1){
				if(cnt == 2){
					imgs = imgArr[1];		
				} else if( cnt == 3){
				  	imgs = imgArr[1] +"," + imgArr[2];
				}
			adDAO.inserFImg(imgs);
			}
			
			
			
	 }catch(SQLException se){
			se.printStackTrace();
	%>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script type="text/javascript">
		alert("서비스가 원할하지 못합니다. /n 다시 시도 해주세요.")
		location.replace('write_ad_forum.jsp');
		</script>
	<%
	 } catch(Exception e){
		 e.printStackTrace();
		%>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script type="text/javascript">
		alert("업로드에 실패하였습니다. \n 다시 시도 해주세요.")
		location.replace('write_ad_forum.jsp');
		</script>
		<%		
	 } 
 		%>
 		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script type="text/javascript">
		alert("업로드 되었습니다.")
		</script>		
 		
 		<%
 		response.sendRedirect("ad_forum_list.jsp");
	} else{
		%>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script type="text/javascript">
		alert("이미 업로드 되었습니다.")
		location.replace('ad_forum_list.jsp');
		</script>
		<%
	}
%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script type="text/javascript">
		alert("업로드 되었습니다.")
		</script>		
