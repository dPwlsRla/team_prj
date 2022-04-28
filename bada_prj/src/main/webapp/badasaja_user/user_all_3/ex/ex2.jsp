<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Address"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="kr.co.sist.badasaja.user.dao.SMTPAuthenticatior"%>
<%@page import="javax.mail.Authenticator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


Properties p = new Properties(); // 정보를 담을 객체

p.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP

p.put("mail.smtp.port", "465");
p.put("mail.smtp.starttls.enable", "true");
p.put("mail.smtp.auth", "true");
p.put("mail.smtp.debug", "true");

p.put("mail.smtp.socketFactory.port", "465");
p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
p.put("mail.smtp.socketFactory.fallback", "false");
// SMTP 서버에 접속하기 위한 정보들

try{
    Authenticator auth = new SMTPAuthenticatior();
    Session ses = Session.getInstance(p, auth);
    
    ses.setDebug(true);
    
    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
    msg.setSubject("바다사자 비밀번호 변경"); // 제목
    
    Address fromAddr = new InternetAddress("panosun@naver.com");
    msg.setFrom(fromAddr); // 보내는 사람
    
    Address toAddr = new InternetAddress("panosun@naver.com");
    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
    
    msg.setContent("하이요", "text/html;charset=UTF-8"); // 내용과 인코딩
    
    Transport.send(msg); // 전송
} catch(Exception e){
    e.printStackTrace();
    // 오류 발생시 뒤로 돌아가도록
    return;
}

out.println("성공");
// 성공 시
%>

<%
/*
JSP페이지에서 기능을 구현한 간단한 메일 보내기 기능입니다. 

1. 파라미터를 받을 객체를 생성 (String)

2. Properties에 SMTP 메일 정보를 담음

3. 위에서 작성한 SMTPAuthenticatior를 불러와 계정인증을 하고 

4. 세션정보를 MimeMessages에 set으로 담음

5. MimeMessages에서 지원하는 제목과 보내는 메일, 받는 메일은 각각 메소드를 이용하고,

6. 내용에는 StringBuffer를 통해 6가지 내용을 담음

7. 현재 네이버나 구글은 SMTP기능이 잘 안된다 해서 저는 메일플러그 계정을 이용함.

8. 마찬가지로 계정인증문제로 보내는 메일이 인증이 되야하고, 문의는 내 메일로 받아야 하니 똑같은 메일주소가 됨. 그래서 파라미터를 View에 Hidden값으로 넣어놈.

9. 끝

*/
%>