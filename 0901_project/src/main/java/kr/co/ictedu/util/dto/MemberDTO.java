package kr.co.ictedu.util.dto;

public class MemberDTO {

	private String mno;
	private String mid;
	private String mpwd;
	private String mtel;
	private String memail;
	private String mdate;
	private String mnick;
	private String role;
	private String mstatus;

	private String infoch;
	private String smsch;
	private String emailch;
	private String mtel1;
	private String mtel2;
	private String mtel3;

	private String post_code;
	private String maddr1;
	private String maddr2;
	
	public String toString() {
		return mno + " : " + mid;
	}
	
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	
	public String getMnick() {
		return mnick;
	}
	public void setMnick(String mnick) {
		this.mnick = mnick;
	}
	public String getMpwd() {
		return mpwd;
	}
	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	public String getMemail() {
		return memail;
	}
	public String getMstatus() {
		return mstatus;
	}
	public void setMstatus(String mstatus) {
		this.mstatus = mstatus;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public String getInfoch() {
		return infoch;
	}
	public void setInfoch(String infoch) {
		this.infoch = infoch;
	}
	public String getSmsch() {
		return smsch;
	}
	public void setSmsch(String smsch) {
		this.smsch = smsch;
	}
	public String getEmailch() {
		return emailch;
	}
	public void setEmailch(String emailch) {
		this.emailch = emailch;
	}
	public String getMtel1() {
		return mtel1;
	}
	public void setMtel1(String mtel1) {
		this.mtel1 = mtel1;
	}
	public String getMtel2() {
		return mtel2;
	}
	public void setMtel2(String mtel2) {
		this.mtel2 = mtel2;
	}
	public String getMtel3() {
		return mtel3;
	}
	public void setMtel3(String mtel3) {
		this.mtel3 = mtel3;
	}
	public String getPost_code() {
		return post_code;
	}
	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}
	public String getMaddr1() {
		return maddr1;
	}
	public void setMaddr1(String maddr1) {
		this.maddr1 = maddr1;
	}
	public String getMaddr2() {
		return maddr2;
	}
	public void setMaddr2(String maddr2) {
		this.maddr2 = maddr2;
	}

}//class

/*
 * DTO의 종류
 * 1. Table DTO : 테이블 컬럼과 동일한 변수를 갖는 DTO
 * 2. View DTO : 화면 요소와 동일한 변수를 갖는 DTO
 * 3. Composite DTO : 복합적인 변수를 갖는 DTO
 * -> 결론은 개발자 맘대로 만드시면 되요.
 */
