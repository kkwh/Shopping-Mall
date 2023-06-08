package com.itwill.joo.service;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MailService {
	
	private static final char[] charSet = new char[]{ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
			'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
            'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
	
	private static final String user = "shoppingmall0710@gmail.com";
	private static final String password = "wwvfdgangtdjwtym";
	
	public static void sendEmail(String recipient, String code) {
		Properties prop = new Properties();
		prop.put("mail.smtp.auth", true);
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", 587);
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
        
        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });
        
        MimeMessage message = new MimeMessage(session);
        
        try {
        	message.setFrom(new InternetAddress(user));
        	
        	message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
        	
        	message.setSubject("이메일 인증 번호");
        	
        	message.setText(code);
			
        	Transport.send(message);
        	
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	
	public String generateValidationNumber() {
		String code = "";
		int N = charSet.length;
		
		for(int i = 0; i < 8; i++) {
			int idx = (int) (Math.random() * N);
			code += charSet[idx] + "";
		}
		
		return code;
	}

}
