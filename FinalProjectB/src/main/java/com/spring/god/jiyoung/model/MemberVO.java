 package com.spring.god.jiyoung.model;

public class MemberVO {

	private int IDX;         //회원번호(시퀀스로 데이터가 들어온다)
	private String MEMBERID;   //회원아이디
	private String NICKNAME;     //회원명
	private String PWD;      //비밀번호(SHA-256 암호화 대상)
	private String NAME;    //이메일   (AES-256 암호화/복호화 대상)
	private String EMAIL;      //휴대폰
	private String BRITHDAY;      //   (AES-256 암호화/복호화 대상)
	private String TEL;      //   (AES-256 암호화/복호화 대상)
	private int    GENDER;    //우편번호
	private String REGISTERDAY;    // 
	private int STATUS;    //주소
	private int GRADE;    //
	private int POINT;   //성별   남자 1, 여자2
	private String PICTURE; //생년
	private String FINALLOGINDATE;  //생월
	private String FINALPWDATE;  //생일
	private String FK_MEMBERID;
	private String FK_IDX;
	
	public MemberVO() {}
	
	public MemberVO(int iDX, String mEMBERID, String nICKNAME, String pWD, String nAME, String eMAIL, String bRITHDAY,
			String tEL, int gENDER, String rEGISTERDAY, int sTATUS, int gRADE, int pOINT, String pICTURE,
			String fINALLOGINDATE, String fINALPWDATE, String fK_MEMBERID, String fK_IDX) {
		super();
		IDX = iDX;
		MEMBERID = mEMBERID;
		NICKNAME = nICKNAME;
		PWD = pWD;
		NAME = nAME;
		EMAIL = eMAIL;
		BRITHDAY = bRITHDAY;
		TEL = tEL;
		GENDER = gENDER;
		REGISTERDAY = rEGISTERDAY;
		STATUS = sTATUS;
		GRADE = gRADE;
		POINT = pOINT;
		PICTURE = pICTURE;
		FINALLOGINDATE = fINALLOGINDATE;
		FINALPWDATE = fINALPWDATE;
		FK_MEMBERID = fK_MEMBERID;
		FK_IDX = fK_IDX;
	}

	public int getIDX() {
		return IDX;
	}

	public void setIDX(int iDX) {
		IDX = iDX;
	}

	public String getMEMBERID() {
		return MEMBERID;
	}

	public void setMEMBERID(String mEMBERID) {
		MEMBERID = mEMBERID;
	}

	public String getNICKNAME() {
		return NICKNAME;
	}

	public void setNICKNAME(String nICKNAME) {
		NICKNAME = nICKNAME;
	}

	public String getPWD() {
		return PWD;
	}

	public void setPWD(String pWD) {
		PWD = pWD;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}

	public String getBRITHDAY() {
		return BRITHDAY;
	}

	public void setBRITHDAY(String bRITHDAY) {
		BRITHDAY = bRITHDAY;
	}

	public String getTEL() {
		return TEL;
	}

	public void setTEL(String tEL) {
		TEL = tEL;
	}

	public int getGENDER() {
		return GENDER;
	}

	public void setGENDER(int gENDER) {
		GENDER = gENDER;
	}

	public String getREGISTERDAY() {
		return REGISTERDAY;
	}

	public void setREGISTERDAY(String rEGISTERDAY) {
		REGISTERDAY = rEGISTERDAY;
	}

	public int getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(int sTATUS) {
		STATUS = sTATUS;
	}

	public int getGRADE() {
		return GRADE;
	}

	public void setGRADE(int gRADE) {
		GRADE = gRADE;
	}

	public int getPOINT() {
		return POINT;
	}

	public void setPOINT(int pOINT) {
		POINT = pOINT;
	}

	public String getPICTURE() {
		return PICTURE;
	}

	public void setPICTURE(String pICTURE) {
		PICTURE = pICTURE;
	}

	public String getFINALLOGINDATE() {
		return FINALLOGINDATE;
	}

	public void setFINALLOGINDATE(String fINALLOGINDATE) {
		FINALLOGINDATE = fINALLOGINDATE;
	}

	public String getFINALPWDATE() {
		return FINALPWDATE;
	}

	public void setFINALPWDATE(String fINALPWDATE) {
		FINALPWDATE = fINALPWDATE;
	}

	public String getFK_MEMBERID() {
		return FK_MEMBERID;
	}

	public void setFK_MEMBERID(String fK_MEMBERID) {
		FK_MEMBERID = fK_MEMBERID;
	}

	public String getFK_IDX() {
		return FK_IDX;
	}

	public void setFK_IDX(String fK_IDX) {
		FK_IDX = fK_IDX;
	}
	
	
	
	
	
}
