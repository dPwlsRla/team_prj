package kr.co.sist.badasaja.vo;

public class CScoreVO {

	private String cID;
	private int one, two, three, four, five;
	
	public CScoreVO() {
		// TODO Auto-generated constructor stub
	}

	
	
	public CScoreVO(String cID, int one, int two, int three, int four, int five) {
		this.cID = cID;
		this.one = one;
		this.two = two;
		this.three = three;
		this.four = four;
		this.five = five;
	}



	public String getcID() {
		return cID;
	}

	public void setcID(String cID) {
		this.cID = cID;
	}

	public int getOne() {
		return one;
	}

	public void setOne(int one) {
		this.one = one;
	}

	public int getTwo() {
		return two;
	}

	public void setTwo(int two) {
		this.two = two;
	}

	public int getThree() {
		return three;
	}

	public void setThree(int three) {
		this.three = three;
	}

	public int getFour() {
		return four;
	}

	public void setFour(int four) {
		this.four = four;
	}

	public int getFive() {
		return five;
	}

	public void setFive(int five) {
		this.five = five;
	}
	
	
}
