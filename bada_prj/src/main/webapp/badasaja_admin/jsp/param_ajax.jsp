<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"
    %>
 <%
 	String name = request.getParameter("name");
 	String year = request.getParameter("bYear");
 	
 	Calendar cal = Calendar.getInstance();
 	
 	int age = cal.get(Calendar.YEAR)-Integer.parseInt(year) + 1;
 	
 	JSONObject jsonObj = new JSONObject();
 	jsonObj.put("name", name +"님");
 	jsonObj.put("year", "태어난 해 :" + year);
 	jsonObj.put("age", age +"살");
 
 	out.println(jsonObj.toJSONString());
 %>
