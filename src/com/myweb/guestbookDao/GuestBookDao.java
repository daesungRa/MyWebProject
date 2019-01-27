package com.myweb.guestbookDao;

import java.util.List;
import com.myweb.guestbookBean.GuestBookVo;

public interface GuestBookDao {
	public boolean insert (GuestBookVo vo);
	public GuestBookVo select (int serial);
	public boolean modify (GuestBookVo vo);
	public boolean delete (GuestBookVo vo);
	public List<GuestBookVo> list (String search, int nowPage);
}
