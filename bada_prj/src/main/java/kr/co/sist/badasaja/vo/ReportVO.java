package kr.co.sist.badasaja.vo;

public class ReportVO {
	
	private int rCode;
	private String rCategory;
	
	public ReportVO() {
		// TODO Auto-generated constructor stub
	}

	public ReportVO(int rCode, String rCategory) {
		this.rCode = rCode;
		this.rCategory = rCategory;
	}

	public int getrCode() {
		return rCode;
	}

	public void setrCode(int rCode) {
		this.rCode = rCode;
	}

	public String getrCategory() {
		return rCategory;
	}

	public void setrCategory(String rCategory) {
		this.rCategory = rCategory;
	}
	
	

}
