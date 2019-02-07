package com.myweb.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardServlet
 */
@WebServlet("*.brd")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public BoardServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		String url = "index.jsp?aside=/index_board.jsp&content=/views/board/";
		String page = request.getRequestURI();
		page = page.substring(page.lastIndexOf("/") + 1, page.lastIndexOf("."));
		System.out.println("요청 페이지: " + page);
		
		switch (page) {
		case "list":
			String search = "";
			int nowPage = 1;
			
			System.out.println("method: " + request.getMethod());
			if (request.getMethod().equals("GET")) {
				url += page + ".jsp";
			} else {
				MultipartRequest multi = new MultipartRequest(request, "D:/1806_Ra/git/MyWebProject/WebContent/images/upLoad/");
				System.out.println("search: " + multi.getParameter("search"));
				System.out.println("nowPage: " + multi.getParameter("nowPage"));
				
				search = multi.getParameter("search");
				try {
					nowPage = Integer.parseInt(multi.getParameter("nowPage"));
				} catch (Exception ex) { ex.printStackTrace(); }

				url = "/views/board/list.jsp";
			}
			
			BoardDao dao = new BoardDao();
			List<BoardVo> list = dao.list(search, nowPage);
			
			// 검색어 현재페이지 보존
			request.setAttribute("search", search);
			request.setAttribute("nowPage", nowPage);
			// 페이징 요소 객체
			request.setAttribute("pageDto", dao.pageDto);
			// list 검색 결과
			request.setAttribute("list", list);
			
			break;
		case "view":
			
			break;
		case "insert":
			
			url = "/views/board/insert.jsp";
			break;
		case "insertR":
			
			break;
		case "modify":
			
			break;
		case "delete":
			
			break;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
