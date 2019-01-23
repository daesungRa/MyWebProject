package com.myweb.memberDao;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.myweb.memberBean.DBConn;
import com.myweb.memberBean.MemberVo;

public class MemberDao {
	
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	/*
	 * paging variables
	 */
	public int listSize = 5;
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
	
	/*
	 * file upload path
	 */
	private String upLoad = "D:/1806_Ra/git/MyWebProject/WebContent/images/upLoad/";
	
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
				vo.setPhotoOri(rs.getString("photoOri"));
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
			// Member 테이블, 총 11 개 컬럼
			final String sql = " insert into member (id, name, pwd, email, phone, postal, address, photo, photoOri, grade) "
								+ "	values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getIrum());
			ps.setString(3, vo.getPwd());
			ps.setString(4, vo.getEmail());
			ps.setString(5, vo.getPhone());
			ps.setString(6, vo.getPostal());
			ps.setString(7, vo.getAddress());
			ps.setString(8, vo.getPhoto()); // 실제 시스템에 저장되는 파일명
			ps.setString(9, vo.getPhotoOri()); // 사용자에게 보여지는 오리지날 파일명
			ps.setInt(10, vo.getGrade());
			
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
		String photo = null;
		int cnt = 0;
		
		try {
			conn = new DBConn().getConn();
			// upLoad 폴더에 존재하는 기존 파일 삭제를 위해 일단 기존 파일명 얻어옴
			String sql = " select photo from member where id = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			rs = ps.executeQuery();
			if (rs.next()) {
				photo = rs.getString("photo");
			}
			rs.close();
			ps.close();
			
			if (vo.getPhoto() == null) {
				sql = " update member set name = ?, email = ?, phone = ?, postal = ?, "
						+ "	address = ?, grade = ? "
						+ "	where id = ? and pwd = ? ";
				ps = conn.prepareStatement(sql);
				ps.setString(1, vo.getIrum());
				ps.setString(2, vo.getEmail());
				ps.setString(3, vo.getPhone());
				ps.setString(4, vo.getPostal());
				ps.setString(5, vo.getAddress());
				ps.setInt(6, vo.getGrade());
				ps.setString(7, vo.getId());
				ps.setString(8, vo.getPwd());
				
				cnt = ps.executeUpdate();
				
				if (cnt > 0) {
					result = true;
				}
			} else {
				// 아이디, 최초등록일은 수정 불가
				// 비번은 확인용이고, 비번변경은 추가 페이지에서 처리
				sql = " update member set name = ?, email = ?, phone = ?, postal = ?, "
						+ "	address = ?, photo = ?, photoOri = ?, grade = ? "
						+ "	where id = ? and pwd = ? ";
				ps = conn.prepareStatement(sql);
				ps.setString(1, vo.getIrum());
				ps.setString(2, vo.getEmail());
				ps.setString(3, vo.getPhone());
				ps.setString(4, vo.getPostal());
				ps.setString(5, vo.getAddress());
				ps.setString(6, vo.getPhoto());
				ps.setString(7, vo.getPhotoOri());
				ps.setInt(8, vo.getGrade());
				ps.setString(9, vo.getId());
				ps.setString(10, vo.getPwd());
				
				cnt = ps.executeUpdate();
				
				if (cnt > 0) {
					result = true;
					
					File file = new File(upLoad + photo);
					if (file.exists()) {
						System.out.println("기존 파일을 삭제합니다");
						file.delete();
					} else {
						System.out.println("기존 파일이 없습니다");
					}
				}
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
	
	public boolean delete (MemberVo vo) {
		boolean b = false;
		int cnt = 0;
		
		/*try {
			final String sql = " delete from member where id = ? and pwd = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPwd());
			cnt = ps.executeUpdate();
			
			if (cnt > 0) {
				result = true;
				File file = new File(folder + vo.getPhoto());
				if (file.exists()) file.delete();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}*/
		
		String sqlSearchPw = " select pwd from member where id = ? ";
		String sqlDelete = " delete from member where id = ? ";
		String pw = null;
		
		// 암호 확인
		try {
			ps = conn.prepareStatement(sqlSearchPw);
			ps.setString(1, vo.getId());
			rs = ps.executeQuery();
			
			if (rs.next()) {
				pw = rs.getString("pwd");
			}
			
			rs.close();
			ps.close();
			
			// 암호가 일치하면 삭제 작업 수행
			if (pw.equals(vo.getPwd())){
				System.out.println("암호가 일치합니다");
				ps = conn.prepareStatement(sqlDelete);
				ps.setString(1, vo.getId());
				cnt = ps.executeUpdate();
				
				if (cnt > 0) {
					b = true;
					File file = new File(upLoad + vo.getPhoto());
					if (file.exists()) file.delete();
				}
			} else {
				System.out.println("암호가 일치하지 않습니다");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				closeSet();
			} catch (Exception ex) { }
		}
		
		return b;
	}
	
	public List<MemberVo> list (String findStr, int startNum, int lastNum) {
		List<MemberVo> memberList = new ArrayList<MemberVo>();
		
		try {
			// 아이디, 최초등록일은 수정 불가
			// 비번은 확인용이고, 비번변경은 추가 페이지에서 처리
			final String sql = " select * from ( "
								+ "		select rownum rno, s.* from ( "
								+ "			select * from member where id like ? or name like ? or phone like ? "
								+ "			order by name "
								+ "		) s "
								+ "	) where rno between ? and ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");
			ps.setString(3, "%" + findStr + "%");
			ps.setInt(4, startNum);
			ps.setInt(5, lastNum);
			
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
	
	// 목적 페이지 넘버만 받아서 그것에 해당하는 rno 를 알아서 계산해서 반환함
	/*public Map<String, MemberVo> listAll (int pageNo) {
		Map<String, MemberVo> memberMap = new HashMap<String, MemberVo>();
		// pageNo 에 따른 rno 계산
		// page		: 1, 2, 3, 4,  5,  6,  7
		// startNo	: 1, 4, 7, 10, 13, 16, 19
		// 차이		: 0, 2, 4, 6,  8,  10, 12
		int startNo = pageNo + (2 * (pageNo - 1));
		int lastNo = startNo + 2;
		
		try {
			// 아이디, 최초등록일은 수정 불가
			// 비번은 확인용이고, 비번변경은 추가 페이지에서 처리
			final String sql = " select * from ( "
								+ "		select rownum rno, s.* from ( "
								+ "			select * from member "
								+ "			order by name "
								+ "		) s "
								+ "	) where rno between ? and ? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, startNo);
			ps.setInt(2, lastNo);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				MemberVo vo = new MemberVo();
				vo.setId(rs.getString("id"));
				vo.setIrum(rs.getString("name"));
				vo.setPhone(rs.getString("phone"));
				vo.setEmail(rs.getString("email"));
				
				memberMap.put(String.valueOf(rs.getInt("rno")), vo);
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				closeSet();
			} catch (Exception ex) { }
		}
		
		return memberMap;
	}*/
	public Map<String, MemberVo> listAll (String search, int nowPage) {
		this.nowPage = nowPage;
		pageCompute(search);
		
		Map<String, MemberVo> memberMap = new HashMap<String, MemberVo>();
		// pageNo 에 따른 rno 계산
		// page		: 1, 2, 3, 4,  5,  6,  7
		// startNo	: 1, 4, 7, 10, 13, 16, 19
		// 차이		: 0, 2, 4, 6,  8,  10, 12
		// int startNo = pageNo + (2 * (pageNo - 1));
		// int lastNo = startNo + 2;
		
		try {
			// 아이디, 최초등록일은 수정 불가
			// 비번은 확인용이고, 비번변경은 추가 페이지에서 처리
			final String sql = " select * from ( "
								+ "		select rownum rno, s.* from ( "
								+ "			select * from member "
								+ "			order by name "
								+ "		) s "
								+ "	) where rno between ? and ? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, startNo);
			ps.setInt(2, endNo);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				MemberVo vo = new MemberVo();
				vo.setId(rs.getString("id"));
				vo.setIrum(rs.getString("name"));
				vo.setPhone(rs.getString("phone"));
				vo.setEmail(rs.getString("email"));
				
				memberMap.put(String.valueOf(rs.getInt("rno")), vo);
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				closeSet();
			} catch (Exception ex) { }
		}
		
		return memberMap;
	}
	
	public void pageCompute (String search) {
		try {
			final String sql = " select count(*) cnt from member ";
			ps = conn.prepareStatement(sql);
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
