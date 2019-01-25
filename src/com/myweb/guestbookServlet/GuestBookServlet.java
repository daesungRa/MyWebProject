package com.myweb.guestbookServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.guestbookBean.GuestBookVo;
import com.myweb.guestbookDao.GuestBookDao;
import com.myweb.guestbookDao.GuestBookDaoImpl;

/**
 * Servlet implementation class GuestBookServlet
 */
@WebServlet("*.gb")
public class GuestBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GuestBookServlet() {
        super();
    }

    /*
     * doGet
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset-utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		// 응답할 페이지 요소
		String url = "/index.jsp?aside=/control.jsp&content=/views/guestbook/";
		String page = request.getRequestURI();
		page = page.substring(page.lastIndexOf("/") + 1, page.lastIndexOf("."));
		System.out.println("page: " + page);
		
		// 요청 페이지에 따른 메서드 처리
		GuestBookDao dao = new GuestBookDaoImpl();
		
		if (page.equals("view")) {
			// 최초 페이지 로딩이므로 페이지는 무조건 1
			int nowPage = 1;
			
			// 전체 검색 (입력 문자열이 공백이면 전체검색)
			Map<String, GuestBookVo> data = dao.list("", nowPage);
			request.setAttribute("data", data);
		}
		
		// servlet 을 사용하여 웹 페이지를 forward
		page = "viewGuestbook";
		RequestDispatcher dispatcher = request.getRequestDispatcher(url + page + ".jsp");
		dispatcher.forward(request, response);
	}

    /*
     * doPost
     */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset-utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		// 응답할 페이지 요소
		String url = "/index.jsp?aside=/control.jsp&content=/views/guestbook/";
		String page = request.getRequestURI();
		page = page.substring(page.lastIndexOf("/") + 1, page.lastIndexOf("."));
		System.out.println("page: " + page);
		
		// 요청 페이지에 따른 메서드 처리
		GuestBookDao dao = new GuestBookDaoImpl();
		if (page.equals("list")) {
			String search = request.getParameter("search");
			int nowPage = 1;
			if (request.getParameter("nowPage") != null) {
				nowPage = Integer.parseInt(request.getParameter("nowPage"));
			}
			
			Map<String, GuestBookVo> data = dao.list(search, nowPage);
			request.setAttribute("data", data);
		} else if (page.equals("insert")) {
			
		} else if (page.equals("insertR")) {
			GuestBookVo vo = makeVo(request);
			boolean b = dao.insert(vo);
			
			if (b) {
				request.setAttribute("msg", "데이터가 정상적으로 저장되었습니다");
			} else {
				request.setAttribute("msg", "데이터가 저장 중 오류 발생!");
			}
			
		} else if (page.equals("modifyR")) {
		} else if (page.equals("deleteR")) {
			
		}
		
		// 페이지 조립하고 forward
		page = "viewGuestbook";
		RequestDispatcher dispatcher = request.getRequestDispatcher(url + page + ".jsp");
		dispatcher.forward(request, response);
	}
	
	private GuestBookVo makeVo (HttpServletRequest request) {
		GuestBookVo vo = new GuestBookVo();
		try {
			// serial 은 시퀀스로 증가, mdate 는 sysdate 로 자동입력
			// vo.setSerial(Integer.parseInt(request.getParameter("serial")));
			vo.setId(request.getParameter("id"));
			vo.setPwd(request.getParameter("pwd"));
			vo.setContent(request.getParameter("content"));
		} catch (Exception ex) { ex.printStackTrace(); }
		
		return vo;
	}
	
	private Map<String, GuestBookVo> list (String search, int nowPage) {
		GuestBookDao dao = new GuestBookDaoImpl();
		Map<String, GuestBookVo> list = dao.list(search, nowPage);
		
		return list;
	}
	
	private GuestBookVo search (int serial) {
		GuestBookDao dao = new GuestBookDaoImpl();
		GuestBookVo vo = dao.select(serial);
		
		return vo;
	}

}
