package com.myweb.emailServlet;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Enumeration;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * - 이메일 서블릿
 * 본래 보안상 뷰 페이지에서부터 이메일 폼 검증 후 전송되어야 함
 */
@WebServlet("*.email")
public class EmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MultipartRequest multi;
	String upload = "D:/1806_Ra/git/MyWebProject/WebContent/images/email/";
	String encode = "utf-8";
	int size = 1024 * 1024 * 100;
    
    public EmailServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String sender = "";
		String receiver = "";
		String doc = "";
		String subject = "";
		String attFile = "";
		
		multi = new MultipartRequest(request, upload, size, encode, new DefaultFileRenamePolicy());
		
		sender = multi.getParameter("sender");
		receiver = multi.getParameter("receiver");
		doc = multi.getParameter("doc");
		subject = multi.getParameter("subject");
		
		Enumeration<String> files = multi.getFileNames();
		while (files.hasMoreElements()) {
			String tag = files.nextElement();
			attFile = multi.getFilesystemName(tag);
		}
		
		/*
		 * ---------------------------
		 * 메일 전송을 위한 프로퍼티 설정
		 * ---------------------------
		 */
		String mailServer = "smtp.naver.com";
		Properties prop = new Properties();
		try {
			prop.put("mail.smtp.stattls.enable", "true");
			prop.put("mail.transport", "smtp");
			prop.put("mail.smtp.port", "465");
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.user", receiver);
			prop.put("mail.smtp.host", mailServer);
			prop.put("mail.smtp.ssl.enable", "true"); // SSL 보안연결 활성화
			
			// 기본 메시지 설정
			Session mailSession = Session.getInstance(prop, new MyAuth());
			Message message = new MimeMessage(mailSession);
			message.setFrom(new InternetAddress(sender));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			message.setSubject(subject);
			message.setSentDate(new Date());
			
			// 문자와 첨부파일을 동시에 전송하기 위한 객체
			Multipart part = new MimeMultipart();
			
			MimeBodyPart text = new MimeBodyPart();
			text.setContent(doc, "text/html;charset=utf-8");
			part.addBodyPart(text);
			
			// 첨부파일 처리
			if (attFile != null) {
				MimeBodyPart img = new MimeBodyPart();
				FileDataSource fds = new FileDataSource(upload + attFile);
				img.setDataHandler(new DataHandler(fds));
				img.setFileName(MimeUtility.encodeText(fds.getName()));
				part.addBodyPart(img);
			}
			
			message.setContent(part);
			Transport.send(message);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			File delFile = new File(upload + attFile);
			if (delFile.exists()) delFile.delete();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp?aside=/control.jsp&content=/views/member/list.jsp");
		dispatcher.forward(request, response);
	}

}
