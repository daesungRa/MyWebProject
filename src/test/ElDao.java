package test;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ElDao {
	private ElVo vo;
	
	private String encode = "utf-8";
	private String saveDir = ".";
	
	public ElDao (HttpServletRequest request) {
		vo = new ElVo();
		
		try {			
			vo.setIntro(request.getParameter("intro"));
			vo.setSports(request.getParameter("sports"));
			vo.setRivers(request.getParameterValues("rivers"));
			vo.setHobbies(request.getParameterValues("hobbies"));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public ElVo getVo() {
		return vo;
	}
}
