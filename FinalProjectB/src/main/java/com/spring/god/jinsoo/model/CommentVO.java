package com.spring.god.jinsoo.model;



public class CommentVO {
	
	private String seq;          // 댓글번호
	private String fk_memberid;    // 사용자ID
	private String name;         // 성명
	private String content;      // 댓글내용
	private String regDate;      // 작성일자
	private String parentSeq;    // 원게시물 글번호
	private String status;       // 글삭제여부
	
	
	
	public CommentVO() { }



	public CommentVO(String seq, String fk_memberid, String name, String content, String regDate, String parentSeq,
			String status) {
		super();
		this.seq = seq;
		this.fk_memberid = fk_memberid;
		this.name = name;
		this.content = content;
		this.regDate = regDate;
		this.parentSeq = parentSeq;
		this.status = status;
	}



	public String getSeq() {
		return seq;
	}



	public void setSeq(String seq) {
		this.seq = seq;
	}



	public String getFk_memberid() {
		return fk_memberid;
	}



	public void setFk_memberid(String fk_memberid) {
		this.fk_memberid = fk_memberid;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public String getRegDate() {
		return regDate;
	}



	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}



	public String getParentSeq() {
		return parentSeq;
	}



	public void setParentSeq(String parentSeq) {
		this.parentSeq = parentSeq;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}
	
	

	
	
}