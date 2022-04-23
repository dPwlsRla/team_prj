package kr.co.sist.badasaja.vo;

public class AdvertiserVO {

	private String aID, guCode, aName, contractDate, expiryDate;

	public AdvertiserVO() {
		// TODO Auto-generated constructor stub
	}

	public AdvertiserVO(String aID, String guCode, String aName, String contractDate, String expiryDate) {
		this.aID = aID;
		this.guCode = guCode;
		this.aName = aName;
		this.contractDate = contractDate;
		this.expiryDate = expiryDate;
	}

	public String getaID() {
		return aID;
	}

	public void setaID(String aID) {
		this.aID = aID;
	}

	public String getGuCode() {
		return guCode;
	}

	public void setGuCode(String guCode) {
		this.guCode = guCode;
	}

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName;
	}

	public String getContractDate() {
		return contractDate;
	}

	public void setContractDate(String contractDate) {
		this.contractDate = contractDate;
	}

	public String getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}

}
