package com.myweb.guestbookServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
		GuestBookDaoImpl dao = new GuestBookDaoImpl();
		
		if (page.equals("viewGuestbook")) {
			request.setAttribute("write", "true");
		}
		
		// 최초 페이지 로딩이므로 페이지는 무조건 1
		int nowPage = 1;
		
		// 전체 검색 (입력 문자열이 공백이면 전체검색)
		List<GuestBookVo> data = dao.list("", nowPage);
		request.setAttribute("data", data);
		request.setAttribute("nowBlock", dao.nowBlock);
		request.setAttribute("startPage", dao.startPage);
		request.setAttribute("endPage", dao.endPage);
		request.setAttribute("nowPage", dao.nowPage);
		request.setAttribute("totBlock", dao.totBlock);
		request.setAttribute("totPage", dao.totPage);
		
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
		
		// 기본 nowPage 는 1
		int nowPage = 1;
		
		// 응답할 페이지 요소
		String url = "/index.jsp?aside=/control.jsp&content=/views/guestbook/";
		String page = request.getRequestURI();
		page = page.substring(page.lastIndexOf("/") + 1, page.lastIndexOf("."));
		System.out.println("page: " + page);
		
		// 요청 페이지에 따른 메서드 처리
		GuestBookDaoImpl dao = new GuestBookDaoImpl();
		List<GuestBookVo> data = null;
		if (page.equals("list")) {
			String search = request.getParameter("search");
			if (request.getParameter("nowPage") != null) {
				nowPage = Integer.parseInt(request.getParameter("nowPage"));
			}
			
			data = dao.list(search, nowPage);
			// 다음 페이지 검색을 위해 검색어를 저장
			request.setAttribute("search", search);
		} else if (page.equals("insert")) {
			GuestBookVo vo = makeVo(request);
			boolean b = dao.insert(vo);
			
			if (b) {
				request.setAttribute("msg", "데이터가 정상적으로 저장되었습니다");
			} else {
				request.setAttribute("msg", "데이터가 저장 중 오류 발생!");
			}
			
		} else if (page.equals("modify")) {
			GuestBookVo vo = makeVo(request);
			boolean b = dao.modify(vo);
			
			if (b) {
				request.setAttribute("msg", "데이터가 정상적으로 수정되었습니다");
			} else {
				request.setAttribute("msg", "데이터 수정 중 오류 발생!");
			}
			
		} else if (page.equals("delete")) {
			GuestBookVo vo = makeVo(request);
			boolean b = dao.delete(vo);
			
			if (b) {
				request.setAttribute("msg", "데이터 삭제 성공!");
			} else {
				request.setAttribute("msg", "데이터 삭제 중 오류 발생!");
			}

		}
		
		if (request.getParameter("search") == null) {
			data = dao.list("", nowPage);
		}
		// 반환된 방명록 리스트, 현재 블럭, 시작 페이지, 끝 페이지, 현재 페이지, 전체 페이지 세팅
		request.setAttribute("data", data);
		request.setAttribute("nowBlock", dao.nowBlock);
		request.setAttribute("startPage", dao.startPage);
		request.setAttribute("endPage", dao.endPage);
		request.setAttribute("nowPage", dao.nowPage);
		request.setAttribute("totBlock", dao.totBlock);
		request.setAttribute("totPage", dao.totPage);
		// 페이지 조립하고 forward
		page = "viewGuestbook";
		RequestDispatcher dispatcher = request.getRequestDispatcher(url + page + ".jsp");
		dispatcher.forward(request, response);
	}
	
	private GuestBookVo makeVo (HttpServletRequest request) {
		GuestBookVo vo = new GuestBookVo();
		try {
			// serial 은 시퀀스로 증가, mdate 는 sysdate 로 자동입력
			if (request.getParameter("serial") != null) {
				vo.setSerial(Integer.parseInt(request.getParameter("serial")));
			}
			vo.setId(request.getParameter("id"));
			vo.setPwd(request.getParameter("pwd"));
			vo.setContent(request.getParameter("content"));
		} catch (Exception ex) { ex.printStackTrace(); }
		
		return vo;
	}
	
	private List<GuestBookVo> list (String search, int nowPage) {
		GuestBookDao dao = new GuestBookDaoImpl();
		List<GuestBookVo> list = dao.list(search, nowPage);
		
		return list;
	}
	
	private GuestBookVo search (int serial) {
		GuestBookDao dao = new GuestBookDaoImpl();
		GuestBookVo vo = dao.select(serial);
		
		return vo;
	}

}
