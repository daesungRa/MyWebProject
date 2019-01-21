package com.myweb.memberDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.myweb.memberBean.DBConn;
import com.myweb.memberBean.MemberVo;

public class MemberDao {
	
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	public MemberDao () {
		this.conn = new DBConn().getConn();		
	}
	
	private void closeSet () {
		try {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	// 해당하는 아이디만 select
	public MemberVo view (String id) {
		MemberVo vo = null;

		try {
			final String sql = " select * from member where id = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				vo = new MemberVo();
				vo.setId(rs.getString("id"));
				vo.setIrum(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setPhone(rs.getString("phone"));
				vo.setRdate(rs.getDate("rdate").toString());
				vo.setPostal(rs.getString("postal"));
				vo.setAddress(rs.getString("address"));
				vo.setPhoto(rs.getString("photo"));
				vo.setGrade(rs.getInt("grade"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				closeSet();
			} catch (Exception ex) { }
		}

		return vo;
	}
	
	// 비번까지 체크
	public MemberVo login (MemberVo vo) {
		MemberVo result = null;
		
		try {
			final String sql = " select * from member where id = ? and pwd = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPwd());
			rs = ps.executeQuery();
			
			if (rs.next()) {
				result = new MemberVo();
				result.setId(rs.getString("id"));
				result.setIrum(rs.getString("name"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				closeSet();
			} catch (Exception ex) { }
		}
		
		return result;
	}
	
	public boolean insert (MemberVo vo) {
		boolean result = false;
		int cnt = 0;
		
		try {
			final String sql = " insert into member (id, name, pwd, email, phone, postal, address, photo, grade) "
								+ "	values (?, ?, ?, ?, ?, ?, ?, ?, ?) ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getIrum());
			ps.setString(3, vo.getPwd());
			ps.setString(4, vo.getEmail());
			ps.setString(5, vo.getPhone());
			ps.setString(6, vo.getPostal());
			ps.setString(7, vo.getAddress());
			ps.setString(8, vo.getPhoto());
			ps.setInt(9, vo.getGrade());
			
			cnt = ps.executeUpdate();
			
			if (cnt > 0) result = true;
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				closeSet();
			} catch (Exception ex) { }
		}

		return result;
	}
	
	public boolean modify (MemberVo vo) {
		boolean result = false;
		int cnt = 0;
		
		try {
			conn = new DBConn().getConn();
			// 아이디, 최초등록일은 수정 불가
			// 비번은 확인용이고, 비번변경은 추가 페이지에서 처리
			final String sql = " update member set name = ?, email = ?, phone = ?, postal = ?, "
								+ "	address = ?, photo = ?, grade = ? "
								+ "	where id = ? and pwd = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getIrum());
			ps.setString(2, vo.getEmail());
			ps.setString(3, vo.getPhone());
			ps.setString(4, vo.getPostal());
			ps.setString(5, vo.getAddress());
			ps.setString(6, vo.getPhoto());
			ps.setInt(7, vo.getGrade());
			ps.setString(8, vo.getId());
			ps.setString(9, vo.getPwd());
			
			cnt = ps.executeUpdate();
			
			if (cnt > 0) result = true;
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				closeSet();
			} catch (Exception ex) { }
		}
		
		return result;
	}
	
	public boolean delete (MemberVo vo) {
		boolean result = false;
		
		return result;
	}
	
	public List<MemberVo> list (String findStr) {
		List<MemberVo> memberList = new ArrayList<MemberVo>();
		
		try {
			// 아이디, 최초등록일은 수정 불가
			// 비번은 확인용이고, 비번변경은 추가 페이지에서 처리
			final String sql = " select * from member where id like ? or name like ? or phone like ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");
			ps.setString(3, "%" + findStr + "%");
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				MemberVo vo = new MemberVo();
				vo.setId(rs.getString("id"));
				vo.setIrum(rs.getString("name"));
				vo.setPhone(rs.getString("phone"));
				vo.setEmail(rs.getString("email"));
				
				memberList.add(vo);
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				closeSet();
			} catch (Exception ex) { }
		}
		
		return memberList;
	}
	
	public List<MemberVo> listAll () {
		List<MemberVo> memberList = new ArrayList<MemberVo>();
		
		try {
			// 아이디, 최초등록일은 수정 불가
			// 비번은 확인용이고, 비번변경은 추가 페이지에서 처리
			final String sql = " select * from member ";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				MemberVo vo = new MemberVo();
				vo.setId(rs.getString("id"));
				vo.setIrum(rs.getString("name"));
				vo.setPhone(rs.getString("phone"));
				vo.setEmail(rs.getString("email"));
				
				memberList.add(vo);
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				closeSet();
			} catch (Exception ex) { }
		}
		
		return memberList;
	}
	
}
