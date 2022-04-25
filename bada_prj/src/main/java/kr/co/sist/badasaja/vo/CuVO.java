package kr.co.sist.badasaja.vo;

public class CuVO {

	private String cID, cPass, nickName, birth, tel, profile, guName, email, cStatus, score, signDate, accessDate,
			ipAddress, gender;

	private int guCode, forumCount, reportCount;

	public CuVO() {
		// TODO Auto-generated constructor stub
	}

	public CuVO(String cID, String cPass, String nickName, String birth, String tel, String profile, String guName,
			String email, String cStatus, String score, String signDate, String accessDate, String ipAddress,
			String gender, int guCode, int forumCount, int report_count) {
		this.cID = cID;
		this.cPass = cPass;
		this.nickName = nickName;
		this.birth = birth;
		this.tel = tel;
		this.profile = profile;
		this.guName = guName;
		this.email = email;
		this.cStatus = cStatus;
		this.score = score;
		this.signDate = signDate;
		this.accessDate = accessDate;
		this.ipAddress = ipAddress;
		this.gender = gender;
		this.guCode = guCode;
		this.forumCount = forumCount;
		this.reportCount = report_count;
	}

	public int getForumCount() {
		return forumCount;
	}

	public void setForumCount(int forumCount) {
		this.forumCount = forumCount;
	}

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int report_count) {
		this.reportCount = report_count;
	}

	public String getGuName() {
		return guName;
	}

	public void setGuName(String guName) {
		this.guName = guName;
	}

	public String getcID() {
		return cID;
	}

	public void setcID(String cID) {
		this.cID = cID;
	}

	public String getcPass() {
		return cPass;
	}

	public void setcPass(String cPass) {
		this.cPass = cPass;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getcStatus() {
		return cStatus;
	}

	public void setcStatus(String cStatus) {
		this.cStatus = cStatus;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getSignDate() {
		return signDate;
	}

	public void setSignDate(String signDate) {
		this.signDate = signDate;
	}

	public String getAccessDate() {
		return accessDate;
	}

	public void setAccessDate(String accessDate) {
		this.accessDate = accessDate;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getGuCode() {
		return guCode;
	}

	public void setGuCode(int guCode) {
		this.guCode = guCode;
	}

}
