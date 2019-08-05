package com.spring.god.jinsoo.model;

public class HotelVO {

	private String fk_largecategorycode;
	private String name;
	private String businesstel;
	private String address;
	private String info;
	private String ontiontype;
	private String regday;
	
	public HotelVO() {}
	
	public HotelVO(String fk_largecategorycode, String name, String businesstel, String address, String info,
			String ontiontype, String regday) {
		super();
		this.fk_largecategorycode = fk_largecategorycode;
		this.name = name;
		this.businesstel = businesstel;
		this.address = address;
		this.info = info;
		this.ontiontype = ontiontype;
		this.regday = regday;
	}

	
	public String getFk_largecategorycode() {
		return fk_largecategorycode;
	}

	public void setFk_largecategorycode(String fk_largecategorycode) {
		this.fk_largecategorycode = fk_largecategorycode;
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

	public String getOntiontype() {
		return ontiontype;
	}

	public void setOntiontype(String ontiontype) {
		this.ontiontype = ontiontype;
	}

	public String getRegday() {
		return regday;
	}

	public void setRegday(String regday) {
		this.regday = regday;
	}
	
	
	
	
}
