package kr.co.sist.badasaja.vo;

public class ReplyViewVO {
	
	private int replyNum;
	private String pCom, cId, replyMain, replyDate, cfNum, nickname, profile;
	
	public ReplyViewVO() {
		
	}

	public ReplyViewVO(int replyNum, String pCom, String cId, String replyMain, String replyDate, String cfNum,
			String nickname, String profile) {
		super();
		this.replyNum = replyNum;
		this.pCom = pCom;
		this.cId = cId;
		this.replyMain = replyMain;
		this.replyDate = replyDate;
		this.cfNum = cfNum;
		this.nickname = nickname;
		this.profile = profile;
	}

	public int getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

	public String getpCom() {
		return pCom;
	}

	public void setpCom(String pCom) {
		this.pCom = pCom;
	}

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}

	public String getReplyMain() {
		return replyMain;
	}

	public void setReplyMain(String replyMain) {
		this.replyMain = replyMain;
	}

	public String getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}

	public String getCfNum() {
		return cfNum;
	}

	public void setCfNum(String cfNum) {
		this.cfNum = cfNum;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	@Override
	public String toString() {
		return "ReplyViewVO [replyNum=" + replyNum + ", pCom=" + pCom + ", cId=" + cId + ", replyMain=" + replyMain
				+ ", replyDate=" + replyDate + ", cfNum=" + cfNum + ", nickname=" + nickname + ", profile=" + profile
				+ "]";
	}
	
	
	
	

}
