package com.spring.god.yujin.model;

public class HistoryVO {
	
	private int fk_productid;
	private int price;
	private String reservedate;
	private String checkin;
	private String checkout;
	private int nonight;
	private String title;
	private String content;
	private double star;
	private String regdate;
	private String filename;
	private String largecategoryontioncode;
	private String name;
	private String businesstel;
	private String address;
	private String info;
	private String img;
	private String productname;
	
	public HistoryVO() {}
	
	public HistoryVO(int fk_productid, int price, String reservedate, String checkin, String checkout, int nonight,
			String title, String content, double star, String regdate, String filename, String largecategoryontioncode, String name, String businesstel, String address, String info, String img,
			String productname) {
		super();
		this.fk_productid = fk_productid;
		this.price = price;
		this.reservedate = reservedate;
		this.checkin = checkin;
		this.checkout = checkout;
		this.nonight = nonight;
		this.title = title;
		this.content = content;
		this.star = star;
		this.regdate = regdate;
		this.filename = filename;
		this.largecategoryontioncode = largecategoryontioncode;
		this.name = name;
		this.businesstel = businesstel;
		this.address = address;
		this.info = info;
		this.img = img;
		this.productname = productname;
	}

	public int getFk_productid() {
		return fk_productid;
	}

	public void setFk_productid(int fk_productid) {
		this.fk_productid = fk_productid;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getReservedate() {
		return reservedate;
	}

	public void setReservedate(String reservedate) {
		this.reservedate = reservedate;
	}

	public String getCheckin() {
		return checkin.substring(0,10);
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout.substring(0,10);
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

	public int getNonight() {
		return nonight;
	}

	public void setNonight(int nonight) {
		this.nonight = nonight;
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getLargecategoryontioncode() {
		return largecategoryontioncode;
	}

	public void setLargecategoryontioncode(String largecategoryontioncode) {
		this.largecategoryontioncode = largecategoryontioncode;
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

	public String getAddress() {
		return address.substring(8);
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

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}
	
	


}
