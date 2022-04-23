package kr.co.sist.badasaja.vo;

public class NoticeVO {
	private String nNum, oMain, postedDate;
	
	public NoticeVO() {
		// TODO Auto-generated constructor stub
	}

	public NoticeVO(String nNum, String oMain, String postedDate) {
		this.nNum = nNum;
		this.oMain = oMain;
		this.postedDate = postedDate;
	}

	public String getnNum() {
		return nNum;
	}

	public void setnNum(String nNum) {
		this.nNum = nNum;
	}

	public String getoMain() {
		return oMain;
	}

	public void setoMain(String oMain) {
		this.oMain = oMain;
	}

	public String getPostedDate() {
		return postedDate;
	}

	public void setPostedDate(String postedDate) {
		this.postedDate = postedDate;
	}
	
}
