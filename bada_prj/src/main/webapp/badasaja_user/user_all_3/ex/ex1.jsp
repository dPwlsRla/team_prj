
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 
    <%@ page import = "java.util.*" %>
    <%--자바 메일 API를 사용하기 위해 관련 패키지를 import합니다. --%>
    <%@ page import = "javax.activation.*" %>
    <%@ page import = "javax.mail.*" %>
    <%@ page import = "javax.mail.internet.*" %>
    <%
        request.setCharacterEncoding("UTF-8");

        /*
        testtesttest
        JavaMail를 사용하여 이메일을 전송하기 위한 3가지 절차는 다음과 같다.
        1. 호스트 이름 ,사용자 명, 비밀번호 등과 같은 호스트의 모든 정보를 저장한느 session 객체를 얻습니다.
        2. 메시지르 구성한다.
        3. 메시지를 보낸다.
        */
        //SMTP 서버 주소 지정
        String server = "smtp.gmail.com";
        int port = 587;
        //gamil
        try{
            Properties properties = new Properties();
            properties.put("mail.smtp.host", server);
            properties.put("mail.smtp.port",port);
            properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.auth","true");
            properties.put("mail.smtp.starttls.required","true");
            properties.put("mail.smtp.debug","true");
            properties.put("mail.smtp.socketFactroy.fallback","false");
            properties.put("mail.smtp.ssl.protocols","TLSv1.2");
            
            /*
                저장한 Properties 객체의 값으로 세션의 인스턴스를 생성한다.
                public static Session getDefaultInstance(Properties pros)
                Session 클래스느 사용자으 ㅣ이름, 암호 , 메일 서버와 같이
                메일 서버를 이용하는데 필요한 이메일 계정 정보를 관리한다.
            */
            Session s = Session.getDefaultInstance(properties);
            //보내는 메일과 받는 주소를 설정한다.
            Address sender_address = new InternetAddress("panosun96@gamil.com");//보내는사람
            Address receiver_address = new InternetAddress("panosun96@gamil.com");//받는사람
            //메일을 보내기 위한 정보를 입력하기 위해 Message 객체를 생성한다.
            Message message = new MimeMessage(s);
            //보내는 메일의 내용이 한글일 경우 깨지지 않도록 content-type을 지정한다.
            message.setHeader("content-type", "text/html;charset=euc-kr");
            //보내는 메일 주소 정보를 설정한다.
            message.setFrom(sender_address);
            //받는 메일 주소 정보를 설정한다.
            //Message.RecipientType 는 Message 클래스에서 허용하는 수신자 유형을 정의한다.
            //MessageRecipientType.To : 받는 사람을 의미한다.
            message.addRecipient(Message.RecipientType.TO, receiver_address);
            //제목 정볼르 설정한다.
            message.setSubject("ㅁㄴㅇㅁㄴㅇ");
            //mailex.jsp
            message.setContent("ㅁㄴㅇㅂㅈㄷ", "text/html;charset=euc-kr");
            //보내는 날짜 설정 
            message.setSentDate(new Date());
            //첫번째 인자느 연결할 호스트이다.
            //두번째 인자는 아이디, 세번째 인자는 비밀번호를 의미
            Transport transport = s.getTransport("smtp");
            transport.connect(server, "panosun96@gamil.com", "arjmklqstvygtcgg");// 진짜 아이디 비번 넣음 됨
            transport.sendMessage(message, message.getAllRecipients());
            transport.close(); //연결종료
            
            out.println("<h3>메일이 정상적으로 전송되었습니다.</h3>");
            
        }catch(Exception e){
            out.println("SMTP 서버가 잘못 설정되었거나, 서비스에 문제가 있다.");
            e.printStackTrace();
        }
    %>

<%
/* DataDecrypt de = new DataDecrypt("abcefghijklmn1234");
String name = de.decryption("z//v4YlB/z5YTxdNDkpYGlCfKTCIj5EMZfpzvY+/5qQ="); */

%>