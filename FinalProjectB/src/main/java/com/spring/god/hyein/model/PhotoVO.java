package com.spring.god.hyein.model;

import org.springframework.web.multipart.MultipartFile;

public class PhotoVO {
		
	private String fileName;			// WAS(톰캣)에 저장될 파일명(2019072509271512345.png) // 동시에 업로드할 경우를 대비해서 초를 세분화해서 올려둔다 중복이 안되게..
	private String orgFilename;			// 진짜 파일명(강아지.png) // 사용자가 파일을 업로드 하거나 파일을 다운로드할 때 사용되어지는 파일명
	private String fileSize;			// 파일크기
	
	private String pseq;
	
	
	private MultipartFile attach;   	// 진짜 파일 ==> WAS(톰캣) 디스크에 저장됨.
	
	public PhotoVO () {
		
	}

	public PhotoVO(String fileName, String orgFilename, String fileSize, MultipartFile attach,String pseq) {
		this.fileName = fileName;
		this.orgFilename = orgFilename;
		this.fileSize = fileSize;
		this.pseq = pseq;
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

	public String getPseq() {
		return pseq;
	}

	public void setPseq(String pseq) {
		this.pseq = pseq;
	}
}
