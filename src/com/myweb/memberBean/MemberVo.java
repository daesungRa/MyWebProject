package com.myweb.memberBean;

public class MemberVo {
	private String id;
	private String irum;
	private String pwd;
	private String email;
	private String phone;
	private String rdate;
	private String postal;
	private String address;
	private String photo;
	private String photoOri;
	private int grade;

	private String search;
	private int nowPage;

	/*
	 * ===== constructor =====
	 */
	public MemberVo() {
	}

	public MemberVo(String id, String irum, String pwd, String email, String phone, String rdate, String postal,
			String address, String photo, String photoOri, int grade) {
		this.id = id;
		this.irum = irum;
		this.pwd = pwd;
		this.email = email;
		this.phone = phone;
		this.rdate = rdate;
		this.postal = postal;
		this.address = address;
		this.photo = photo;
		this.photoOri = photoOri;
		this.grade = grade;
	}

	/*
	 * Override method
	 */
	@Override
	public boolean equals(Object obj) {
		boolean flag = false;

		if (obj instanceof MemberVo) {
			MemberVo vo = (MemberVo) obj;
			if (vo.getId().equals(this.id) && vo.getIrum().equals(this.irum)) {
				flag = true;
			}
		}
		return flag;
	}

	@Override
	public int hashCode() {
		// id 와 name 의 해시코드 더한 값
		int code = id.hashCode() + irum.hashCode();
		return code;
	}

	/*
	 * ===== getter & setter =====
	 */
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIrum() {
		return irum;
	}

	public void setIrum(String irum) {
		this.irum = irum;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getPostal() {
		return postal;
	}

	public void setPostal(String postal) {
		this.postal = postal;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getPhotoOri() {
		return photoOri;
	}

	public void setPhotoOri(String photoOri) {
		this.photoOri = photoOri;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public String toJson() {
		return "MemberVo [id=" + id + ", irum=" + irum + ", pwd=" + pwd + ", email=" + email + ", phone=" + phone
				+ ", rdate=" + rdate + ", postal=" + postal + ", address=" + address + ", photo=" + photo
				+ ", photoOri=" + photoOri + ", grade=" + grade + ", search=" + search + ", nowPage=" + nowPage + "]";
	}
	
	public String toListJson() {
		String str = String.format(
							"{\"id\":\"%s\","
							+ " \"irum\":\"%s\","
							+ " \"phone\":\"%s\","
							+ " \"email\":\"%s\"}", id, irum, phone, email);
		return str;
	}
	
	

}
