package kr.co.sist.badasaja.vo;

public class HashTagVO {

	private String hash, cfNum;

	public HashTagVO() {
		// TODO Auto-generated constructor stub
	}

	public HashTagVO(String hash, String cfNum) {
		this.hash = hash;
		this.cfNum = cfNum;
	}

	public String getHash() {
		return hash;
	}

	public void setHash(String hash) {
		this.hash = hash;
	}

	public String getCfNum() {
		return cfNum;
	}

	public void setCfNum(String cfNum) {
		this.cfNum = cfNum;
	}

}
