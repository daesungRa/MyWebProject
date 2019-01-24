package com.myweb.guestbookDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;

import com.myweb.guestbookBean.GuestBookVo;
import com.myweb.memberBean.DBConn;

public class GuestBookDaoImpl implements GuestBookDao {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public GuestBookDaoImpl() {
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

	@Override
	public boolean insert(GuestBookVo vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public GuestBookVo select(int serial) {
		GuestBookVo vo = null;
		final String sql = " select * from guestbook where serial = ? ";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, serial);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				vo = new GuestBookVo();
				vo.setSerial(serial);
				vo.setId(rs.getString("id"));
				vo.setPwd(rs.getString("pwd"));
				vo.setContent(rs.getString("content"));
				vo.setmDate(rs.getString("mdate"));				
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

	@Override
	public boolean modify(GuestBookVo vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(GuestBookVo vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Map<String, GuestBookVo> list(String search, int nowPage) {
		// TODO Auto-generated method stub
		return null;
	}

}
