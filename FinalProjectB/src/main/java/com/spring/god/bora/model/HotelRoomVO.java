package com.spring.god.bora.model;

public class HotelRoomVO {
	
	// 호텔정보
	private String largeCategoryontionCode;		// 호텔옵션코드
	private String fk_LargeCategoryCode;       	// 호텔카테고리코드
	private String name;                    	// 이름
	private String businessTel;                	// 전화번호
	private String address;                    	// 주소
	private String info;                    	// 소개글
	private String ontionType;                	// 옵션타입
	private String img;                       	// 이미지파일
	private String regDay;						// 등록일
	
	// 객실정보
	private String productId;                 	// 상품ID
	private String fk_LargeCategoryOntionCode;  // 호텔옵션코드
	private String roomType;                 	// 룸유형
	private String roomOption;                 	// 룸옵션
	private String productName;                 // 룸이름
	private String weekPrice;                 	// 주중가
	private String weekenPrice;                	// 주말가
	private String roomInfo;                	// 룸소개
	private String productStatus;             	// 룸상태
	private String productPeriod1;             	// 상품기간1
	private String productPeriod2; 				// 상품기간2
	
	// 리뷰
	private Double star;						// 별
	private int startcnt;						// 별갯수
	
	public HotelRoomVO() {}
	public HotelRoomVO(String largeCategoryontionCode, String fk_LargeCategoryCode, String name, String businessTel,
			String address, String info, String ontionType, String img, String regDay, String productId,
			String fk_LargeCategoryOntionCode, String roomType, String roomOption, String productName, String weekPrice,
			String weekenPrice, String roomInfo, String productStatus, String productPeriod1, String productPeriod2,
			Double star, int startcnt) {
		this.largeCategoryontionCode = largeCategoryontionCode;
		this.fk_LargeCategoryCode = fk_LargeCategoryCode;
		this.name = name;
		this.businessTel = businessTel;
		this.address = address;
		this.info = info;
		this.ontionType = ontionType;
		this.regDay = regDay;
		this.img = img;
		this.productId = productId;
		this.fk_LargeCategoryOntionCode = fk_LargeCategoryOntionCode;
		this.roomType = roomType;
		this.roomOption = roomOption;
		this.productName = productName;
		this.weekPrice = weekPrice;
		this.weekenPrice = weekenPrice;
		this.roomInfo = roomInfo;
		this.productStatus = productStatus;
		this.productPeriod1 = productPeriod1;
		this.productPeriod2 = productPeriod2;
		this.star = star;
		this.startcnt = startcnt;
	}
	
	public String getLargeCategoryontionCode() {
		return largeCategoryontionCode;
	}
	public void setLargeCategoryontionCode(String largeCategoryontionCode) {
		this.largeCategoryontionCode = largeCategoryontionCode;
	}
	public String getFk_LargeCategoryCode() {
		return fk_LargeCategoryCode;
	}
	public void setFk_LargeCategoryCode(String fk_LargeCategoryCode) {
		this.fk_LargeCategoryCode = fk_LargeCategoryCode;
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
	public String getOntionType() {
		return ontionType;
	}
	public void setOntionType(String ontionType) {
		this.ontionType = ontionType;
	}
	public String getRegDay() {
		return regDay;
	}
	public void setRegDay(String regDay) {
		this.regDay = regDay;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getFk_LargeCategoryOntionCode() {
		return fk_LargeCategoryOntionCode;
	}
	public void setFk_LargeCategoryOntionCode(String fk_LargeCategoryOntionCode) {
		this.fk_LargeCategoryOntionCode = fk_LargeCategoryOntionCode;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public String getRoomOption() {
		return roomOption;
	}
	public void setRoomOption(String roomOption) {
		this.roomOption = roomOption;
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
	public String getWeekenPrice() {
		return weekenPrice;
	}
	public void setWeekenPrice(String weekenPrice) {
		this.weekenPrice = weekenPrice;
	}
	public String getRoomInfo() {
		return roomInfo;
	}
	public void setRoomInfo(String roomInfo) {
		this.roomInfo = roomInfo;
	}
	public String getProductStatus() {
		return productStatus;
	}
	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}
	public String getProductPeriod1() {
		return productPeriod1;
	}
	public void setProductPeriod1(String productPeriod1) {
		this.productPeriod1 = productPeriod1;
	}
	public String getProductPeriod2() {
		return productPeriod2;
	}
	public void setProductPeriod2(String productPeriod2) {
		this.productPeriod2 = productPeriod2;
	}
	public Double getStar() {
		return star;
	}
	public void setStar(Double star) {
		this.star = star;
	}
	public int getstartcnt() {
		return startcnt;
	}
	public void setstartcnt(int startcnt) {
		this.startcnt = startcnt;
	}
	
	
}
