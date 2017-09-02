package com.talentrecd.util;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;


public class SendMailUtil {
	
	public static int sendMail(String postAddress,String getAddress, String subject,String content) throws MessagingException{
		 	      
		  // 获取系统属性
	      Properties properties = System.getProperties();

	      // 设置邮件服务器
	      properties.setProperty("mail.smtp.host", "smtp.163.com");
	      properties.setProperty("mail.smtp.port", "25");	      
	      properties.setProperty("mail.smtp.auth", "true");
	      
	      // 获取默认session对象
	      Session session = Session.getDefaultInstance(properties,new Authenticator(){
		    public PasswordAuthentication getPasswordAuthentication()
		    {
		     return new PasswordAuthentication("appyanoir@163.com", "Gy659595669"); //验证发件人邮件用户名、密码
		    }
		   });

	      try{
	         // 创建默认的 MimeMessage 对象
	         MimeMessage message = new MimeMessage(session);
             // 发件人
	         message.setFrom(new InternetAddress("appyanoir@163.com"));
             // 收件人
	         message.addRecipient(Message.RecipientType.TO,new InternetAddress(getAddress));
             // 邮件标题
	         message.setSubject(subject);
	         // 邮件内容
	         message.setContent(content,"text/html;charset=utf-8");
	         // 发送消息
	         Transport.send(message);
	         System.out.println("Sent message successfully");
	         return 1;
	        
	      }catch (MessagingException mex) {
	         mex.printStackTrace();
	         return 0;
	      }
	}
}
