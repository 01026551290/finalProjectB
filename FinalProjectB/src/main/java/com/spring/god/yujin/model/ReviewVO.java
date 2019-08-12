package com.spring.god.yujin.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {

	private int reviewIdx;
	private int memberIdx;
	private int hotelIdx;
	private int roomIdx;   
	private int reserveIdx; 
	private String title;      
	private String content;    
	private int imgIdx;
	private int status;
	private double star;
	private String regDate;
	private int parentSeq;
	
	private String fileName;    
	private MultipartFile attach; 
	
	private String groupNo;
	private String fk_seq;
	private String depthNo;
	
	private List<String> imgList;
	
	public ReviewVO() {}

	public ReviewVO(int reviewIdx, int memberIdx, int hotelIdx, int roomIdx, int reserveIdx, String title,
			String content, int imgIdx, int status, double star, String regDate, int parentSeq, String fileName,
			MultipartFile attach, String groupNo, String fk_seq, String depthNo, List<String> imgList) {
		super();
		this.reviewIdx = reviewIdx;
		this.memberIdx = memberIdx;
		this.hotelIdx = hotelIdx;
		this.roomIdx = roomIdx;
		this.reserveIdx = reserveIdx;
		this.title = title;
		this.content = content;
		this.imgIdx = imgIdx;
		this.status = status;
		this.star = star;
		this.regDate = regDate;
		this.parentSeq = parentSeq;
		this.fileName = fileName;
		this.attach = attach;
		this.groupNo = groupNo;
		this.fk_seq = fk_seq;
		this.depthNo = depthNo;
		this.imgList = imgList;
	}

	public int getReviewIdx() {
		return reviewIdx;
	}

	public void setReviewIdx(int reviewIdx) {
		this.reviewIdx = reviewIdx;
	}

	public int getMemberIdx() {
		return memberIdx;
	}

	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}

	public int getHotelIdx() {
		return hotelIdx;
	}

	public void setHotelIdx(int hotelIdx) {
		this.hotelIdx = hotelIdx;
	}

	public int getRoomIdx() {
		return roomIdx;
	}

	public void setRoomIdx(int roomIdx) {
		this.roomIdx = roomIdx;
	}

	public int getReserveIdx() {
		return reserveIdx;
	}

	public void setReserveIdx(int reserveIdx) {
		this.reserveIdx = reserveIdx;
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

	public int getImgIdx() {
		return imgIdx;
	}

	public void setImgIdx(int imgIdx) {
		this.imgIdx = imgIdx;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
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

	public int getParentSeq() {
		return parentSeq;
	}

	public void setParentSeq(int parentSeq) {
		this.parentSeq = parentSeq;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public MultipartFile getAttach() {
		return attach;
	}

	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}

	public String getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(String groupNo) {
		this.groupNo = groupNo;
	}

	public String getFk_seq() {
		return fk_seq;
	}

	public void setFk_seq(String fk_seq) {
		this.fk_seq = fk_seq;
	}

	public String getDepthNo() {
		return depthNo;
	}

	public void setDepthNo(String depthNo) {
		this.depthNo = depthNo;
	}

	public List<String> getImgList() {
		return imgList;
	}
	
	public void setImgList(List<String> imgList) {
		this.imgList = imgList;
	}
	
	
	
}