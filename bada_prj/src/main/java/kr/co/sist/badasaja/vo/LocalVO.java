package kr.co.sist.badasaja.vo;

public class LocalVO {
	
	private int guCode;
	private String guName;
	
	public LocalVO() {
		// TODO Auto-generated constructor stub
	}

	public LocalVO(int guCode, String guName) {
		this.guCode = guCode;
		this.guName = guName;
	}

	public int getGuCode() {
		return guCode;
	}

	public void setGuCode(int guCode) {
		this.guCode = guCode;
	}

	public String getGuName() {
		return guName;
	}

	public void setGuName(String guName) {
		this.guName = guName;
	}
	

}
