package myBatis;

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
	
	public static void main(String[] args) {
		new MybatisMemberDao();
	}
}
