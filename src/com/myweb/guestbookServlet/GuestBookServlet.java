package com.myweb.guestbookServlet;

import java.io.IOException;
import java.io.PrintWriter;

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
@WebServlet("*.do")
public class GuestBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GuestBookServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset-utf-8");
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		out.print("OK!!");
		out.print("하하하123");
		
		String url = "/index.jsp?aside=/control.jsp&content=/views/guestbook";
		String page = request.getRequestURI();
		page = page.substring(page.lastIndexOf("/"), page.lastIndexOf("."));
		
		out.print("<br/>" + url + page + ".jsp");
		
		// servlet 을 사용하여 웹 페이지를 forward
		RequestDispatcher dispatcher = request.getRequestDispatcher(url + page + ".jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset-utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		// 검색결과인 vo 객체 생성하기
		int serial = -1;
		
		try {
			serial = Integer.parseInt(request.getParameter("serial"));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	
		GuestBookDao dao = new GuestBookDaoImpl();
		System.out.println(serial);
		GuestBookVo vo = dao.select(serial);
		request.setAttribute("vo", vo);
		
		System.out.println(vo.getId());
		System.out.println(vo.getmDate());
		System.out.println(vo.getContent());

		
		// 응답할 페이지 조립 후 forward
		String url = "/index.jsp?aside=/control.jsp&content=/views/guestbook";
		String page = request.getRequestURI();
		page = page.substring(page.lastIndexOf("/"), page.lastIndexOf("."));
	
		RequestDispatcher dispatcher = request.getRequestDispatcher(url + page + ".jsp");
		dispatcher.forward(request, response);
	}

}
