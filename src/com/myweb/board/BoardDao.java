package com.myweb.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.myweb.memberBean.DBConn;

public class BoardDao {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private String sql = "";
	PageDto pageDto = null;
	
	public BoardDao () {
		this.conn = new DBConn().getConn();
		this.pageDto = new PageDto(10, 5);
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
	
	public List<BoardVo> list (String search, int nowPage) {
		List<BoardVo> list = new ArrayList<BoardVo>();
		pageDto.boardPageCompute(search, nowPage); // 검색 결과 수에 따른 페이징처리
		
		sql = " select * from ( "
				+ "	select rownum rno, s.* from ( "
				+ "		select * from custom_board"
				+ "			where userId like ? or subject like ? or content like ? "
				+ "			order by gno desc, depth asc "
				+ "	) s "
				+ ") where rno between ? and ? ";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + search + "%");
			ps.setString(2, "%" + search + "%");
			ps.setString(3, "%" + search + "%");
			ps.setInt(4, pageDto.getStartNo());
			ps.setInt(5, pageDto.getEndNo());
			rs = ps.executeQuery();
			
			while (rs.next()) {
				BoardVo vo = new BoardVo();
				vo.setSerial(rs.getInt("serial"));
				vo.setGno(rs.getInt("gno"));
				vo.setPno(rs.getInt("pno"));
				vo.setDepth(rs.getInt("depth"));
				vo.setIndent(rs.getInt("indent"));
				vo.setUserId(rs.getString("userId"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setHit(rs.getInt("hit"));
				vo.setbDate(rs.getString("bDate"));
				list.add(vo);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			closeSet();
		}
		
		return list;
	}
}
