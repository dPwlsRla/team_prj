package kr.co.sist.badasaja.vo;

public class ComVO {
	
	private String comNum, comMain, comDate, cID, cfNum;
	private char secret, del;
	
	public ComVO() {
		// TODO Auto-generated constructor stub
	}

	public ComVO(String comNum, String comMain, String comDate, String cID, String cfNum, char secret, char del) {
		this.comNum = comNum;
		this.comMain = comMain;
		this.comDate = comDate;
		this.cID = cID;
		this.secret = secret;
		this.del = del;
		this.cfNum = cfNum;
	}

	public String getComNum() {
		return comNum;
	}

	public void setComNum(String comNum) {
		this.comNum = comNum;
	}

	public String getComMain() {
		return comMain;
	}

	public void setComMain(String comMain) {
		this.comMain = comMain;
	}

	public String getComDate() {
		return comDate;
	}

	public void setComDate(String comDate) {
		this.comDate = comDate;
	}

	public String getcID() {
		return cID;
	}

	public void setcID(String cID) {
		this.cID = cID;
	}

	public char getSecret() {
		return secret;
	}

	public void setSecret(char secret) {
		this.secret = secret;
	}

	public char getDel() {
		return del;
	}

	public void setDel(char del) {
		this.del = del;
	}

	public String getCfNum() {
		return cfNum;
	}

	public void setCfNum(String cfNum) {
		this.cfNum = cfNum;
	}
	
	
	
}
