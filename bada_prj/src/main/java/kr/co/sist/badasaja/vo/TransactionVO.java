package kr.co.sist.badasaja.vo;

public class TransactionVO {
	
	private String cID, cfNum, tStatus;
	
	public TransactionVO() {
	}

	public TransactionVO(String cID, String cfNum, String tStatus) {
		this.cID = cID;
		this.cfNum = cfNum;
		this.tStatus = tStatus;
	}

	public String getcID() {
		return cID;
	}

	public void setcID(String cID) {
		this.cID = cID;
	}

	public String getCfNum() {
		return cfNum;
	}

	public void setCfNum(String cfNum) {
		this.cfNum = cfNum;
	}

	public String gettStatus() {
		return tStatus;
	}

	public void settStatus(String tStatus) {
		this.tStatus = tStatus;
	}
	
}
