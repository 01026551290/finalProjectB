package com.spring.god.yujin.model;

public class HistoryVO {
	
	private int fk_productId;
	private int price;
	private String reserveDate;
	private String checkIn;
	private String checkOut;
	private int noNight;
	private String title;
	private String content;
	private double star;
	private String regDate;
	private String fileName;
	private String largeCategoryOntionCode;
	private String name;
	private String businessTel;
	private String address;
	private String info;
	private String img;
	private String productName;
	private int memberIdx;
	
	public HistoryVO() {}

	public HistoryVO(int fk_productId, int price, String reserveDate, String checkIn, String checkOut, int noNight,
			String title, String content, double star, String regDate, String fileName, String largeCategoryOntionCode,
			String name, String businessTel, String address, String info, String img, String productName, int memberIdx) {
		super();
		this.fk_productId = fk_productId;
		this.price = price;
		this.reserveDate = reserveDate;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.noNight = noNight;
		this.title = title;
		this.content = content;
		this.star = star;
		this.regDate = regDate;
		this.fileName = fileName;
		this.largeCategoryOntionCode = largeCategoryOntionCode;
		this.name = name;
		this.businessTel = businessTel;
		this.address = address;
		this.info = info;
		this.img = img;
		this.productName = productName;
		this.memberIdx = memberIdx;
	}

	public int getFk_productId() {
		return fk_productId;
	}

	public void setFk_productId(int fk_productId) {
		this.fk_productId = fk_productId;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
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

	public int getNoNight() {
		return noNight;
	}

	public void setNoNight(int noNight) {
		this.noNight = noNight;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public double getStar() {
		return star;
	}

	public void setStar(double star) {
		this.star = star;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getLargeCategoryOntionCode() {
		return largeCategoryOntionCode;
	}

	public void setLargeCategoryOntionCode(String largeCategoryOntionCode) {
		this.largeCategoryOntionCode = largeCategoryOntionCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBusinessTel() {
		return businessTel;
	}

	public void setBusinessTel(String businessTel) {
		this.businessTel = businessTel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getMemberIdx() {
		return memberIdx;
	}

	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}
	
	


}
