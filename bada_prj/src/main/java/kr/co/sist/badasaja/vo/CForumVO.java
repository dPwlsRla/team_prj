package kr.co.sist.badasaja.vo;

public class CForumVO {

	private String cfNum, cID, pCode, cfTopic, local, cfMain, writeDate, cfStatus, mainImg;

	public CForumVO() {
		// TODO Auto-generated constructor stub
	}

	public CForumVO(String cfNum, String cID, String pCode, String cfTopic, String local, String cfMain,
			String writeDate, String cfStatus, String mainImg) {
		this.cfNum = cfNum;
		this.cID = cID;
		this.pCode = pCode;
		this.cfTopic = cfTopic;
		this.local = local;
		this.cfMain = cfMain;
		this.writeDate = writeDate;
		this.cfStatus = cfStatus;
		this.mainImg = mainImg;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
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
