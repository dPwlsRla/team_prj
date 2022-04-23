package kr.co.sist.badasaja.vo;

public class ReplyVO {

	private int replyNum;
	private String pCom, rID, replyMain, replyDate;
	private char secret;

	public ReplyVO() {
		// TODO Auto-generated constructor stub
	}

	public ReplyVO(int replyNum, String pCom, String rID, String replyMain, String replyDate, char secret) {
		this.replyNum = replyNum;
		this.pCom = pCom;
		this.rID = rID;
		this.replyMain = replyMain;
		this.replyDate = replyDate;
		this.secret = secret;
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

	public String getrID() {
		return rID;
	}

	public void setrID(String rID) {
		this.rID = rID;
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

	public char getSecret() {
		return secret;
	}

	public void setSecret(char secret) {
		this.secret = secret;
	}

}
