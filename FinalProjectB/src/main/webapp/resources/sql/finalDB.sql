show user;


---- 작성자명 :   작성일자 :

CREATE TABLE MEMBER
(IDX            NUMBER(30)      NOT NULL    
,MEMBERID       VARCHAR2(30)    NOT NULL
,NICKNAME       VARCHAR2(30)    NOT NULL
,PWD            VARCHAR2(300)   NOT NULL    
,NAME           VARCHAR2(20)    NOT NULL
,EMAIL          VARCHAR2(300)   NOT NULL
,BRITHDAY       VARCHAR2(8)     NOT NULL
,TEL            VARCHAR2(11)    NOT NULL
,GENDER         NUMBER(1)       NOT NULL
,REGISTERDAY    DATE            DEFAULT SYSDATE     
,STATUS         NUMBER(1)       DEFAULT 1 
,GRADE          NUMBER(1)       DEFAULT 1
,POINT          NUMBER(20)      DEFAULT 1000
,PICTURE        VARCHAR2(300)   DEFAULT 'NO.JPG'
,FINALLOGINDATE DATE            DEFAULT SYSDATE
,FINALPWDATE    DATE            DEFAULT SYSDATE   
,CONSTRAINT PK_MEMBER_IDX PRIMARY KEY(IDX)
,CONSTRAINT UK_MEMBER_MEMBERID UNIQUE (MEMBERID)
,CONSTRAINT UK_MEMBER_NICKNAME UNIQUE (NICKNAME)
,CONSTRAINT UK_MEMBER_EMAIL UNIQUE (EMAIL)
,CONSTRAINT CK_MEMBER_GENDER CHECK( GENDER in('1','2','3','4') )
,CONSTRAINT CK_MEMBER_STATUS CHECK( STATUS in('1','0') )
);

CREATE SEQUENCE SEQ_MEMBER_IDX
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;

CREATE TABLE LOGIN_MEMBER
(FK_MEMBERID    VARCHAR2(30)    NOT NULL
,PWD            VARCHAR2(300)   NOT NULL
,NICKNAME       VARCHAR2(30)    NOT NULL
,FK_IDX         NUMBER(30)      NOT NULL
,CONSTRAINT FK_LOGIN_MEMBER_FK_MEMBERID FOREIGN KEY(FK_MEMBERID) REFERENCES MEMBER(MEMBERID)
,CONSTRAINT FK_LOGIN_MEMBER_FK_IDX FOREIGN KEY(FK_IDX) REFERENCES MEMBER(IDX)
);


CREATE TABLE REGION
(REGIONCODE     NUMBER(3)       NOT NULL
,REGION         VARCHAR2(20)    NOT NULL
,CONSTRAINT PK_REGION_REGIONCODE PRIMARY KEY(REGIONCODE)
);

CREATE TABLE LCATEGORY
(LARGECATEGORYCODE              NUMBER(3)       NOT NULL
,LARGECATEGORYNAME              VARCHAR2(20)    NOT NULL
,CONSTRAINT PK_LCATEGORY_LARGECATEGORYCODE PRIMARY KEY(LARGECATEGORYCODE)
);

CREATE TABLE LONTION
(LARGECATEGORYONTIONCODE    NUMBER(3)       NOT NULL
,FK_LARGECATEGORYCODE       NUMBER(3)       NOT NULL
,NAME                       VARCHAR2(300)   NOT NULL
,BUSINESSTEL                VARCHAR2(12)    NOT NULL
,ADDRESS                    VARCHAR2(100)   NOT NULL
,INFO                       VARCHAR2(300)   NOT NULL
,ONTIONTYPE                 VARCHAR2(300)   NOT NULL
,CONSTRAINT PK_LONTION_LCATEONTIONCODE PRIMARY KEY(LARGECATEGORYONTIONCODE)
,CONSTRAINT UK_LONTION_NAME UNIQUE (NAME)
,CONSTRAINT FK_LONTION_FK_LCATEGORYCODE FOREIGN KEY(FK_LARGECATEGORYCODE) REFERENCES LCATEGORY(LARGECATEGORYCODE)
);

