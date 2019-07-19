package com.spring.god.taehee.model;

public class THProductVO {
	
	private int productid; 
	private int fk_regioncode;
	private int fk_largecategorycode;
	private int fk_largecategoryontioncode;
	private int fk_middlecategorycode;
	private int fk_middlecategoryontioncode;
	private String productname;
	private int weekprice; 
	private int weekenprice;
	private String roominfo;
	private int productstatus;
	private String productperiod1;
	private String productperiod2;
	
	/* 
	  == productpic table ==
	  	private int PRODUCTPICID;
		private int FK_PRODUCTID;
		private String PICTURE; */
		
	
	public THProductVO(int productid, int fk_regioncode, int fk_largecategorycode, int fk_largecategoryontioncode,
			int fk_middlecategorycode, int fk_middlecategoryontioncode, String productname, int weekprice,
			int weekenprice, String roominfo, int productstatus, String productperiod1, String productperiod2) {
		super();
		this.productid = productid;
		this.fk_regioncode = fk_regioncode;
		this.fk_largecategorycode = fk_largecategorycode;
		this.fk_largecategoryontioncode = fk_largecategoryontioncode;
		this.fk_middlecategorycode = fk_middlecategorycode;
		this.fk_middlecategoryontioncode = fk_middlecategoryontioncode;
		this.productname = productname;
		this.weekprice = weekprice;
		this.weekenprice = weekenprice;
		this.roominfo = roominfo;
		this.productstatus = productstatus;
		this.productperiod1 = productperiod1;
		this.productperiod2 = productperiod2;
	}

	
	
	
	public int getProductid() {
		return productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	public int getFk_regioncode() {
		return fk_regioncode;
	}

	public void setFk_regioncode(int fk_regioncode) {
		this.fk_regioncode = fk_regioncode;
	}

	public int getFk_largecategorycode() {
		return fk_largecategorycode;
	}

	public void setFk_largecategorycode(int fk_largecategorycode) {
		this.fk_largecategorycode = fk_largecategorycode;
	}

	public int getFk_largecategoryontioncode() {
		return fk_largecategoryontioncode;
	}

	public void setFk_largecategoryontioncode(int fk_largecategoryontioncode) {
		this.fk_largecategoryontioncode = fk_largecategoryontioncode;
	}

	public int getFk_middlecategorycode() {
		return fk_middlecategorycode;
	}

	public void setFk_middlecategorycode(int fk_middlecategorycode) {
		this.fk_middlecategorycode = fk_middlecategorycode;
	}

	public int getFk_middlecategoryontioncode() {
		return fk_middlecategoryontioncode;
	}

	public void setFk_middlecategoryontioncode(int fk_middlecategoryontioncode) {
		this.fk_middlecategoryontioncode = fk_middlecategoryontioncode;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public int getWeekprice() {
		return weekprice;
	}

	public void setWeekprice(int weekprice) {
		this.weekprice = weekprice;
	}

	public int getWeekenprice() {
		return weekenprice;
	}

	public void setWeekenprice(int weekenprice) {
		this.weekenprice = weekenprice;
	}

	public String getRoominfo() {
		return roominfo;
	}

	public void setRoominfo(String roominfo) {
		this.roominfo = roominfo;
	}

	public int getProductstatus() {
		return productstatus;
	}

	public void setProductstatus(int productstatus) {
		this.productstatus = productstatus;
	}

	public String getProductperiod1() {
		return productperiod1;
	}

	public void setProductperiod1(String productperiod1) {
		this.productperiod1 = productperiod1;
	}

	public String getProductperiod2() {
		return productperiod2;
	}

	public void setProductperiod2(String productperiod2) {
		this.productperiod2 = productperiod2;
	}

	

	


	
}
