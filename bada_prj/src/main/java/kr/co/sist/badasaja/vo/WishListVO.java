package kr.co.sist.badasaja.vo;

public class WishListVO {

	private String cfNum, cID, wishDate;
	private char wishStatus;

	public WishListVO() {
		// TODO Auto-generated constructor stub
	}

	public WishListVO(String cfNum, String cID, String wishDate, char wishStatus) {
		super();
		this.cfNum = cfNum;
		this.cID = cID;
		this.wishDate = wishDate;
		this.wishStatus = wishStatus;
	}

	public String getCfNum() {
		return cfNum;
	}

	public void setCfNum(String cfNum) {
		this.cfNum = cfNum;
	}

	public String getcID() {
		return cID;
	}

	public void setcID(String cID) {
		this.cID = cID;
	}

	public String getWishDate() {
		return wishDate;
	}

	public void setWishDate(String wishDate) {
		this.wishDate = wishDate;
	}

	public char getWishStatus() {
		return wishStatus;
	}

	public void setWishStatus(char wishStatus) {
		this.wishStatus = wishStatus;
	}

	@Override
	public String toString() {
		return "WishListVO [cfNum=" + cfNum + ", cID=" + cID + ", wishDate=" + wishDate + ", wishStatus=" + wishStatus
				+ "]";
	}
}
