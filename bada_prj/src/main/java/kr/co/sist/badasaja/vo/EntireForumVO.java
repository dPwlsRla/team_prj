package kr.co.sist.badasaja.vo;

import java.util.List;

public class EntireForumVO {
	
	private String title, img, cfNum;
	private boolean isWish;
	private List<HashTagVO> list;

	public EntireForumVO() {
		// TODO Auto-generated constructor stub
	}

	public EntireForumVO(String title, String img, String cfNum, List<HashTagVO> list) {
		this.title = title;
		this.img = img;
		this.cfNum = cfNum;
		this.list = list;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getCfNum() {
		return cfNum;
	}

	public void setCfNum(String cfNum) {
		this.cfNum = cfNum;
	}

	public List<HashTagVO> getList() {
		return list;
	}

	public void setList(List<HashTagVO> list) {
		this.list = list;
	}
	
	public void setIsWish(boolean isWish) {
		this.isWish = isWish;
	}

	public boolean getIsWish() {
		return isWish;
	}
}
