package com.myweb.ajaxServlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AjaxServlet
 */
@WebServlet("*.ax")
public class AjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AjaxServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String url = "index.jsp?aside=/index_ajax.jsp&content=/views/ajax/";
		String page = request.getRequestURI();
		page = page.substring(1, page.lastIndexOf("."));
		System.out.println("요청 페이지: " + url + page + ".jsp");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url + page + ".jsp");
		dispatcher.forward(request, response);
	}

}
