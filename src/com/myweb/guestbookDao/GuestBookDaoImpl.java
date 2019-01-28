package com.myweb.guestbookDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.myweb.guestbookBean.GuestBookVo;
import com.myweb.memberBean.DBConn;

public class GuestBookDaoImpl implements GuestBookDao {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	/*
	 * paging variables
	 */
	public int listSize;
	public int blockSize;
	public int nowPage;
	
	public int totSize;
	public int totPage;
	public int totBlock;
	public int nowBlock;
	public int endNo;
	public int startNo;
	public int endPage;
	public int startPage;
	
	public GuestBookDaoImpl() {
		this.listSize = 3;
		this.blockSize = 5;
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
		boolean b = true;
		final String sql = " insert into guestbook (serial, id, pwd, content) "
							+ "	values (seq_guestbook.nextval, ?, ?, ?) ";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getContent());
			int result = ps.executeUpdate();
			
			if (result > 0) {
			b = true;
				System.out.println("insert success!");
			} else {
				System.out.println("insert fail");
			}
		
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return b;
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
		}
		
		return vo;
	}

	@Override
	public boolean modify(GuestBookVo vo) {
		boolean b = true;
		final String sql = " update guestbook set content = ? where serial = ? ";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getContent());
			ps.setInt(2, vo.getSerial());
			int result = ps.executeUpdate();
			
			if (result > 0) {
				b = true;
				System.out.println("modify success!");
			} else {
				System.out.println("modify fail");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return b;
	}

	@Override
	public boolean delete(GuestBookVo vo) {
		boolean b = false;
		final String sql = " delete from guestbook where serial = ? and pwd = ? ";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getSerial());
			ps.setString(2, vo.getPwd());
			int result = ps.executeUpdate();
			
			if (result > 0) {
				b = true;
				System.out.println("삭제 성공!");
			} else {
				System.out.println("삭제 실패");
			}
		} catch (SQLException se) {
			
		}
		return b;
	}

	@Override
	public List<GuestBookVo> list(String search, int nowPage) {
		this.nowPage = nowPage;
		pageCompute(search);
		
		List<GuestBookVo> data = new ArrayList<GuestBookVo>();
		
		try {
			final String sql = " select * from ( "
					+ "		select rownum rno, s.* from ( "
					+ "			select * from guestbook "
					+ "				where id like ? or content like ? "
					+ "				order by serial desc "
					+ "		) s "
					+ "	) where rno between ? and ? ";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + search + "%");
			ps.setString(2, "%" + search + "%");
			ps.setInt(3, startNo);
			ps.setInt(4, endNo);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				GuestBookVo vo = new GuestBookVo();
				vo.setSerial(rs.getInt("serial"));
				vo.setId(rs.getString("id"));
				vo.setContent(rs.getString("content"));
				vo.setmDate(rs.getString("mdate"));
				
				data.add(vo);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				closeSet();
			} catch (Exception ex) { }
		}
		
		return data;
	}

	public void pageCompute (String search) {
		try {
			String sql = "";
			
			// null 이거나 빈 문자열이면 전체 검색
			if (search == null || search.equals("")) {
				sql = " select count(*) cnt from guestbook ";
				ps = conn.prepareStatement(sql);
			} else {
				sql = " select count(*) cnt from guestbook "
						+ "	where id like ? or content like ? ";
				ps = conn.prepareStatement(sql);
				ps.setString(1, "%" + search + "%");
				ps.setString(2, "%" + search + "%");
			}
			rs = ps.executeQuery();
			System.out.println("pageCompute 실행");
			
			if (rs.next()) {
				totSize = rs.getInt("cnt");
				totPage = (int) Math.ceil(totSize / (double)listSize);
				totBlock = (int) Math.ceil(totPage / (double)blockSize);
				nowBlock = (int) Math.ceil(nowPage / (double)blockSize);
				
				endNo = nowPage * listSize;
				startNo = endNo - listSize + 1;
				if (endNo > totSize) endNo = totSize;
				
				endPage = nowBlock * blockSize;
				startPage = endPage - blockSize + 1;
				if (endPage > totPage) endPage = totPage;
			}
			
			System.out.println("listSize: " + listSize);
			System.out.println("blockSize: " + blockSize);
			System.out.println("nowPage: " + nowPage);
			System.out.println("totSize: " + totSize);
			System.out.println("totPage: " + totPage);
			System.out.println("totBlock: " + totBlock);
			System.out.println("nowBlock: " + nowBlock);
			System.out.println("endNo: " + endNo);
			System.out.println("startNo: " + startNo);
			System.out.println("endPage: " + endPage);
			System.out.println("startPage: " + startPage);
			System.out.println("===========================");
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
}
