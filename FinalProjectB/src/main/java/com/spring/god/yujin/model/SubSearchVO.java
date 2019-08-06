package com.spring.god.yujin.model;

public class SubSearchVO {
	
	private int min;
	private int max;
	
	private String largeCategoryCode;
	private String largeCategoryName;
	
	private String lontion;
	private String pontion;
	
	public SubSearchVO() {}
	
	public SubSearchVO(int min, int max, String largeCategoryCode, String largeCategoryName, String lontion,
			String pontion) {
		super();
		this.min = min;
		this.max = max;
		this.largeCategoryCode = largeCategoryCode;
		this.largeCategoryName = largeCategoryName;
		this.lontion = lontion;
		this.pontion = pontion;
	}

	public int getMin() {
		return min;
	}

	public void setMin(int min) {
		this.min = min;
	}

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}

	public String getLargeCategoryCode() {
		return largeCategoryCode;
	}

	public void setLargeCategoryCode(String largeCategoryCode) {
		this.largeCategoryCode = largeCategoryCode;
	}

	public String getLargeCategoryName() {
		return largeCategoryName;
	}

	public void setLargeCategoryName(String largeCategoryName) {
		this.largeCategoryName = largeCategoryName;
	}

	public String getLontion() {
		return lontion;
	}

	public void setLontion(String lontion) {
		this.lontion = lontion;
	}

	public String getPontion() {
		return pontion;
	}

	public void setPontion(String pontion) {
		this.pontion = pontion;
	}
	
	
	
	

}
