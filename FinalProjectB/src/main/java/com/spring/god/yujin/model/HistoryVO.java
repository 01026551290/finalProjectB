package com.spring.god.yujin.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class HistoryVO {
	
	private int fk_productId;
	private int price;
	private int reserveId;
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
	private String roomType;
	private int memberIdx;
	private int status;
	private int pointStatus;
	
	public HistoryVO() {}

	public HistoryVO(int fk_productId, int price, int reserveId, String reserveDate, String checkIn, String checkOut, int noNight,
			String title, String content, double star, String regDate, String fileName, String largeCategoryOntionCode,
			String name, String businessTel, String address, String info, String img, String productName, String roomType, int memberIdx, int status, int pointStatus) {
		super();
		this.fk_productId = fk_productId;
		this.price = price;
		this.reserveId = reserveId;
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
		this.roomType = roomType;
		this.memberIdx = memberIdx;
		this.status = status;
		this.pointStatus = pointStatus;
	}

	public int getFk_productId() {
		return fk_productId;
	}

	public void setFk_productId(int fk_productId) {
		this.fk_productId = fk_productId;
	}
	
	public int getPoint() {
		int point = price/30;
		return point;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getReserveId() {
		return reserveId;
	}

	public void setReserveId(int reserveId) {
		this.reserveId = reserveId;
	}

	public String getReserveDate() {
		return reserveDate.substring(0,10);
	}

	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}

	public String getCheckIn() {
		return checkIn.substring(0,10);
	}

	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}

	public String getCheckOut() {
		return checkOut.substring(0,10);
	}
	
	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}

	SimpleDateFormat today = new SimpleDateFormat("yyyyMMdd");
	Calendar c1 = Calendar.getInstance();
	String str_today = today.format(c1.getTime());

	public int getCanWriteReview() {
		String checkOutdate=checkOut.substring(0,4)+checkOut.substring(5,7)+checkOut.substring(8,10);
		int checkoutAfter = Integer.parseInt(str_today)-Integer.parseInt(checkOutdate);
		return checkoutAfter;
	}
	
	public int getCanCancelReserve() {
		String checkIndate=checkIn.substring(0,4)+checkIn.substring(5,7)+checkIn.substring(8,10);
		int cancelReserve = Integer.parseInt(checkIndate)-Integer.parseInt(str_today);
		return cancelReserve;
	}
	
	public int getUsing() {
		String checkIndate=checkIn.substring(0,4)+checkIn.substring(5,7)+checkIn.substring(8,10);
		String checkOutdate=checkOut.substring(0,4)+checkOut.substring(5,7)+checkOut.substring(8,10);
		int checkoutAfter = Integer.parseInt(checkOutdate)-Integer.parseInt(str_today);
		int cancelReserve = Integer.parseInt(checkIndate)-Integer.parseInt(str_today);
		int using = checkoutAfter*cancelReserve;
		return using;
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
	
	public String getRoomType() {
		return roomType;
	}
	
	public String getBed() {
		return roomType.substring(1,2);
	}
	
	public String getPer() {
		return roomType.substring(2);
	}
	
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public int getMemberIdx() {
		return memberIdx;
	}

	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

//	public int getPointStatus2() {
//		int ss = 0;
//		if(pointStatus==100)
//			ss = 5;
//		else
//			ss = 2;
//		System.out.println(ss);
//		return ss;
//	}
	
	public int getPointStatus() {
		return pointStatus;
	}

	public void setPointStatus(int pointStatus) {
		this.pointStatus = pointStatus;
	}
	


}
