package kr.co.sist.badasaja.user.dao;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticatior extends Authenticator {
    PasswordAuthentication pa;
    
    public SMTPAuthenticatior() {
        String mail_id = "panosun96@gmail.com";
        String mail_pw = "wqkehjbyoktpqbqp";
        
        pa = new PasswordAuthentication(mail_id, mail_pw);
    }
    
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}