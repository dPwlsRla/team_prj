package kr.co.sist.badasaja.vo;

public class OperatorVO {
	private String oID, oPass, signData;
	
	

	public OperatorVO() {
	} // OperatorVO
	
	

	public OperatorVO(String oID, String oPass, String signData) {
		this.oID = oID;
		this.oPass = oPass;
		this.signData = signData;
	} // OperatorVO



	public String getoID() {
		return oID;
	}

	public void setoID(String oID) {
		this.oID = oID;
	}

	public String getoPass() {
		return oPass;
	}

	public void setoPass(String oPass) {
		this.oPass = oPass;
	}

	public String getSignData() {
		return signData;
	}

	public void setSignData(String signData) {
		this.signData = signData;
	}
	
	

}
