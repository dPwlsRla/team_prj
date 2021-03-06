package kr.co.sist.badasaja.vo;

public class BannerVO {

	private String bNum, aID, pCode, aURL, local, postedDate, expiryDate, img;
	private char bStatus;
	private int bCost;
	boolean bFlag;

	public BannerVO() {
		// TODO Auto-generated constructor stub
	}

	public BannerVO(String bNum, String aID, String pCode, String aURL, String local, String postedDate,
			String expiryDate, String img, char bStatus, int bCost, boolean bFlag) {
		this.bNum = bNum;
		this.aID = aID;
		this.pCode = pCode;
		this.aURL = aURL;
		this.local = local;
		this.postedDate = postedDate;
		this.expiryDate = expiryDate;
		this.img = img;
		this.bStatus = bStatus;
		this.bCost = bCost;
		this.bFlag = bFlag;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}

	public String getbNum() {
		return bNum;
	}

	public void setbNum(String bNum) {
		this.bNum = bNum;
	}

	public String getaID() {
		return aID;
	}

	public void setaID(String aID) {
		this.aID = aID;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getaURL() {
		return aURL;
	}
	
	public void setBFlag(boolean bFlag) {
		this.bFlag=bFlag;
	}
	
	public boolean getBFlag() {
		return bFlag;
	}

	public void setaURL(String aURL) {
		this.aURL = aURL;
	}

	public String getPostedDate() {
		return postedDate;
	}

	public void setPostedDate(String postedDate) {
		this.postedDate = postedDate;
	}

	public String getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public char getbStatus() {
		return bStatus;
	}

	public void setbStatus(char bStatus) {
		this.bStatus = bStatus;
	}

	public int getbCost() {
		return bCost;
	}

	public void setbCost(int bCost) {
		this.bCost = bCost;
	}

}
