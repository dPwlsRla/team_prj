package kr.co.sist.badasaja.vo;

public class CImgVO {

	private String cfNum, img,hash;

	public CImgVO() {
		// TODO Auto-generated constructor stub
	}
	public CImgVO(String cfNum, String img) {
		this.cfNum = cfNum;
		this.img = img;
	}
	
	public CImgVO(String cfNum, String img ,String hash) {
		this.cfNum = cfNum;
		this.img = img;
		this.hash = hash;
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

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

}