CREATE TABLE MCATEGORY
(FK_LARGECATEGORYCODE       NUMBER(3)       NOT NULL
,MIDDLECATEGORYCODE         NUMBER(3)       NOT NULL
,MIDDLECATEGORYCODENAME     VARCHAR2(20)    NOT NULL
,CONSTRAINT FK_MCATEGORY_FK_LCATEGORYCODE FOREIGN KEY(FK_LARGECATEGORYCODE) REFERENCES LCATEGORY(LARGECATEGORYCODE)
,CONSTRAINT PK_MCATEGORY_LCATEGORYCODE PRIMARY KEY(MIDDLECATEGORYCODE)
);


CREATE TABLE MONTION
(MIDDLECATEGORYONTIONCODE    NUMBER(3)       NOT NULL
,FK_MIDDLECATEGORYCODE       NUMBER(3)       NOT NULL
,ONTIONTYPE                  VARCHAR2(300)   NOT NULL
,CONSTRAINT PK_MONTION_MCATEONTIONCODE PRIMARY KEY(MIDDLECATEGORYONTIONCODE)
,CONSTRAINT FK_MONTION_FK_MCATEGORYCODE FOREIGN KEY(FK_MIDDLECATEGORYCODE) REFERENCES MCATEGORY(MIDDLECATEGORYCODE)
);


CREATE TABLE PRODUCT
(PRODUCTID                      NUMBER(20)      NOT NULL
,FK_REGIONCODE                  NUMBER(3)       NOT NULL
,FK_LARGECATEGORYCODE           NUMBER(3)       NOT NULL
,FK_LARGECATEGORYONTIONCODE     NUMBER(3)       NOT NULL
,FK_MIDDLECATEGORYCODE          NUMBER(3)       NOT NULL
,FK_MIDDLECATEGORYONTIONCODE    NUMBER(3)       NOT NULL
,PRODUCTNAME                    VARCHAR2(30)    NOT NULL
,WEEKPRICE                      NUMBER(20)      NOT NULL
,WEEKENPRICE                    NUMBER(20)      NOT NULL
,ROOMINFO                       VARCHAR2(100)   NOT NULL
,PRODUCTSTATUS                  NUMBER(1)       NOT NULL
,PRODUCTPERIOD1                 DATE            NOT NULL
,PRODUCTPERIOD2                 DATE            NOT NULL
,CONSTRAINT PK_PRODUCT_PRODUCTID PRIMARY KEY(PRODUCTID)
,CONSTRAINT FK_PRODUCT_FK_REGIONCODE FOREIGN KEY(FK_REGIONCODE) REFERENCES REGION(REGIONCODE)
,CONSTRAINT FK_PRODUCT_FK_LCATEGORYCODE FOREIGN KEY(FK_LARGECATEGORYCODE) REFERENCES LCATEGORY(LARGECATEGORYCODE)
,CONSTRAINT FK_PRODUCT_FK_LCATEONTIONCODE FOREIGN KEY(FK_LARGECATEGORYONTIONCODE) REFERENCES LONTION(LARGECATEGORYONTIONCODE)
,CONSTRAINT FK_PRODUCT_FK_MCATEGORYCODE FOREIGN KEY(FK_MIDDLECATEGORYCODE) REFERENCES MCATEGORY(MIDDLECATEGORYCODE)
,CONSTRAINT FK_PRODUCT_FK_MCATEONTIONCODE FOREIGN KEY(FK_MIDDLECATEGORYONTIONCODE) REFERENCES MONTION(MIDDLECATEGORYONTIONCODE)
,CONSTRAINT CK_PRODUCT_PRODUCTSTATUS CHECK( PRODUCTSTATUS in('1','0') )
);


CREATE SEQUENCE SEQ_PRODUCT_PRODUCTID  
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;

