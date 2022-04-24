package kr.co.sist.badasaja.vo;

public class AdForumVO { 

	private String afNum, aID, pCode, local, afTopic, afMain, postedDate, expiryDate, afStatus, mainImg, type;
	private int afCost;

	public AdForumVO() {
		// TODO Auto-generated constructor stub
	}

	public AdForumVO(String afNum, String aID, String pCode, String local, String afTopic, String afMain,
			String postedDate, String expiryDate, String afStatus, String mainImg, String type, int afCost) {
		this.afNum = afNum;
		this.aID = aID;
		this.pCode = pCode;
		this.local = local;
		this.afTopic = afTopic;
		this.afMain = afMain;
		this.postedDate = postedDate;
		this.expiryDate = expiryDate;
		this.afStatus = afStatus;
		this.mainImg = mainImg;
		this.type = type;
		this.afCost = afCost;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}

	public String getAfNum() {
		return afNum;
	}

	public void setAfNum(String afNum) {
		this.afNum = afNum;
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

	public String getAfTopic() {
		return afTopic;
	}

	public void setAfTopic(String afTopic) {
		this.afTopic = afTopic;
	}

	public String getAfMain() {
		return afMain;
	}

	public void setAfMain(String afMain) {
		this.afMain = afMain;
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

	public String getAfStatus() {
		return afStatus;
	}

	public void setAfStatus(String afStatus) {
		this.afStatus = afStatus;
	}

	public String getMainImg() {
		return mainImg;
	}

	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getAfCost() {
		return afCost;
	}

	public void setAfCost(int afCost) {
		this.afCost = afCost;
	}

}
