package com.spring.god.yujin.model;

import java.util.List;

public class SearchVO {
	
	private String memberid;
	
	private int totalCnt;
//	private int sizePerPage;
	private int currentShowPage;
	private int totalPage;
	private int startRno;
	private int endRno;
	
	private String searchWord;
	private String hotelName;
	
	private String checkin_date;
	private String checkout_date;

	private String adult;
	private String children;
//	private int per;
	
	private String sort;
	
	private int minPrice;
	private int maxPrice;
	private double minStar;
	private double maxStar;
	
	private String largeCategoryCode;
	private String largeCategoryName;
	private String largeCategoryontionCode;
	
	private String lontion;
	private String pontion;
	
	private String[] lontionList;
	private String[] pontionList;
	private String[] largeCategoryCodeList;
	
	public SearchVO() {}


	public SearchVO(String memberid, int totalCnt, int currentShowPage, int totalPage, int startRno, int endRno,
			String searchWord, String hotelName, String checkin_date, String checkout_date, String adult,
			String children, String sort, int minPrice, int maxPrice, double minStar, double maxStar,
			String largeCategoryCode, String largeCategoryName, String largeCategoryontionCode, String lontion,
			String pontion, String[] lontionList, String[] pontionList, String[] largeCategoryCodeList) {
		super();
		this.memberid = memberid;
		this.totalCnt = totalCnt;
		this.currentShowPage = currentShowPage;
		this.totalPage = totalPage;
		this.startRno = startRno;
		this.endRno = endRno;
		this.searchWord = searchWord;
		this.hotelName = hotelName;
		this.checkin_date = checkin_date;
		this.checkout_date = checkout_date;
		this.adult = adult;
		this.children = children;
		this.sort = sort;
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
		this.minStar = minStar;
		this.maxStar = maxStar;
		this.largeCategoryCode = largeCategoryCode;
		this.largeCategoryName = largeCategoryName;
		this.largeCategoryontionCode = largeCategoryontionCode;
		this.lontion = lontion;
		this.pontion = pontion;
		this.lontionList = lontionList;
		this.pontionList = pontionList;
		this.largeCategoryCodeList = largeCategoryCodeList;
	}


	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getSizePerPageSearchList() {
		return 15;
	}
	
	public int getSizePerPageHeartList() {
		return 4;
	}

	public int getCurrentShowPage() {
		return currentShowPage;
	}

	public void setCurrentShowPage(int currentShowPage) {
		this.currentShowPage = currentShowPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartRno() {
		return startRno;
	}

	public void setStartRno(int startRno) {
		this.startRno = startRno;
	}

	public int getEndRno() {
		return endRno;
	}

	public void setEndRno(int endRno) {
		this.endRno = endRno;
	}

	public String getMemberid() {
		return memberid!=null?memberid:"";
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid!=null?memberid:"";
	}

	public String getSearchWord() {
		return searchWord!=null?searchWord:"";
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getCheckin_date() {
		return checkin_date!=null?checkin_date:"";
	}

	public void setCheckin_date(String checkin_date) {
		this.checkin_date = checkin_date!=null?checkin_date:"";
	}

	public String getCheckout_date() {
		return checkout_date!=null?checkout_date:"";
	}

	public void setCheckout_date(String checkout_date) {
		this.checkout_date = checkout_date!=null?checkout_date:"";
	}

	public String getAdult() {
		return adult!=null?adult:"";
	}

	public void setAdult(String adult) {
		this.adult = adult!=null?adult:"";
	}

	public String getChildren() {
		return children!=null?children:"";
	}

	public void setChildren(String children) {
		this.children = children!=null?children:"";
	}
	
	public int getPer() {
		int per = 1;
		try {
			per = Integer.parseInt(adult)+(Integer.parseInt(children)/2);
		} catch (NumberFormatException e) {
			per = 1;
		}
		return per;
	}

	public String getSort() {
		return sort!=null?sort:"largecategoryontioncode";
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getHotelName() {
		return hotelName!=null?hotelName:"";
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName!=null?hotelName:"";
	}

	public int getMinPrice() {
		return minPrice;
	}


	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}


	public int getMaxPrice() {
		return maxPrice!=0?maxPrice:10000000;
	}


	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}


	public double getMinStar() {
		return minStar;
	}


	public void setMinStar(double minStar) {
		this.minStar = minStar;
	}


	public double getMaxStar() {
		return maxStar!=0?maxStar:5.0;
	}


	public void setMaxStar(double maxStar) {
		this.maxStar = maxStar;
	}

	public String getLargeCategoryCode() {
		return largeCategoryCode;
	}

	public void setLargeCategoryCode(String largeCategoryCode) {
		this.largeCategoryCode = largeCategoryCode;
	}
	
	public String getLargeCategoryontionCode() {
		return largeCategoryontionCode;
	}
	
	public void setLargeCategoryontionCode(String largeCategoryontionCode) {
		this.largeCategoryontionCode = largeCategoryontionCode;
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

	public String[] getLontionList() {
		if(lontion!=null)
			lontionList = lontion.split(",");
		return lontionList;
	}

	public void setLontionList(String[] lontionList) {
		this.lontionList = lontionList;
	}

	public String[] getPontionList() {
		if(pontion!=null)
			pontionList = pontion.split(",");
		return pontionList;
	}

	public void setPontionList(String[] pontionList) {
		this.pontionList = pontionList;
	}

	public String[] getLargeCategoryCodeList() {
		if(largeCategoryCode!=null)
			largeCategoryCodeList = largeCategoryCode.split(",");
		return largeCategoryCodeList;
	}

	public void setLargeCategoryCodeList(String[] largeCategoryCodeList) {
		this.largeCategoryCodeList = largeCategoryCodeList;
	}
	
	public int getLargeCategoryListLength() {
		int n = 0;
			n = largeCategoryCodeList.length;
		return n;
	}
	
	

}

