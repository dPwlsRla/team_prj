package kr.co.sist.badasaja.user.dao;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SMTPDAO {

	/**
	 * 메일보내는 DAO
	 * 
	 * @return
	 * @throws MessagingException
	 * @throws UnsupportedEncodingException
	 */
	public void smtpPass(String email ,String password) throws MessagingException, UnsupportedEncodingException {

		Properties prop = System.getProperties();
		// 서버설정
		// 로그인시 TLS를 사용할 것인지 설정
		prop.put("mail.smtp.starttls.enable", "true");

		// 이메일 발송을 처리해줄 SMTP서버
		prop.put("mail.smtp.host", "smtp.gmail.com");

		// SMTP 서버의 인증을 사용한다는 의미
		prop.put("mail.smtp.auth", "true");

		// TLS의 포트번호는 587이며 SSL의 포트번호는 465이다.
		prop.put("mail.smtp.port", "587");
		// jdk버전과 TLS버전을 맞춥니다.
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");

		Authenticator auth = new SMTPAuthenticatior();

		Session session = Session.getDefaultInstance(prop, auth);

		MimeMessage msg = new MimeMessage(session);

		/* try { */
		// 보내는 날짜 지정
		msg.setSentDate(new Date());

		// 발송자를 지정한다. 발송자의 메일, 발송자명
		msg.setFrom(new InternetAddress("panosun96@gmail.com", "바다사자"));

		// 수신자의 메일을 생성한다.
		InternetAddress to = new InternetAddress(email);

		// Message 클래스의 setRecipient() 메소드를 사용하여 수신자를 설정한다. setRecipient() 메소드로 수신자, 참조,
		// 숨은 참조 설정이 가능하다.
		// Message.RecipientType.TO : 받는 사람
		// Message.RecipientType.CC : 참조
		// Message.RecipientType.BCC : 숨은 참조
		msg.setRecipient(Message.RecipientType.TO, to);

		// 메일의 제목 지정
		msg.setSubject("바다사자 비밀번호가 변경되었습니다. ", "UTF-8");

		// Transport는 메일을 최종적으로 보내는 클래스로 메일을 보내는 부분이다.
		StringBuilder str = new StringBuilder();
		str.append("임시비밀번호는").append(password).append("입니다.");
		msg.setText(str.toString(), "UTF-8");

		Transport.send(msg);
		

	}

	public boolean smtId(String email ,String id) throws MessagingException, UnsupportedEncodingException {

		Properties prop = System.getProperties();
		// 서버설정
		// 로그인시 TLS를 사용할 것인지 설정
		prop.put("mail.smtp.starttls.enable", "true");

		// 이메일 발송을 처리해줄 SMTP서버
		prop.put("mail.smtp.host", "smtp.gmail.com");

		// SMTP 서버의 인증을 사용한다는 의미
		prop.put("mail.smtp.auth", "true");

		// TLS의 포트번호는 587이며 SSL의 포트번호는 465이다.
		prop.put("mail.smtp.port", "587");
		// jdk버전과 TLS버전을 맞춥니다.
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");

		Authenticator auth = new SMTPAuthenticatior();

		Session session = Session.getDefaultInstance(prop, auth);

		MimeMessage msg = new MimeMessage(session);

		/* try { */
		// 보내는 날짜 지정
		msg.setSentDate(new Date());

		// 발송자를 지정한다. 발송자의 메일, 발송자명
		msg.setFrom(new InternetAddress("panosun96@gmail.com", "바다사자"));

		// 수신자의 메일을 생성한다.
		InternetAddress to = new InternetAddress(email);

		// Message 클래스의 setRecipient() 메소드를 사용하여 수신자를 설정한다. setRecipient() 메소드로 수신자, 참조,
		// 숨은 참조 설정이 가능하다.
		// Message.RecipientType.TO : 받는 사람
		// Message.RecipientType.CC : 참조
		// Message.RecipientType.BCC : 숨은 참조
		msg.setRecipient(Message.RecipientType.TO, to);

		// 메일의 제목 지정
		msg.setSubject("바다사자 아이디 찾기 결과 ", "UTF-8");

		// Transport는 메일을 최종적으로 보내는 클래스로 메일을 보내는 부분이다.
		StringBuilder str = new StringBuilder();
		str.append("아이디는").append(id).append("입니다.");
		msg.setText(str.toString(), "UTF-8");

		Transport.send(msg);

		return true;
	}

	public String tempPass() {
		int leftLimit = 97; // numeral '0'
		int rightLimit = 122; // letter 'z'
		int targetStringLength = 6;
		Random random = new Random();
		// 영어소문자
		String pass1 = random.ints(leftLimit, rightLimit + 1).limit(targetStringLength)// 시작과 끝의 범위
				.collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append).toString();

		// 숫자
		leftLimit = 48;
		rightLimit = 57;
		targetStringLength = 1;
		String pass2 = random.ints(leftLimit, rightLimit + 1).limit(targetStringLength)// 시작과 끝의 범위
				.collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append).toString();
		// 특수문자
		leftLimit = 33;
		rightLimit = 47;
		targetStringLength = 1;
		String pass3 = random.ints(leftLimit, rightLimit + 1).limit(targetStringLength)
				.collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append).toString();

		StringBuilder password = new StringBuilder();
		password.append(pass1).append(pass2).append(pass3);

		return password.toString();
	}

}
