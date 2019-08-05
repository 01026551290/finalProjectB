 package com.spring.god.jinsoo.model;

public class JinsoomemberVO {

   private int idx;         //회원번호(시퀀스로 데이터가 들어온다)
   private String memberId;   //회원아이디
   private String nickName;     //회원명
   private String pwd;      //비밀번호(SHA-256 암호화 대상)
   private String name;    //이메일   (AES-256 암호화/복호화 대상)
   private String email;      //휴대폰
   private String brithDay;      //   (AES-256 암호화/복호화 대상)
   private String tel;      //   (AES-256 암호화/복호화 대상)
   private int    gender;    //우편번호
   private String registerDay;    // 
   private int status;    //주소
   private int grade;    //
   private int point;   //성별   남자 1, 여자2
   private String picture; //생년
   private String finalLoginDate;  //생월
   private String finalPwDate;  //생일
   private String fk_MemberId;
   private String fk_Idx;
   private String deleteDate;
   
   public JinsoomemberVO() {}

   public JinsoomemberVO(int idx, String memberId, String nickName, String pwd, String name, String email, String brithDay,
         String tel, int gender, String registerDay, int status, int grade, int point, String picture,
         String finalLoginDate, String finalPwDate, String fk_MemberId, String fk_Idx,String deleteDate) {
      this.idx = idx;
      this.memberId = memberId;
      this.nickName = nickName;
      this.pwd = pwd;
      this.name = name;
      this.email = email;
      this.brithDay = brithDay;
      this.tel = tel;
      this.gender = gender;
      this.registerDay = registerDay;
      this.status = status;
      this.grade = grade;
      this.point = point;
      this.picture = picture;
      this.finalLoginDate = finalLoginDate;
      this.finalPwDate = finalPwDate;
      this.fk_MemberId = fk_MemberId;
      this.fk_Idx = fk_Idx;
      this.deleteDate = deleteDate;
   }

   public int getIdx() {
      return idx;
   }

   public void setIdx(int idx) {
      this.idx = idx;
   }

   public String getMemberId() {
      return memberId;
   }

   public void setMemberId(String memberId) {
      this.memberId = memberId;
   }

   public String getNickName() {
      return nickName;
   }

   public void setNickName(String nickName) {
      this.nickName = nickName;
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

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getBrithDay() {
      return brithDay;
   }

   public void setBrithDay(String brithDay) {
      this.brithDay = brithDay;
   }

   public String getTel() {
      return tel;
   }

   public void setTel(String tel) {
      this.tel = tel;
   }

   public int getGender() {
      return gender;
   }

   public void setGender(int gender) {
      this.gender = gender;
   }

   public String getRegisterDay() {
      return registerDay;
   }

   public void setRegisterDay(String registerDay) {
      this.registerDay = registerDay;
   }

   public int getStatus() {
      return status;
   }

   public void setStatus(int status) {
      this.status = status;
   }

   public int getGrade() {
      return grade;
   }

   public void setGrade(int grade) {
      this.grade = grade;
   }

   public int getPoint() {
      return point;
   }

   public void setPoint(int point) {
      this.point = point;
   }

   public String getPicture() {
      return picture;
   }

   public void setPicture(String picture) {
      this.picture = picture;
   }

   public String getFinalLoginDate() {
      return finalLoginDate;
   }

   public void setFinalLoginDate(String finalLoginDate) {
      this.finalLoginDate = finalLoginDate;
   }

   public String getFinalPwDate() {
      return finalPwDate;
   }

   public void setFinalPwDate(String finalPwDate) {
      this.finalPwDate = finalPwDate;
   }

   public String getFk_MemberId() {
      return fk_MemberId;
   }

   public void setFk_MemberId(String fk_MemberId) {
      this.fk_MemberId = fk_MemberId;
   }

   public String getFk_Idx() {
      return fk_Idx;
   }

   public void setFk_Idx(String fk_Idx) {
      this.fk_Idx = fk_Idx;
   }

	public String getDeleteDate() {
		return deleteDate;
	}
	
	public void setDeleteDate(String deleteDate) {
		this.deleteDate = deleteDate;
	}   
   
   
   
}