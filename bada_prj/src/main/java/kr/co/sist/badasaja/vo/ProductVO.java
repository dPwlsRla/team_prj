package kr.co.sist.badasaja.vo;

public class ProductVO {

	private String pCode, product;
	
	public ProductVO() {
		// TODO Auto-generated constructor stub
	}

	public ProductVO(String pCode, String product) {
		this.pCode = pCode;
		this.product = product;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}
	
}
