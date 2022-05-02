package kr.co.sist.badasaja.vo;

import java.util.ArrayList;
import java.util.List;

public class ComViewVO {
	
	private String comNum, cfNum, cId, nickname, comMain, comDate, profile;
	private List<ReplyViewVO> replyList;
	
	public ComViewVO() {
		super();
	}

	public ComViewVO(String comNum, String cfNum, String cId, String nickname, String comMain, String comDate,
			String profile, List<ReplyViewVO> replyList) {
		super();
		this.comNum = comNum;
		this.cfNum = cfNum;
		this.cId = cId;
		this.nickname = nickname;
		this.comMain = comMain;
		this.comDate = comDate;
		this.profile = profile;
		this.replyList = new ArrayList<ReplyViewVO>();
	}

	public String getComNum() {
		return comNum;
	}

	public void setComNum(String comNum) {
		this.comNum = comNum;
	}

	public String getCfNum() {
		return cfNum;
	}

	public void setCfNum(String cfNum) {
		this.cfNum = cfNum;
	}

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getComMain() {
		return comMain;
	}

	public void setComMain(String comMain) {
		this.comMain = comMain;
	}

	public String getComDate() {
		return comDate;
	}

	public void setComDate(String comDate) {
		this.comDate = comDate;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public List<ReplyViewVO> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<ReplyViewVO> replyList) {
		this.replyList = replyList;
	}

	@Override
	public String toString() {
		return "ComViewVO [comNum=" + comNum + ", cfNum=" + cfNum + ", cId=" + cId + ", nickname=" + nickname
				+ ", comMain=" + comMain + ", comDate=" + comDate + ", profile=" + profile + ", replyList=" + replyList
				+ "]";
	}
	
	
	
	
	
	
	

}