CREATE TABLE PRODUCTPIC
(PRODUCTPICID       NUMBER(10)      NOT NULL
,FK_PRODUCTID       NUMBER(20)      NOT NULL
,PICTURE            VARCHAR2(300)   NOT NULL
,CONSTRAINT PK_PRODUCTPIC_PRODUCTPICID PRIMARY KEY(PRODUCTPICID)
,CONSTRAINT FK_PRODUCTPIC_FK_PRODUCTID FOREIGN KEY(FK_PRODUCTID) REFERENCES PRODUCT(PRODUCTID)
);

CREATE TABLE PRODUCTDATE
(PRODUCTDATEID  NUMBER(10)  NOT NULL
,FK_PRODUCTID   NUMBER(20)  NOT NULL
,PRODUCTPERIOD1 DATE        NOT NULL
,PRODUCTPERIOD2 DATE        NOT NULL
,CONSTRAINT FK_PRODUCTDATE_FK_PRODUCTID FOREIGN KEY(FK_PRODUCTID) REFERENCES PRODUCT(PRODUCTID)
);


CREATE TABLE LIKELIST
(LIKELISTID     NUMBER(30)      NOT NULL
,FK_MEMBERID    VARCHAR2(30)    NOT NULL 
,FK_PRODUCTID   NUMBER(20)      NOT NULL
,CHECKIN        DATE            NOT NULL
,CHECKOUT       DATE            NOT NULL
,CONSTRAINT PK_LIKELIST_LIKELISTID PRIMARY KEY(LIKELISTID)
,CONSTRAINT FK_LIKELIST_FK_MEMBERID FOREIGN KEY(FK_MEMBERID) REFERENCES MEMBER(MEMBERID)
,CONSTRAINT FK_LIKELIST_FK_PRODUCTID FOREIGN KEY(FK_PRODUCTID) REFERENCES PRODUCT(PRODUCTID)
);

CREATE SEQUENCE SEQ_LIKELIST_LIKELISTID
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;


CREATE TABLE RESERVE1
(RESERVEID      NUMBER(30)  NOT NULL
,FK_PRODUCTID   NUMBER(20)  NOT NULL
,PRICE          NUMBER(30)  NOT NULL
,RESERVEDATE    DATE    DEFAULT SYSDATE
,CONSTRAINT PK_RESERVE1_RESERVEID PRIMARY KEY(RESERVEID)
,CONSTRAINT FK_RESERVE1_FK_PRODUCTID FOREIGN KEY(FK_PRODUCTID) REFERENCES PRODUCT(PRODUCTID)
);

CREATE SEQUENCE SEQ_RESERVE1_RESERVEID
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;


CREATE TABLE RESERVE2
(FK_RESERVEID       NUMBER(30)  NOT NULL
,CHECKIN            DATE        NOT NULL
,CHECKOUT           DATE        NOT NULL
,NONIGHT            NUMBER(3)   NOT NULL
,CONSTRAINT FK_RESERVE2_FK_RESERVEID  FOREIGN KEY(FK_RESERVEID) REFERENCES RESERVE1(RESERVEID)
);



CREATE TABLE COUPON
(COUPONID           NUMBER(20)      NOT NULL
,FK_MEMBERID        VARCHAR2(30)    NOT NULL
,COUPONCODE         VARCHAR2(30)    NOT NULL
,COUPONVALIDITY1    DATE            NOT NULL
,COUPONVALIDITY2    DATE            NOT NULL
,COUPONTYPE         VARCHAR2(10)    NOT NULL
,COUPONDISCOUNT     NUMBER(2)       NOT NULL
,COUPONREG          DATE            DEFAULT SYSDATE
,CONSTRAINT PK_COUPON_COUPONID PRIMARY KEY(COUPONID)
,CONSTRAINT FK_COUPON_FK_MEMBERID  FOREIGN KEY(FK_MEMBERID) REFERENCES MEMBER(MEMBERID)
);

