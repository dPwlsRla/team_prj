package kr.co.sist.badasaja.vo;

public class FReportVO {

	private String cfrNum, cfNum, cID, cfrMain, frDate, rCategory, cfrDate, cfrReport;
	private int rCode;
	private char cfrStatus;

	public FReportVO() {
		// TODO Auto-generated constructor stub
	}

	public FReportVO(String cfrNum, String cfNum, String cID, String cfrMain, String frDate, String rCategory,
			String cfrDate, String cfrReport, int rCode, char cfrStatus) {
		this.cfrNum = cfrNum;
		this.cfNum = cfNum;
		this.cID = cID;
		this.cfrMain = cfrMain;
		this.frDate = frDate;
		this.rCategory = rCategory;
		this.cfrDate = cfrDate;
		this.cfrReport = cfrReport;
		this.rCode = rCode;
		this.cfrStatus = cfrStatus;
	}

	public String getrCategory() {
		return rCategory;
	}

	public void setrCategory(String rCategory) {
		this.rCategory = rCategory;
	}

	public String getCfrDate() {
		return cfrDate;
	}

	public void setCfrDate(String cfrDate) {
		this.cfrDate = cfrDate;
	}

	public String getCfrReport() {
		return cfrReport;
	}

	public void setCfrReport(String cfrReport) {
		this.cfrReport = cfrReport;
	}

	public String getCfrNum() {
		return cfrNum;
	}

	public void setCfrNum(String cfrNum) {
		this.cfrNum = cfrNum;
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

	public String getCfrMain() {
		return cfrMain;
	}

	public void setCfrMain(String cfrMain) {
		this.cfrMain = cfrMain;
	}

	public String getFrDate() {
		return frDate;
	}

	public void setFrDate(String frDate) {
		this.frDate = frDate;
	}

	public int getrCode() {
		return rCode;
	}

	public void setrCode(int rCode) {
		this.rCode = rCode;
	}

	public char getCfrStatus() {
		return cfrStatus;
	}

	public void setCfrStatus(char cfrStatus) {
		this.cfrStatus = cfrStatus;
	}

}
