package com.spring.god.yujin.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.ibatis.javassist.bytecode.stackmap.BasicBlock.Catch;

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
		String checkIn2 = checkIn.substring(0,10);
		return checkIn2;
	}

	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}

	public String getCheckOut() {
		String checkOut2 = checkOut.substring(0,10);
		return checkOut2;
	}
	
	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}

	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	Calendar c1 = Calendar.getInstance();
	String str_today = dateFormat.format(c1.getTime());
			
	Date today;
	Date checkinDate;
	Date checkOutDate;
	int calDate2 = 0;

	public int getCanWriteReview() {
		try {
			today = dateFormat.parse(str_today);
			checkinDate = dateFormat.parse(checkIn); 
			checkOutDate = dateFormat.parse(checkOut); 
			long cal = today.getTime()-checkOutDate.getTime();
			long calDate = cal/(24*60*60*1000);
			calDate2 = (int)calDate;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return calDate2;
	}
	
	public int getCanCancelReserve() {
		try {
			today = dateFormat.parse(str_today);
			checkinDate = dateFormat.parse(checkIn);
			checkOutDate = dateFormat.parse(checkOut);
			long cal = checkinDate.getTime()-today.getTime();
			long calDate = cal/(24*60*60*1000);
			calDate2 = (int)calDate;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return calDate2;
	}
	
	public int getUsing() {
		int using=0;
		try {
			today = dateFormat.parse(str_today);
			checkinDate = dateFormat.parse(checkIn);
			checkOutDate = dateFormat.parse(checkOut);
			long cal = checkOutDate.getTime()-today.getTime();
			long cal2 = checkinDate.getTime()-today.getTime();
			long calDate = cal/(24*60*60*1000);
			long calDate2 = cal2/(24*60*60*1000);
			using = (int)calDate*(int)calDate2;
		} catch(Exception e) {
			e.printStackTrace();
		}
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