CREATE SEQUENCE SEQ_COUPON_COUPONID
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;


CREATE TABLE STATE_COUPON
(STATE_COUPONID     NUMBER(20)      NOT NULL
,FK_COUPONID        NUMBER(20)      NOT NULL
,FK_MEMBERID        VARCHAR2(30)    NOT NULL
,FK_PRODUCTID       NUMBER(20)      NOT NULL
,FK_RESERVEID       NUMBER(30)      NOT NULL
,CONSTRAINT PK_STATE_COUPON_COUPONID PRIMARY KEY(STATE_COUPONID)
,CONSTRAINT FK_STATE_COUPON_FK_COUPONID  FOREIGN KEY(FK_COUPONID)  REFERENCES COUPON(COUPONID)
,CONSTRAINT FK_STATE_COUPON_FK_MEMBERID  FOREIGN KEY(FK_MEMBERID)  REFERENCES MEMBER(MEMBERID)
,CONSTRAINT FK_STATE_COUPON_FK_PRODUCTID FOREIGN KEY(FK_PRODUCTID) REFERENCES PRODUCT(PRODUCTID)
,CONSTRAINT FK_STATE_COUPON_FK_RESERVEID FOREIGN KEY(FK_RESERVEID) REFERENCES RESERVE1(RESERVEID)
);

CREATE SEQUENCE SEQ_COUPON_STATE_COUPONID
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;

---------------------------------------------------------------------------------------------------------------------

----- 테이블 확인 -----------------

SELECT * FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE';

---- 테이블 정보 확인 ----

DESC MEMBER;
DESC STATE_COUPON;
DESC COUPON;
DESC RESERVE1;
DESC RESERVE2;
DESC LIKELIST;
DESC PRODUCTDATE;
DESC PRODUCTPIC;
DESC PRODUCT;
DESC MONTION;
DESC MCATEGORY;
DESC LONTION;
DESC LCATEGORY;
DESC REGION;
DESC LOGIN_MEMBER;

--- 테이블 제약조건 확인  'MEMBER' 에 테이블 명 ---

SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'MEMBER';


--------------------통계를 위한 회원 추가하기 (반복문) 마진수 2019-07-26 18:20 --------------------


DECLARE 
 V_CNT NUMBER(3) := 0;
 BEGIN 
   LOOP
    INSERT INTO MEMBER ( IDX , MEMBERID , NICKNAME , PWD , NAME , EMAIL , BRITHDAY , TEL ,  GENDER , REGISTERDAY ,  STATUS , GRADE , POINT , PICTURE , FINALLOGINDATE , FINALPWDATE )
    VALUES (SEQ_MEMBER_IDX.NEXTVAL , 'GODJINSOO'||V_CNT , '갓진수'||V_CNT , 'QWER1234$' , '마진수' , 'GODJINSOO'||V_CNT||'@NNAVER.COM' , '19930524' , '01026551290' , '1' , DEFAULT , DEFAULT , DEFAULT , DEFAULT , DEFAULT, DEFAULT ,DEFAULT  );
    V_CNT := V_CNT + 1;
   EXIT WHEN V_CNT > 20;
   END LOOP;
 END;

DECLARE 
 V_CNT NUMBER(3) := 41;
 BEGIN 
   LOOP
    INSERT INTO MEMBER ( IDX , MEMBERID , NICKNAME , PWD , NAME , EMAIL , BRITHDAY , TEL ,  GENDER , REGISTERDAY ,  STATUS , GRADE , POINT , PICTURE , FINALLOGINDATE , FINALPWDATE )
    VALUES (SEQ_MEMBER_IDX.NEXTVAL , 'GODJINSOO'||V_CNT , '갓진수'||V_CNT , 'QWER1234$' , '마진수' , 'GODJINSOO'||V_CNT||'@NNAVER.COM' , '19930524' , '01026551290' , '2' , DEFAULT , DEFAULT , DEFAULT , DEFAULT , DEFAULT, DEFAULT ,DEFAULT  );
    V_CNT := V_CNT + 1;
   EXIT WHEN V_CNT > 61;
   END LOOP;
 END;
 
 COMMIT;
 
 SELECT *
 FROM MEMBER;

