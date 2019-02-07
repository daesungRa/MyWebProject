package com.myweb.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.myweb.memberBean.DBConn;

public class PageDto {
	private int listSize;
	private int blockSize;
	private int nowPage;
	private int totSize;
	private int totPage;
	private int totBlock;
	private int nowBlock;
	private int startNo;
	private int endNo;
	private int startPage;
	private int endPage;
	
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	String sql = "";
	
	// constructor
	public PageDto (int listSize, int blockSize) {
		this.listSize = listSize;
		this.blockSize = blockSize;
		this.conn = new DBConn().getConn();
	}
	
	public void boardPageCompute (String search, int nowPage) {
		this.nowPage = nowPage;
		String sql = " select count(*) cnt from custom_board "
						+ "	where userId like ? or subject like ? or content like ? ";
		
		try {
			ps =conn.prepareStatement(sql);
			ps.setString(1, "%" + search + "%");
			ps.setString(2, "%" + search + "%");
			ps.setString(3, "%" + search + "%");
			rs = ps.executeQuery();
			
			if (rs.next()) {
				this.totSize = rs.getInt("cnt");
				this.totPage = (int) Math.ceil(this.totSize / (double) this.listSize);
				this.totBlock = (int) Math.ceil(this.totPage / (double) this.blockSize);
				this.nowBlock = (int) Math.ceil(this.nowPage / (double) this.blockSize);
				
				this.endNo = this.nowPage * this.listSize;
				this.startNo = this.endNo - this.listSize + 1;
				if (this.endNo > this.totSize) this.endNo = this.totSize;
				
				this.endPage = this.nowBlock * this.blockSize;
				this.startPage = this.endPage - this.blockSize + 1;
				if (this.endPage > this.totPage) this.endPage = this.totPage;
				
				/*System.out.println("listSize: " + listSize);
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
				System.out.println("===========================");*/
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (Exception ex) { ex.printStackTrace(); }
		}
	}

	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getTotSize() {
		return totSize;
	}
	public int getTotPage() {
		return totPage;
	}
	public int getTotBlock() {
		return totBlock;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public int getStartNo() {
		return startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public int getStartPage() {
		return startPage;
	}
	public int getEndPage() {
		return endPage;
	}
}
