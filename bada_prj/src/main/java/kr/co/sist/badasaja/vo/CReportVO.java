package kr.co.sist.badasaja.vo;

public class CReportVO {

	private String reportedID, reportID, crMain, rCategory, crDate;
	private int rCode;
	private char crStatus;

	public CReportVO() {
		// TODO Auto-generated constructor stub
	}

	public CReportVO(String reportedID, String reportID, String crMain, String rCategory, String crDate, int rCode,
			char crStatus) {
		this.reportedID = reportedID;
		this.reportID = reportID;
		this.crMain = crMain;
		this.rCategory = rCategory;
		this.crDate = crDate;
		this.rCode = rCode;
		this.crStatus = crStatus;
	}

	public String getrCategory() {
		return rCategory;
	}

	public void setrCategory(String rCategory) {
		this.rCategory = rCategory;
	}

	public String getReportedID() {
		return reportedID;
	}

	public void setReportedID(String reportedID) {
		this.reportedID = reportedID;
	}

	public String getReportID() {
		return reportID;
	}

	public void setReportID(String reportID) {
		this.reportID = reportID;
	}

	public String getCrMain() {
		return crMain;
	}

	public void setCrMain(String crMain) {
		this.crMain = crMain;
	}

	public String getCrDate() {
		return crDate;
	}

	public void setCrDate(String crDate) {
		this.crDate = crDate;
	}

	public int getrCode() {
		return rCode;
	}

	public void setrCode(int rCode) {
		this.rCode = rCode;
	}

	public char getCrStatus() {
		return crStatus;
	}

	public void setCrStatus(char crStatus) {
		this.crStatus = crStatus;
	}

}
