<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String data="c4d6yJ3f5nVaVEfV+AyZcA==";

DataDecrypt de = new DataDecrypt("abcefghijklmn1234");


out.print(de.decryption(data));


%>