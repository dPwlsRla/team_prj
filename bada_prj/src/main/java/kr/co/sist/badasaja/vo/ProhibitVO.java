package kr.co.sist.badasaja.vo;

public class ProhibitVO {
	
	private int kNum;
	private String keyWord;
	
	public ProhibitVO() {
		// TODO Auto-generated constructor stub
	}

	public ProhibitVO(int kNum, String keyWord) {
		this.kNum = kNum;
		this.keyWord = keyWord;
	}

	public int getkNum() {
		return kNum;
	}

	public void setkNum(int kNum) {
		this.kNum = kNum;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	
}
