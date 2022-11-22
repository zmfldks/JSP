package kr.co.jboard2.test;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class GmailTest {
public static void main(String[] args) {
		
		// 기본정보
		String sender = "wanggeuni37@gmail.com";
		String password = "hptpqretakhqotgz";
		
		String receiver = "chdk0306@naver.com";
		String title = "테스트 메일 입니다.";
		String content = "테스트 내용 입니다.";
		
		// Gmail SMTP 서버설정
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);
			}
		});
				
		// 메일발송
		Message message = new MimeMessage(session);
		
		try {
			System.out.println("메일 전송 시작...");
			message.setFrom(new InternetAddress(sender, "관리자", "UTF-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			message.setSubject(title);
			message.setContent(content, "text/html;charset=utf-8");
			Transport.send(message);
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("메일 전송 실패...");
		}
		
		System.out.println("메일 전송 성공...");
	}
}
