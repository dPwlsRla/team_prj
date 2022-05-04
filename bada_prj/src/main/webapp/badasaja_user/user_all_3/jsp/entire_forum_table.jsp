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
if(cId == null || product == null){
	return;
}
EntireForumDAO efDAO = new EntireForumDAO();
List<EntireForumVO> efList = efDAO.selectEntireForum(cId,product,1);
pageContext.setAttribute("efList", efList);
int fCnt = efDAO.selectForumCnt(cId, product);
pageContext.setAttribute("cId", cId);
pageContext.setAttribute("fCnt", fCnt);

%>
<script type="text/javascript">

	
	function moreForum(){
		let dv = event.currentTarget;
		var number = dv.innerText;
		
		id = '<%=cId%>';
		pName='<%=product%>';
		
		$.ajax({
			url:"http://localhost/bada_prj/badasaja_user/user_all_3/jsp/entire_forum_table2.jsp",
			 data: {
				   cId : id,
				   product : pName,
				   num : number,
			},
			type:"get",
			dataType:"html",
			error:function( xhr ){
				alert( xhr.text + "/" + xhr.status);
			},
			success:function(data){
				$("#forumAjax").html(data);
			}
		}) //ajax
		
	}//end moreForum
	
</script>	

<div id="forumAjax" class="row mb-5">
	<c:forEach var="efVO"  items="${efList}" > <!-- pageContext.setattribute한 efList 에서 for문 돔. 원소 하나하나를 efVO로 보겠다. -->
		<div class="col-sm-6 col-lg-3 mb-4" data-aos="fade-up">
	        <div class="block-4 text-center">
	            <div class="block-4-text p-4" style="background-color:white;" id="efDiv">
	                   <a href="javascript:void(0);"  onclick="goForum('${efVO.cfNum}')" ><h3>${efVO.title}</h3></a>
	                   <c:choose>
	                   	   <c:when test="${efVO.cfNum.startsWith('a')}"></c:when>
	                       <c:when test="${efVO.isWish}"><img src = "../images/like.png" id="like_${efVO.cfNum}" onclick="wishProcess('${efVO.cfNum}')"></c:when>
      					   <c:when test="${!efVO.isWish}"><img src = "../images/unlike.png" id="like_${efVO.cfNum}" onclick="wishProcess('${efVO.cfNum}')"></c:when>	
	                   </c:choose>
	            </div>
	        </div>
	        <figure class="block-4-image">
	        	<a href="javascript:void(0);"  onclick="goForum('${efVO.cfNum}')"><img src="../forum_img/${efVO.img}" alt="Image placeholder" class="img-fluid"></a>
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
</div>

<div class="row" data-aos="fade-up">
     <div class="col-md-12 text-center">
          <div class="site-block-27">
          	<ul>
          	  <c:choose>
	              <c:when test="${fCnt==0}"></c:when>
	              <c:when test="${fCnt!=0}">
	                  <c:forEach var="i" begin="1" end="<%=fCnt/15+1%>" step="1">
    	              <li><a href="#" onclick="moreForum()">${i}</a></li>
        	          </c:forEach>
	              </c:when>	
	           </c:choose>
            </ul>
          </div>
     </div>
</div>	

