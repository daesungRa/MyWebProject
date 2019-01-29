package com.myweb.emailServlet;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuth extends Authenticator {
	PasswordAuthentication passwordAuthentication;
	
	@Override
	public PasswordAuthentication getPasswordAuthentication () {
		String user = "ra5124@naver.com";
		String pwd = "retonago1579";
		
		passwordAuthentication = new PasswordAuthentication(user, pwd);
		
		return passwordAuthentication;
	}
}