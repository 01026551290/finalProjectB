package com.spring.god.jinsoo.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardVO {

	private String seq;			// 글번호
	private String fk_member;	// 사용자 ID
	private String name;		// 글쓴이
	private String subject;		// 글제목
	private String content;		// 글내용
	private String pw;			// 글암호
	private String readCount;	// 글조회수
	private String regDate;		// 글쓴시간
	private String status;		// 글삭제여부
	
	private String previousSeq; // 이전글번호
	private String previousSubject; // 이전글제목
	private String nextSeq; // 다음글제목
	private String nextSubject; // 다음글제목
	

	// 83 commentCount 필드 추가하기 
	// 먼저 tblBoard 테이블에 commentCount 라는 컬럼이 존재해야한다
	private String commentCount;
	
	// === #121 답변형 게시판을 위한 필드 추가하기
	//		먼저, 오라클에서 테이블들을 drop 한 후에 테이블을 재생성 한 이후에 아래처럼 해야 한다.
	private String groupNo; // 답변글쓰기에 있는 그룹번호  원글(부모글)과 답변글은 동일한 groupno 를 가진다. 답변글이 아닌 원글인 경우 groupno 의 값는 groupno 컬럼의 최대값(max)+1 로 한다.
	private String fk_seq;
							/* fk_seq 컬럼 절대로 foreign key 가 아니다.!!!!!  fk_seq 컬럼은 
							 자신의 글(답변글)에 있어서 원글(부모글)이 누구인지에 대한 정보 값이다. 답변글쓰기에 
							 있어서 답변글이라면 fk_seq 컬럼의 값은 원글의 seq 컬럼의 값을 가지게 되며 답변글이 아닌 원글일 경우 0을 가지도록 한다.*/
	private String depthno; // 답변글쓰기에 있어서 답변글이라면 원글의 depthno + 1 을 가지게 되며, 답변글이 아닌 원글일 경우 0을 가지게 한다.
	
	/*
	 		=== #135 파일을 첨부하도록 VO 수정하기
	 		먼저, 오라클에서 tblBoard 테이블에 3개 컬럼(fileName, orgFilename , fileSize)을 추가한 다음에 아래의 작업을 한다.
	 */
	
	private String fileName;	 //-- WAS(톰캣)에 저장될 파일명()
	private String orgFilename;	//-- 진짜 파일명(강아지,png) // 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명
	private String fileSize;		// -- 파일크기
	
	private MultipartFile attach;   // 진짜 파일 ==> WAS(톰캣) 디스크에 저장됨.
	// !!!!!! MultipartFile attach 는 오라클 데이터베이스 tblBoard 테이블의 컬럼이 아니다.!!!!!!  
	 	// /Board/src/main/webapp/WEB-INF/views/tiles1/board/add.jsp 파일에서 input type="file" 인 name 의 이름(attach)과 
	 	// 동일해야만 파일첨부가 가능해진다.!!!!
	
	
	public BoardVO() { }
	public BoardVO(String seq, String fk_member, String name, String subject, String content, String pw,
			String readCount, String regDate, String status, String previousSeq, String previousSubject, String nextSeq,
			String nextSubject, String commentCount, String groupNo, String fk_seq, String depthno, String fileName,
			String orgFilename, String fileSize, MultipartFile attach) {
		super();
		this.seq = seq;
		this.fk_member = fk_member;
		this.name = name;
		this.subject = subject;
		this.content = content;
		this.pw = pw;
		this.readCount = readCount;
		this.regDate = regDate;
		this.status = status;
		this.previousSeq = previousSeq;
		this.previousSubject = previousSubject;
		this.nextSeq = nextSeq;
		this.nextSubject = nextSubject;
		this.commentCount = commentCount;
		this.groupNo = groupNo;
		this.fk_seq = fk_seq;
		this.depthno = depthno;
		this.fileName = fileName;
		this.orgFilename = orgFilename;
		this.fileSize = fileSize;
		this.attach = attach;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getFk_member() {
		return fk_member;
	}
	public void setFk_member(String fk_member) {
		this.fk_member = fk_member;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getReadCount() {
		return readCount;
	}
	public void setReadCount(String readCount) {
		this.readCount = readCount;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPreviousSeq() {
		return previousSeq;
	}
	public void setPreviousSeq(String previousSeq) {
		this.previousSeq = previousSeq;
	}
	public String getPreviousSubject() {
		return previousSubject;
	}
	public void setPreviousSubject(String previousSubject) {
		this.previousSubject = previousSubject;
	}
	public String getNextSeq() {
		return nextSeq;
	}
	public void setNextSeq(String nextSeq) {
		this.nextSeq = nextSeq;
	}
	public String getNextSubject() {
		return nextSubject;
	}
	public void setNextSubject(String nextSubject) {
		this.nextSubject = nextSubject;
	}
	public String getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(String commentCount) {
		this.commentCount = commentCount;
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
	public String getDepthno() {
		return depthno;
	}
	public void setDepthno(String depthno) {
		this.depthno = depthno;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOrgFilename() {
		return orgFilename;
	}
	public void setOrgFilename(String orgFilename) {
		this.orgFilename = orgFilename;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public MultipartFile getAttach() {
		return attach;
	}
	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}
	
	
	
	
	
	
	
	
	
	
	
}
