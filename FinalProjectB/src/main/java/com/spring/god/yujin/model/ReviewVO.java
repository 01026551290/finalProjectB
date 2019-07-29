package com.spring.god.yujin.model;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {

	private int reviewidx;
	private int memberidx;
	private int hotelidx;
	private int roomidx;   
	private int reserveidx; 
	private String title;      
	private String content;    
	private int imgidx;
	private int status;
	private double star;
	private String regdate;
	private int parentseq;
	
	private String filename;    
	private String orgfilename; 
	private String filesize;    
	
	private MultipartFile attach; 
	
	private String groupno;
	private String fk_seq;
	private String depthno;
	
	public ReviewVO() {}

	public ReviewVO(int reviewidx, int memberidx, int hotelidx, int roomidx, int reserveidx, String title,
			String content, int imgidx, int status, double star, String regdate, int parentseq, String filename,
			String orgfilename, String filesize, String groupno, String fk_seq, String depthno) {
		super();
		this.reviewidx = reviewidx;
		this.memberidx = memberidx;
		this.hotelidx = hotelidx;
		this.roomidx = roomidx;
		this.reserveidx = reserveidx;
		this.title = title;
		this.content = content;
		this.imgidx = imgidx;
		this.status = status;
		this.star = star;
		this.regdate = regdate;
		this.parentseq = parentseq;
		this.filename = filename;
		this.orgfilename = orgfilename;
		this.filesize = filesize;
		this.groupno = groupno;
		this.fk_seq = fk_seq;
		this.depthno = depthno;
	}

	public int getReviewidx() {
		return reviewidx;
	}

	public void setReviewidx(int reviewidx) {
		this.reviewidx = reviewidx;
	}

	public int getMemberidx() {
		return memberidx;
	}

	public void setMemberidx(int memberidx) {
		this.memberidx = memberidx;
	}

	public int getHotelidx() {
		return hotelidx;
	}

	public void setHotelidx(int hotelidx) {
		this.hotelidx = hotelidx;
	}

	public int getRoomidx() {
		return roomidx;
	}

	public void setRoomidx(int roomidx) {
		this.roomidx = roomidx;
	}

	public int getReserveidx() {
		return reserveidx;
	}

	public void setReserveidx(int reserveidx) {
		this.reserveidx = reserveidx;
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

	public int getImgidx() {
		return imgidx;
	}

	public void setImgidx(int imgidx) {
		this.imgidx = imgidx;
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getParentseq() {
		return parentseq;
	}

	public void setParentseq(int parentseq) {
		this.parentseq = parentseq;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getOrgfilename() {
		return orgfilename;
	}

	public void setOrgfilename(String orgfilename) {
		this.orgfilename = orgfilename;
	}

	public String getFilesize() {
		return filesize;
	}

	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}

	public MultipartFile getAttach() {
		return attach;
	}

	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}

	public String getGroupno() {
		return groupno;
	}

	public void setGroupno(String groupno) {
		this.groupno = groupno;
	}

	public String getFk_seq() {
		return fk_seq;
	}

	public void setFk_seq(String fk_seq) {
		this.fk_seq = fk_seq;
	}

	public String getDepthno() {
		return depthno;
	}

	public void setDepthno(String depthno) {
		this.depthno = depthno;
	}

	
	
}
