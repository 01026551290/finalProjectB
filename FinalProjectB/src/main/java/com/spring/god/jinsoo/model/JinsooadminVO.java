package com.spring.god.jinsoo.model;

public class JinsooadminVO {

	private int seq;
	private String pwd;
	private String name;
	
	public JinsooadminVO() {}
	
	public JinsooadminVO(int seq, String pwd, String name) {
		super();
		this.seq = seq;
		this.pwd = pwd;
		this.name = name;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	
	
	
	
	
}