-------------------------------------------------------------------------------------------------------------------------


-- 작성자명 : 정혜인  작성일자 : 2019.07.17


insert into LCATEGORY (LARGECATEGORYCODE, LARGECATEGORYNAME) values (10, '호텔');
insert into LCATEGORY (LARGECATEGORYCODE, LARGECATEGORYNAME) values (20, '리조트');
insert into LCATEGORY (LARGECATEGORYCODE, LARGECATEGORYNAME) values (30, '게스트하우스');
insert into LCATEGORY (LARGECATEGORYCODE, LARGECATEGORYNAME) values (40, '모텔');
insert into LCATEGORY (LARGECATEGORYCODE, LARGECATEGORYNAME) values (50, '펜션');
insert into LCATEGORY (LARGECATEGORYCODE, LARGECATEGORYNAME) values (60, '호스텔');

select *
from LCATEGORY

insert into LONTION (LARGECATEGORYONTIONCODE, FK_LARGECATEGORYCODE, NAME, BUSINESSTEL, ADDRESS, INFO, ONTIONTYPE) 
values (110, 10, '제주 신라 호텔', '0647355114', '제주특별자치도 서귀포시 색달동 중문관광로72번길 75', '세계자연문화유산인 제주의아름다운 풍광을 담은 리조트로써 그 명성을 쌓아가고 있는 제주신라호텔', '레스토랑, 발렛파킹');

insert into LONTION (LARGECATEGORYONTIONCODE, FK_LARGECATEGORYCODE, NAME, BUSINESSTEL, ADDRESS, INFO, ONTIONTYPE) 
values (120, 20, '제주 아모렉스 리조트', '0647110125', '제주특별자치도 제주시 도두일동 서해안로 216', '제주시에 위치한 3성급 아파트식 호텔, 헬스클럽 및 무료 키즈클럽 이용 가능', '헬스클럽, 키즈클럽');

insert into LONTION (LARGECATEGORYONTIONCODE, FK_LARGECATEGORYCODE, NAME, BUSINESSTEL, ADDRESS, INFO, ONTIONTYPE) 
values (130, 30, '뷰타워리조트', '0647438953', '제주특별자치도 제주시 도두이동 719-1', '제주에 있는 3성급 펜션', '라운지바');

insert into LONTION (LARGECATEGORYONTIONCODE, FK_LARGECATEGORYCODE, NAME, BUSINESSTEL, ADDRESS, INFO, ONTIONTYPE) 
values (140, 40, '코업시티호텔 성산', '0647809800', '제주특별자치도 서귀포시 성산읍 성산리 250', '해변에 자리한 3.5성급 호텔, 성산 일출봉에서 가까우며 레스토랑 이용 가능', '레스토랑');

insert into LONTION (LARGECATEGORYONTIONCODE, FK_LARGECATEGORYCODE, NAME, BUSINESSTEL, ADDRESS, INFO, ONTIONTYPE) 
values (150, 50, '더 클라우드 풀앤스파', '0647838366', '제주특별자치도 서귀포시 성산읍 성산리 308', '더클라우드 풀앤스파는 제주국제공항에서 차로 1시간 30분 거리에 위치해 있습니다.', '주차장');

insert into LONTION (LARGECATEGORYONTIONCODE, FK_LARGECATEGORYCODE, NAME, BUSINESSTEL, ADDRESS, INFO, ONTIONTYPE) 
values (160, 60, '미도 호스텔', '0647891234', '제주특별자치도 서귀포시 서귀동 258-2', '분위기 있고 조용한 감성 여행자숙소 Since 1977', '주차장');

commit;

select *
from LONTION