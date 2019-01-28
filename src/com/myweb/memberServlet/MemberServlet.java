package com.myweb.memberServlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.memberBean.MemberVo;
import com.myweb.memberDao.MemberDao;

/**
 * Servlet implementation class MemberServlet
 */
@WebServlet("*.mb")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberDao dao;
	private MemberVo vo;
    
    public MemberServlet() {
        super();
    }

	/**
	 * doGet
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * doPost
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset-utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String url = "index.jsp";
		String page = request.getRequestURI();
		page = page.substring(page.lastIndexOf("/") + 1, page.lastIndexOf("."));
		System.out.println("page: " + page);
		
		switch (page) {
		case "login":
			vo = getVo(request);
			this.dao = new MemberDao();
			MemberVo result = dao.login(vo);
			
			if (result != null) {
				request.getSession().setAttribute("id", result.getId());
				request.getSession().setAttribute("name", result.getIrum());
				request.setAttribute("msg", "로그인 성공");
				page = "";
				System.out.println("로그인 성공");
			} else {
				request.setAttribute("msg", "로그인 실패");
				page = "?content=./views/member/login.jsp";
				System.out.println("로그인 실패");
			}
			
			break;
		case "findId":
			vo = getVo(request);
			dao = new MemberDao();
			vo = dao.view2(vo);
			request.setAttribute("findResultId", vo.getId());
			System.out.println("findResultId: " + request.getAttribute("findResultId"));
			
			page = "?content=./views/member/findId.jsp";
			break;
		case "findPwd":
			vo = getVo(request);
			dao = new MemberDao();
			vo = dao.view2(vo);
			request.setAttribute("findResultPwd", vo.getPwd());
			System.out.println("findResultPwd: " + request.getAttribute("findResultPwd"));
			
			page = "?content=./views/member/findPwd.jsp";
			break;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url + page);
		dispatcher.forward(request, response);
	}
	
	private MemberVo getVo (HttpServletRequest request) {
		MemberVo vo = new MemberVo();
		vo.setId(request.getParameter("id"));
		vo.setIrum(request.getParameter("irum"));
		vo.setPwd(request.getParameter("pwd"));
		vo.setEmail(request.getParameter("email"));
		vo.setPhone(request.getParameter("phone"));
		vo.setPostal(request.getParameter("postal"));
		vo.setAddress(request.getParameter("address"));
		vo.setPhoto(request.getParameter("photo"));
		try {
			vo.setGrade(Integer.parseInt(request.getParameter("grade")));
		} catch (Exception ex) { System.out.println("grade 파라미터가 없거나 정수형이 아닙니다"); }
		
		return vo;
	}

}
