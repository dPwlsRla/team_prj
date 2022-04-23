<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="매개변수로 요청하기"
    %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 공통CSS -->
<link rel="stylesheet" type="text/css" href="http://211.63.89.135/jsp_prj/common/css/main_20220321.css"/>
<style type="text/css">

</style>
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function() {
	$("#btn").click(function(){
		var param = "name=" + $("#name").val() + "&bYear="+$("#bYear").val();
		$.ajax({
			url:"param_ajax.jsp",
			data:param,
			async:true,
			dataType:"json",
			error:function(xhr){
				$("#output").html("잠시 후 다시 시도해주세요.<br/>" + xhr.status );
				for(var i = 0; i <5; i++){
				$("#output").fadeOut(1000).faceIn(1000);
				}
			},
			success:function(jsonObj){
				var output = "";
				output += "<strong>" + jsonObj.name+"</strong>";
				output += "<strong>" + jsonObj.year+"</strong>";
				output += "<marquee scrollamount='50'>" + jsonObj.age+"</marquee>";
				$("#output").html(output );
			}
		});
	}) // click
}); // ready
</script>
</head>
<body>
<div>
<label>이름</label><input type="text" name="name" class="inputBox" id="name"/><br/>
<label>태어난 해</label>
<%
	int nowYear = Calendar.getInstance().get(Calendar.YEAR);
	pageContext.setAttribute("nowYear", nowYear);
%>
<select id="bYear" name="bYear" class="inputBox">
<c:forEach var="year" begin="1950" end="${ nowYear }" step="1">
<option value="${year }"><c:out value="${ year }"/></option>
</c:forEach>
</select>
<input type="button" value="입력" class="btn btn-dark" id="btn"/>
</div>
<div id="output"></div>
</body>
</html>