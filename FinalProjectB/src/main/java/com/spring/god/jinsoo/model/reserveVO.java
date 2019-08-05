package com.spring.god.jinsoo.model;


public class reserveVO {

	private String reserveId;
	private String price;
	private String reserveDate;
	private String memberIdx;
	private String checkIn;
	private String checkOut;
	private String productName;
	private String weekPrice;
	private String name;
	private String businesstel;
	
	public reserveVO() { }

	public reserveVO(String reserveId, String price, String reserveDate, String memberIdx, String checkIn,
			String checkOut, String productName, String weekPrice, String name, String businesstel) {
		super();
		this.reserveId = reserveId;
		this.price = price;
		this.reserveDate = reserveDate;
		this.memberIdx = memberIdx;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.productName = productName;
		this.weekPrice = weekPrice;
		this.name = name;
		this.businesstel = businesstel;
	}

	public String getReserveId() {
		return reserveId;
	}

	public void setReserveId(String reserveId) {
		this.reserveId = reserveId;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}

	public String getMemberIdx() {
		return memberIdx;
	}

	public void setMemberIdx(String memberIdx) {
		this.memberIdx = memberIdx;
	}

	public String getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}

	public String getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getWeekPrice() {
		return weekPrice;
	}

	public void setWeekPrice(String weekPrice) {
		this.weekPrice = weekPrice;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBusinesstel() {
		return businesstel;
	}

	public void setBusinesstel(String businesstel) {
		this.businesstel = businesstel;
	}
	

	
	
	
	
}
