package kr.co.sist.badasaja.vo;

public class CForumVO {

	private String cfNum, cID, pCode, cfTopic, 
			cfMain, writeDate, cfStatus, mainImg;
	
	public CForumVO() {
		// TODO Auto-generated constructor stub
	}

	public CForumVO(String cfNum, String cID, String pCode, String cfTopic, String cfMain, String writeDate,
			String cfStatus, String mainImg) {
		this.cfNum = cfNum;
		this.cID = cID;
		this.pCode = pCode;
		this.cfTopic = cfTopic;
		this.cfMain = cfMain;
		this.writeDate = writeDate;
		this.cfStatus = cfStatus;
		this.mainImg = mainImg;
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

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getCfTopic() {
		return cfTopic;
	}

	public void setCfTopic(String cfTopic) {
		this.cfTopic = cfTopic;
	}

	public String getCfMain() {
		return cfMain;
	}

	public void setCfMain(String cfMain) {
		this.cfMain = cfMain;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getCfStatus() {
		return cfStatus;
	}

	public void setCfStatus(String cfStatus) {
		this.cfStatus = cfStatus;
	}

	public String getMainImg() {
		return mainImg;
	}

	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}
	
}
