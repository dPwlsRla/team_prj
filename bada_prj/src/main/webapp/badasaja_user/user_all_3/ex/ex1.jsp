<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
DataDecrypt de = new DataDecrypt("abcefghijklmn1234");
String name = de.decryption("z//v4YlB/z5YTxdNDkpYGlCfKTCIj5EMZfpzvY+/5qQ=");
out.print(name);
%>