package kr.co.sist.badasaja.vo;

public class NoticeVO {
	private String nNum, oMain, oID, postedDate;

	public NoticeVO() {
		// TODO Auto-generated constructor stub
	}

	public NoticeVO(String nNum, String oMain, String oID, String postedDate) {
		this.nNum = nNum;
		this.oMain = oMain;
		this.oID = oID;
		this.postedDate = postedDate;
	}

	public String getoID() {
		return oID;
	}

	public void setoID(String oID) {
		this.oID = oID;
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
