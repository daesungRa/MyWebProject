package myBatis;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import com.myweb.memberBean.MemberVo;

public class MybatisMemberDao {
	private SqlSession sqlSession;
	HttpServletRequest request;
	
	public MybatisMemberDao () {
		sqlSession = MemberFactory.getFactory().openSession();
		
		if (sqlSession == null) {
			System.out.println("sqlSession 생성 중 오류 발생");
		} else {
			System.out.println("sqlSession 생성 성공");
		}
	}
	
	public MybatisMemberDao (HttpServletRequest request) {
		this();
		this.request = request;
	}
	
	public void select (String id) {
		MemberVo vo = null;
		
		if (sqlSession != null) {
			try {
				vo = (MemberVo) sqlSession.selectOne("member.selectId", id);
				this.request.setAttribute("vo", vo);
			} catch (Exception ex) { ex.printStackTrace(); }
		} else {
			System.out.println("sqlSession 이 없습니다");
		}
		
	}
	
	public void login () {
		try {
			MemberVo vo = new MemberVo();
			vo.setId(request.getParameter("id"));
			vo.setPwd(request.getParameter("pwd"));
			
			boolean b = sqlSession.selectOne("member.login", vo);
			request.setAttribute("vo", vo);
			request.setAttribute("login", b);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public void getMemberList () {
		List<MemberVo> memberList = null;
		
		try {
			String search = "";
			if (request.getParameter("search") != null) {
				search = request.getParameter("search");
			}
			memberList = sqlSession.selectList("member.memberList", search);
			request.setAttribute("memberList", memberList);
		} catch (Exception ex) { ex.printStackTrace(); }
	}
	
	public static void main(String[] args) {
		new MybatisMemberDao();
	}
}
