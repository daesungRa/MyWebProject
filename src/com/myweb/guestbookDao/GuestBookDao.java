package com.myweb.guestbookDao;

import java.util.List;
import com.myweb.guestbookBean.GuestBookVo;

public interface GuestBookDao {
	
	/*
	 * paging variables
	 */
	public int listSize = -1;
	public int blockSize = -1;
	public int nowPage = -1;
	
	public int totSize = -1;
	public int totPage = -1;
	public int totBlock = -1;
	public int nowBlock = -1;
	public int endNo = -1;
	public int startNo = -1;
	public int endPage = -1;
	public int startPage = -1;
	
	public boolean insert (GuestBookVo vo);
	public GuestBookVo select (int serial);
	public boolean modify (GuestBookVo vo);
	public boolean delete (GuestBookVo vo);
	public List<GuestBookVo> list (String search, int nowPage);
	
}
