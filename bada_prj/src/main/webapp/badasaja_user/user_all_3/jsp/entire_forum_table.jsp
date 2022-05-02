<%@page import="kr.co.sist.badasaja.vo.EntireForumVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.badasaja.user.dao.EntireForumDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
String cId = request.getParameter("cId");
String product = request.getParameter("product");
System.out.println(cId+"/"+product);
if(cId == null || product == null){
	return;
}
EntireForumDAO efDAO = new EntireForumDAO();
List<EntireForumVO> efList = efDAO.selectEntireForum(cId,product);
pageContext.setAttribute("efList", efList);
pageContext.setAttribute("cId", cId);

%>
<script type="text/javascript">

	// 위시 리스트 추가
	function wishProcess(cfNum){
		cId = '<%=(String)session.getAttribute("cId")%>';
		if (cId == null) {
			alert("login plz");
			return;
		}
		if($("#like_"+cfNum)[0].src.includes('unlike')){
			$("#like_"+cfNum)[0].src = "../images/like.png";
			$.ajax({
				type: "POST",
				url: "wishProcess.jsp",
				data:
					{
						"process":"insert",
						"cfNum":cfNum
					},
				success: function(resp){alert("찜목록에 추가되었습니다");},
			})
		}
		else{
			$("#like_"+cfNum)[0].src = "../images/unlike.png";
			$.ajax({
				type: "POST",
				url: "wishProcess.jsp",
				data:
					{
						"process":"delete",
						"cfNum":cfNum,
						"cId":cId,
					},
				success: function(resp){alert("찜목록에서 삭제되었습니다");},
			})
		}
	}
	
	// 게시물 상세 조회
	function goForum(cfNum){
		var forumType = cfNum.substr(0,2);
		
		//case 1. 일반 게시글일 경우
		if(forumType=="cf"){
			document.fFrm.action="forum.jsp"
		}//case 2. 광고 게시글일 경우
		else if(forumType=="ad"){
			document.fFrm.action = "ad_forum.jsp";
		}
		document.fFrm.cfNum.value=cfNum;
		$("#fFrm").submit();
	} 
	
</script>	
	<form action="forum.jsp" id="fFrm" name="fFrm" method="post">
	<input type="hidden" name="cfNum" value="">
	</form>

	<c:forEach var="efVO"  items="${efList}" > <!-- pageContext.setattribute한 efList 에서 for문 돔. 원소 하나하나를 efVO로 보겠다. -->
		<div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
	        <div class="block-4 text-center">
	            <div class="block-4-text p-4" id="efDiv">
	                   <a href="javascript:void(0);"  onclick="goForum('${efVO.cfNum}')" ><h3>${efVO.title}</h3></a>
	                   <c:choose>
	                   	   <c:when test="${efVO.cfNum.startsWith('a')}"></c:when>
	                       <c:when test="${efVO.isWish}"><img src = "../images/like.png" id="like_${efVO.cfNum}" onclick="wishProcess('${efVO.cfNum}')"></c:when>
      					   <c:when test="${!efVO.isWish}"><img src = "../images/unlike.png" id="like_${efVO.cfNum}" onclick="wishProcess('${efVO.cfNum}')"></c:when>	
	                   </c:choose>
	            </div>
	        </div>
	        <figure class="block-4-image">
	        	<c:choose>
	        	<c:when test="${efVO.cfNum.startsWith('a')}">
	        	<a href="javascript:void(0);"  onclick="goForum('${efVO.cfNum}')"><img src="../forum_img/${efVO.img}" alt="Image placeholder" class="img-fluid"></a>
	        	</c:when>
	        	<c:when test="${efVO.cfNum.startsWith('c')}">
	        	<a href="javascript:void(0);"  onclick="goForum('${efVO.cfNum}')"><img src="../forum_img/${efVO.img}" alt="Image placeholder" class="img-fluid"></a>
	        	</c:when>
	       		</c:choose>
	        </figure>
	        <div class="block-4-text">
	            <ul>
	               <c:forEach var="htVO"  items="${efVO.list}" >
	                    <li>${htVO.hash}</li>
	               </c:forEach>
	            </ul>
	        </div>
	    </div>    
	</c:forEach>	

