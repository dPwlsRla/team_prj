package kr.co.sist.badasaja.vo;

public class MyPostBoardVO {
	
	private String cfNum, cID, cfTopic, writeDate, mainImg,
				buyerID, nickname, cfStatus;

	public MyPostBoardVO() {
	}

	public MyPostBoardVO(String cfNum, String cID, String cfTopic, String writeDate, String mainImg, String buyerID,
			String nickname, String cfStatus) {
		this.cfNum = cfNum;
		this.cID = cID;
		this.cfTopic = cfTopic;
		this.writeDate = writeDate;
		this.mainImg = mainImg;
		this.buyerID = buyerID;
		this.nickname = nickname;
		this.cfStatus = cfStatus;
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

	public String getCfTopic() {
		return cfTopic;
	}

	public void setCfTopic(String cfTopic) {
		this.cfTopic = cfTopic;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getMainImg() {
		return mainImg;
	}

	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}

	public String getBuyerID() {
		return buyerID;
	}

	public void setBuyerID(String buyerID) {
		this.buyerID = buyerID;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getCfStatus() {
		return cfStatus;
	}

	public void setCfStatus(String cfStatus) {
		this.cfStatus = cfStatus;
	}

	@Override
	public String toString() {
		return "MyPostBoardVO [cfNum=" + cfNum + ", cID=" + cID + ", cfTopic=" + cfTopic + ", writeDate=" + writeDate
				+ ", mainImg=" + mainImg + ", buyerID=" + buyerID + ", nickname=" + nickname + ", cfStatus=" + cfStatus
				+ "]";
	}
	

}//class
