package com.myweb.ajaxServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ajax.dao.DeptVo;
import ajax.dao.EmpDao;
import ajax.dao.EmpVo;

/**
 * Servlet implementation class EmpServlet
 */
@WebServlet("*.emp")
public class EmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public EmpServlet() {
        super();
    }

	/**
	 * doGet
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * doPost
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String jsonResult = "";

		String page = request.getRequestURI();
		page = page.substring(1, page.lastIndexOf("."));
		System.out.println("page: " + page);
		
		switch (page) {
		case "getDept":
			jsonResult = "";
			jsonResult = getDept();
			System.out.println("json result: " + jsonResult);
			
			out.print(jsonResult);
			break;
		case "getEmp":
			String deptId = request.getParameter("deptId");
			System.out.println("deptId: " + deptId);
			jsonResult = "";
			jsonResult = getEmp(deptId);
			System.out.println("json result: " + jsonResult);
			
			out.write(jsonResult);
			break;
		case "getEmpInfo":
			String empId = request.getParameter("empId");
			System.out.println("empId: " + empId);
			jsonResult = "";
			jsonResult = getEmpInfo(empId);
			System.out.println("json result: " + jsonResult);
			
			out.print(jsonResult);
			break;
		}
	}

	// 부서명과 부서코드 (최초 페이지 로드될때 실행)
	public String getDept () {
		EmpDao dao = new EmpDao();
		StringBuilder sb = new StringBuilder("[");
		List<DeptVo> list = dao.getDept();
		
		for (int i = 0; i < list.size(); i++) {
			String json = list.get(i).toJson();
			sb.append(json);
			sb.append(", ");
		}
		
		String result = sb.substring(0, sb.lastIndexOf(","));
		result += "]";
		
		return result;
	}
	
	// 해당부서의 직원명과 사번 (각 부서명을 클릭하면 실행)
	public String getEmp (String deptId) {
		EmpDao dao = new EmpDao();
		StringBuilder sb = new StringBuilder("[");
		List<EmpVo> list = dao.getEmp(deptId, true);
		
		for (int i = 0; i < list.size(); i++) {
			String json = list.get(i).toJson();
			sb.append(json);
			sb.append(", ");
		}
		
		String result = sb.substring(0, sb.lastIndexOf(","));
		result += "]";
		
		return result;
	}
	
	// 해당직원의 세부정보
	public String getEmpInfo (String empId) {
		EmpDao dao = new EmpDao();
		StringBuilder sb = new StringBuilder("[");
		List<EmpVo> list = dao.getEmp(empId, false);
		
		sb.append(list.get(0).toJson());
		for (int i = 0; i < list.size(); i++) {
			String json = list.get(i).toJson();
			sb.append(", ");
			sb.append(json);
		}
		
		sb.append("]");		
		return sb.toString();
	}
	
}
