package com.myweb.guestbookDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
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
	public int listSize = 10;
	public int blockSize = 5;
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
		} finally {
			try {
				closeSet();
			} catch (Exception ex) { }
		}
		
		return vo;
	}

	@Override
	public boolean update(GuestBookVo vo) {
		boolean b = true;
		
		return b;
	}

	@Override
	public boolean delete(int serial) {
		boolean b = false;
		return b;
	}

	@Override
	public Map<String, GuestBookVo> list(String search, int nowPage) {
		this.nowPage = nowPage;
		pageCompute(search);
		
		Map<String, GuestBookVo> data = new HashMap<String, GuestBookVo>();
		
		try {
			final String sql = " select * from ( "
					+ "		select rownum rno, s.* from ( "
					+ "			select * from guestbook "
					+ "				where id like ? or content like ? "
					+ "				order by serial desc "
					+ "		) s "
					+ "	) where rno between ? and ? ";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, search);
			ps.setString(2, search);
			ps.setInt(3, startNo);
			ps.setInt(4, endNo);
			
			rs = ps.executeQuery();
			
			if (rs.next()) {
				GuestBookVo vo = new GuestBookVo();
				vo.setSerial(rs.getInt("serial"));
				vo.setId(rs.getString("id"));
				vo.setContent(rs.getString("content"));
				vo.setmDate(rs.getString("mdate"));
				
				data.put(String.valueOf(vo.getSerial()), vo);
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
