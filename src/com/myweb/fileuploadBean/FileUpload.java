package com.myweb.fileuploadBean;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.myweb.memberBean.MemberVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileUpload {
	private MemberVo vo;
	
	private int size = 1024 * 1024 * 10; // 10mb
	private String encode = "utf-8";
	private String saveDir = "D:/1806_Ra/git/MyWebProject/WebContent/images/upLoad/";
	
	public FileUpload (HttpServletRequest request) {
		vo = new MemberVo();
		String oriFileName = "";
		String sysFileName = "";
		
		try {
			MultipartRequest multi = new MultipartRequest(request, saveDir, size, encode, new DefaultFileRenamePolicy());
			
			// 업로드된 파일명의 오리지날, 변경된 파일명 표현
			Enumeration<String> e = multi.getFileNames();
			while (e.hasMoreElements()) {
				String tagName = (String) e.nextElement();
				oriFileName = multi.getOriginalFileName(tagName);
				sysFileName = multi.getFilesystemName(tagName);
			}
			
			vo.setId(multi.getParameter("id"));
			vo.setIrum(multi.getParameter("irum"));
			vo.setEmail(multi.getParameter("email"));
			vo.setAddress(multi.getParameter("address"));
			vo.setGrade(Integer.parseInt(multi.getParameter("grade")));
			vo.setPwd(multi.getParameter("pwd"));
			vo.setPhone(multi.getParameter("phone"));
			vo.setPostal(multi.getParameter("postal"));
			vo.setRdate(multi.getParameter("rdate"));
			vo.setPhoto(sysFileName);
			vo.setPhotoOri(oriFileName);
			
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}

	public MemberVo getVo() {
		return vo;
	}
}
