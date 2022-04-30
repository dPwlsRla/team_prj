<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String data="5vHiHFcC2EgPBtR+Hgm8hQ==";

DataDecrypt de = new DataDecrypt("abcefghijklmn1234");


out.print(de.decryption(data));


%>